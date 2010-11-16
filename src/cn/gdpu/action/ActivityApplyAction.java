package cn.gdpu.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.gdpu.dto.ActivityDto;
import cn.gdpu.service.ActivityService;
import cn.gdpu.service.ActivityTypeService;
import cn.gdpu.util.Log;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Activity;
import cn.gdpu.vo.ActivityType;
import cn.gdpu.vo.Manager;

public class ActivityApplyAction extends BaseAction {
	
	private ActivityService<Activity, Integer> activityService;
	private ActivityTypeService<ActivityType, Integer> activityTypeService;
	private Activity activity;
	private ActivityDto acDto;
	private PageBean pageBean;
	private int page;
	private int id;
	
	public void prepare() throws Exception {
		HttpServletRequest httpRequest = (HttpServletRequest) ServletActionContext.getRequest();
		String action=  httpRequest.getServletPath().split("/")[1];
		String[] uri=action.split("\\.");
		if(uri[0].equals("add")){
			List<ActivityType> ats = activityTypeService.getAllEntity(ActivityType.class);
			getRequest().put("ats", ats);
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
		Manager manager = (Manager) getSession().get("manager");
		if(manager != null){
			this.pageBean = this.activityService.queryForPage(Activity.class, 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);

			return super.list();
		}
		return ERROR;
		
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
		Manager manager = (Manager) getSession().get("manager");
		if(manager != null){
			if(id == 0) return ERROR;
			activity = activityService.getEntity(Activity.class, id);
			return super.view();
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

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public ActivityDto getAcDto() {
		return acDto;
	}

	public void setAcDto(ActivityDto acDto) {
		this.acDto = acDto;
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

}
