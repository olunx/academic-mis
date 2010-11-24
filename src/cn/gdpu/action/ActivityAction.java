package cn.gdpu.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import cn.gdpu.dto.ActivityDto;
import cn.gdpu.dto.ApplyDto;
import cn.gdpu.service.ActivityApplyService;
import cn.gdpu.service.ActivityService;
import cn.gdpu.service.ActivityTypeService;
import cn.gdpu.service.GroupService;
import cn.gdpu.service.StudentService;
import cn.gdpu.util.Log;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Activity;
import cn.gdpu.vo.ActivityApply;
import cn.gdpu.vo.ActivityType;
import cn.gdpu.vo.Group;
import cn.gdpu.vo.Manager;
import cn.gdpu.vo.SingleApply;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.TeamApply;

public class ActivityAction extends BaseAction {
	
	private ActivityService<Activity, Integer> activityService;
	private ActivityTypeService<ActivityType, Integer> activityTypeService;
	private ActivityApplyService<ActivityApply, Integer> activityApplyService;
	private StudentService<Student, Integer> studentService;
	private GroupService<Group, Integer> groupService;
	private Activity activity;
	private ActivityApply activityApply;
	private ActivityDto acDto;
	private ApplyDto apDto;
	private PageBean pageBean;
	private int page;
	private int id;
	private int applytype;
	
	public void prepare() throws Exception {
		HttpServletRequest httpRequest = (HttpServletRequest) ServletActionContext.getRequest();
		String action=  httpRequest.getServletPath().split("/")[1];
		String[] uri=action.split("\\.");
		if(uri[0].equals("add")){
			List<ActivityType> ats = activityTypeService.getAllEntity(ActivityType.class);
			getRequest().put("ats", ats);
		}
		if(uri[0].equals("apply")){
			Student student = (Student) getSession().get("student");
			if(student != null){
				student = studentService.getEntity(Student.class, student.getId());
				Map<String, Map<String, Object>> map = new LinkedHashMap<String, Map<String, Object>>();
				for(Group group: student.getMyGroups()){
					Map<String, Object> grpmap = new LinkedHashMap<String, Object>();
					Map<String, Integer> stumap = new LinkedHashMap<String, Integer>();
					grpmap.put("key", group.getId());
					grpmap.put("defaultvalue", group.getMembers().iterator().next().getId());
					for(Student stu : group.getMembers()){
						stumap.put(stu.getRealName(), stu.getId());
					}
					
					grpmap.put("values", stumap);
					map.put(group.getName(), grpmap);
				}
		        JSONObject jo = JSONObject.fromObject(map);
				getRequest().put("applymap", jo);
			}
		}
	}
	
	@Override
	public String add(){
		Manager manager = (Manager) getSession().get("manager");
		if(manager != null){
			ActivityType at = activityTypeService.getEntity(ActivityType.class, acDto.getActivityType());
			if(at == null) return ERROR;
			activity = new Activity();
			activity.setName(acDto.getName());
			activity.setSession(acDto.getSession());
			activity.setIntro(acDto.getIntro());
			activity.setActivityType(at);
			activity.setApplyCount(acDto.getApplyCount());
			activity.setOpusNeed(acDto.getOpusNeed());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = null;
			try {
				date = sdf.parse(acDto.getAirtime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if(date == null) return ERROR;
			activity.setAirtime(date);
			date = null;
			try {
				date = sdf.parse(acDto.getDeadtime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if(date == null) return ERROR;
			activity.setDeadtime(date);
			activity.setTime(new Date());
			activity.setPublisher(manager);
			activityService.addEntity(activity);
			Log.init(getClass()).info(manager.getRealName() + " 添加学术活动  " + activity.getName() +  " 成功!");
			return super.add();
		}
		return ERROR;
	}

	@Override
	public String delete() {
		// TODO Auto-generated method stub
		return super.delete();
	}

	@Override
	public String deleteMany() {
		// TODO Auto-generated method stub
		return super.deleteMany();
	}

	@Override
	public String goAdd() {
		Manager manager = (Manager) getSession().get("manager");
		if(manager != null){
			List<ActivityType> ats = activityTypeService.getAllEntity(ActivityType.class);
			getRequest().put("ats", ats);
			return super.goAdd();
		}
		return ERROR;
	}

	@Override
	public String goModify() {
		// TODO Auto-generated method stub
		return super.goModify();
	}

	@Override
	public String list() {
		this.pageBean = this.activityService.queryForPage(Activity.class, 10, page);
		if (pageBean.getList().isEmpty())
			pageBean.setList(null);

		return super.list();
		
	}

	@Override
	public String modify() {
		Manager manager = (Manager) getSession().get("manager");
		if(manager != null){
			return super.modify();
		}
		return ERROR;
	}

	@Override
	public String view() {
		if(id == 0) return ERROR;
		activity = activityService.getEntity(Activity.class, id);
		return super.view();
	}
	
	public String goApply(){
		Student student = (Student) getSession().get("student");
		if(student != null){
			student = studentService.getEntity(Student.class, student.getId());
			if(student.getMyGroups() == null) return "applyPage";
			Map<String, Map<String, Object>> map = new LinkedHashMap<String, Map<String, Object>>();
			for(Group group: student.getMyGroups()){
				Map<String, Object> grpmap = new LinkedHashMap<String, Object>();
				Map<String, Integer> stumap = new LinkedHashMap<String, Integer>();
				grpmap.put("key", group.getId());
				grpmap.put("defaultvalue", group.getMembers().iterator().next().getId());
				for(Student stu : group.getMembers()){
					stumap.put(stu.getRealName(), stu.getId());
				}
				
				grpmap.put("values", stumap);
				map.put(group.getName(), grpmap);
			}
	        JSONObject jo = JSONObject.fromObject(map);
			getRequest().put("applymap", jo);
			activity = activityService.getEntity(Activity.class, id);
			return "applyPage";
		}
		return ERROR;
	}
	
	public String apply(){
		Student student = (Student) getSession().get("student");
		if(student != null){
			if(applytype == 1){
				activity = activityService.getEntity(Activity.class, id);
				Date toDay = new Date();
				//检查是否不在报名时间内
				if(toDay.getTime() < activity.getAirtime().getTime() || toDay.getTime() > activity.getDeadtime().getTime()) return "timeout";
				Set<ActivityApply> activityApplys = activity.getActivityApplys();
				if(activityApplys == null ) activityApplys = new HashSet<ActivityApply>();
				for (ActivityApply aa : activityApplys) {
					SingleApply singleApply = (SingleApply) aa;
					if(singleApply.getStudent().getId() == student.getId()) return ERROR;      //已经存在申请
				}
 				SingleApply sa = new SingleApply();
				sa.setActivity(activity);
				sa.setStudent(student);
				sa.setStatus(1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				sa.setApplytime(toDay);
				sa.setRecord(sdf.format(toDay) + " : " + student.getRealName() + " 报名 " + activity.getName());
				activityApplys.add(sa);
				activity.setActivityApplys(activityApplys);
				activityService.updateEntity(activity);
				Log.init(getClass()).info(sdf.format(toDay) + " : " + student.getRealName() + " 报名 " + activity.getName());
				return "check";
			}else{
				activity = activityService.getEntity(Activity.class, apDto.getActivity());
				Date toDay = new Date();
				//检查是否不在报名时间内
				if(toDay.getTime() < activity.getAirtime().getTime() || toDay.getTime() > activity.getDeadtime().getTime()) return "timeout";
				Group group = groupService.getEntity(Group.class, apDto.getGroup());
				Set<ActivityApply> activityApplys = activity.getActivityApplys();
				if(activityApplys == null ) activityApplys = new HashSet<ActivityApply>();
				for (ActivityApply aa : activityApplys) {
					TeamApply teamApply = (TeamApply) aa;
					if(teamApply.getGroup().getId() == apDto.getGroup()) return ERROR;       //该小组已经申请
				}
				TeamApply ta = new TeamApply();
				ta.setActivity(activity);
				ta.setGroup(group);
				Set<Student> applicants = new HashSet<Student>();
				for (int id : apDto.getApplicants()) {
					student = studentService.getEntity(Student.class, id);
					applicants.add(student);
				}
				ta.setApplicants(applicants);
				ta.setStatus(1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				ta.setApplytime(toDay);
				ta.setRecord(sdf.format(toDay) + " : " + student.getRealName() + "代表小组:" + group.getName() + " 报名 " + activity.getName());
				activityApplys.add(ta);
				activity.setActivityApplys(activityApplys);
				activityService.updateEntity(activity);
				Log.init(getClass()).info(sdf.format(toDay) + " : " + student.getRealName() + "代表小组:" + group.getName() + " 报名 " + activity.getName());
				return "check";
			}
		}
		return ERROR;
	}
	
	/**
	 * 查看正在审核申请的活动
	 */
	public String listApply() {
		Student student = (Student) this.getSession().get("student");
		if(student != null){
			this.pageBean = this.activityApplyService.queryForPage("from ActivityApply aa where (aa.student.id = '" + student.getId() + "') or ('" + student.getId() + "' = some elements(aa.applicants))", 10, page);
			
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			getRequest().put("listType", "listsingleapply");
			return "listapply";
		}
		return ERROR;
	}
	
	/**
	 * 管理人员通过报名审核
	 */
	public String passApply(){
		Manager manager = (Manager) getSession().get("manager");
		if(manager != null){
			activityApply = activityApplyService.getEntity(ActivityApply.class, id);
			if(activityApply == null) return ERROR;
			activityApply.setStatus(2);	//1==申请 2==通过 3==拒绝
			activityApply.setOperator(manager);
			activityApply.setEndtime(new Date());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			activityApply.setRecord(activityApply.getRecord() + "; " + sdf.format(new Date()) + " : " + manager.getRealName() + "通过该报名");
			activityApplyService.updateEntity(activityApply);
			Log.init(getClass()).info(sdf.format(new Date()) + " : " + manager.getRealName() + "通过该报名");
			return "audit";
		}
		return ERROR;
	}
	
	/**
	 * 管理人员拒绝报名审核
	 */
	public String refuseApply(){
		Manager manager = (Manager) getSession().get("manager");
		if(manager != null){
			ActivityApply aa = activityApplyService.getEntity(ActivityApply.class, id);
			if(aa == null) return ERROR;
			aa.setStatus(3);	//1==申请 2==通过 3==拒绝
			aa.setOperator(manager);
			aa.setEndtime(new Date());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			aa.setRecord(aa.getRecord() + "; " + sdf.format(new Date()) + " : " + manager.getRealName() + "拒绝该报名");
			getRequest().put("activityId", aa.getActivity().getId());
			activityApplyService.updateEntity(aa);
			Log.init(getClass()).info(sdf.format(new Date()) + " : " + manager.getRealName() + "拒绝该报名");
			return "audit";
		}
		return ERROR;
	}
	
	

	
	//getter and setter

	public ActivityService<Activity, Integer> getActivityService() {
		return activityService;
	}

	public void setActivityService(
			ActivityService<Activity, Integer> activityService) {
		this.activityService = activityService;
	}

	public ActivityTypeService<ActivityType, Integer> getActivityTypeService() {
		return activityTypeService;
	}

	public void setActivityTypeService(
			ActivityTypeService<ActivityType, Integer> activityTypeService) {
		this.activityTypeService = activityTypeService;
	}

	public ActivityApplyService<ActivityApply, Integer> getActivityApplyService() {
		return activityApplyService;
	}

	public void setActivityApplyService(
			ActivityApplyService<ActivityApply, Integer> activityApplyService) {
		this.activityApplyService = activityApplyService;
	}

	public StudentService<Student, Integer> getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService<Student, Integer> studentService) {
		this.studentService = studentService;
	}

	public GroupService<Group, Integer> getGroupService() {
		return groupService;
	}

	public void setGroupService(GroupService<Group, Integer> groupService) {
		this.groupService = groupService;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public ActivityApply getActivityApply() {
		return activityApply;
	}

	public void setActivityApply(ActivityApply activityApply) {
		this.activityApply = activityApply;
	}

	public ActivityDto getAcDto() {
		return acDto;
	}

	public void setAcDto(ActivityDto acDto) {
		this.acDto = acDto;
	}

	public ApplyDto getApDto() {
		return apDto;
	}

	public void setApDto(ApplyDto apDto) {
		this.apDto = apDto;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getApplytype() {
		return applytype;
	}

	public void setApplytype(int applytype) {
		this.applytype = applytype;
	}

}
