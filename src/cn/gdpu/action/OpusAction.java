package cn.gdpu.action;

import cn.gdpu.dto.OpusDto;
import cn.gdpu.jstl.OpusFunctions;
import cn.gdpu.service.ActivityApplyService;
import cn.gdpu.service.OpusService;
import cn.gdpu.service.SingleApplyService;
import cn.gdpu.service.TeacherService;
import cn.gdpu.service.TeamApplyService;
import cn.gdpu.util.Log;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.ActivityApply;
import cn.gdpu.vo.Opus;
import cn.gdpu.vo.SingleApply;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.Teacher;
import cn.gdpu.vo.TeamApply;

public class OpusAction extends BaseAction {
	private OpusService<Opus, Integer> opusService;
	private ActivityApplyService<ActivityApply, Integer> activityApplyService;
	private SingleApplyService<SingleApply, Integer> singleApplyService;
	private TeamApplyService<TeamApply, Integer> teamApplyService;
	private TeacherService<Teacher, Integer> teacherService;
	private Opus opus;
	private OpusDto opusDto;
	private PageBean pageBean;
	private int page;
	private int id;

	@Override
	public String add() {
		Student student = (Student) getSession().get("student");
		if(student != null && id != 0){
			ActivityApply aa = activityApplyService.getEntity(ActivityApply.class, id);
			if(aa == null || aa.getOpus() != null) return ERROR;
			opus = new Opus();
			opus.setActivityApply(aa);
			opus.setName(opusDto.getName());
			opus.setIntro(opusDto.getIntro());
			if(opusDto.getInstructor() != null && !opusDto.getInstructor().equals("")){
				Teacher teacher = teacherService.getTeacherByTnum(opusDto.getInstructor());
				if(teacher != null) opus.setInstructor(teacher);
			}
			opusService.addEntity(opus);
			Log.init(getClass()).info(student.getRealName() + " 学生给 " + aa.getActivity().getName() + " 活动添加了作品: " + opus.getName());
			return "add";
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
		Student student = (Student) getSession().get("student");
		if(student != null){
			return super.goAdd();
		}
		return ERROR;
	}

	@Override
	public String goModify() {
		opus = opusService.getEntity(Opus.class, id);
		if(opus != null){
			return super.goModify();
		}
		return ERROR;
	}

	@Override
	public String list() {
		this.pageBean = opusService.queryForPage(Opus.class, 10, page);
		if (pageBean.getList().isEmpty())
			pageBean.setList(null);
		getRequest().put("listtype", "list");
		return super.list();
	}
	
	public String listMyCmt() {//
		Teacher teacher = (Teacher) getSession().get("teacher");
		if(teacher != null){
			this.pageBean = opusService.queryForPage("from Opus o where '" + teacher + "' = some elements(o.comments)", 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			getRequest().put("listtype", "listMyCmt");
			return super.list();
		}
		return ERROR;
	}

	
	
	@Override
	public String modify() {
		Student student = (Student) getSession().get("student");
		if(student != null && id != 0){
			opus = opusService.getEntity(Opus.class, id);
			//查看权限
			ActivityApply aa;
			if(opus.getActivityApply().getActivity().getApplyCount() == 1){
				aa = singleApplyService.getEntity(SingleApply.class, opus.getActivityApply().getId());
			}else{
				aa = teamApplyService.getEntity(TeamApply.class, opus.getActivityApply().getId());
			}
			if(aa == null) return ERROR;
			if(!OpusFunctions.isMyOpus(aa, student)) return ERROR;
			opus.setName(opusDto.getName());
			opus.setIntro(opusDto.getIntro());
			if(opusDto.getInstructor() != null && !opusDto.getInstructor().equals("")){
				Teacher teacher = teacherService.getTeacherByTnum(opusDto.getInstructor());
				if(teacher != null) opus.setInstructor(teacher);
			}
			opusService.updateEntity(opus);
			Log.init(getClass()).info(student.getRealName() + " 学生给 " + aa.getActivity().getName() + " 活动修改了作品: " + opus.getName());
			return "add";
		}
		return ERROR;
	}

	@Override
	public String view() {
		opus = opusService.getEntity(Opus.class, id);
		if(opus != null){
			if(opus.getActivityApply().getActivity().getApplyCount() == 1){
				 SingleApply sa = singleApplyService.getEntity(SingleApply.class, opus.getActivityApply().getId());
				getRequest().put("activityApply", sa);
			}else{
				TeamApply ta = teamApplyService.getEntity(TeamApply.class, opus.getActivityApply().getId());
				getRequest().put("activityApply", ta);
			}
			return super.view();
		}
		return ERROR;
	}

	
	//getter and setter
	
	public OpusService<Opus, Integer> getOpusService() {
		return opusService;
	}

	public void setOpusService(OpusService<Opus, Integer> opusService) {
		this.opusService = opusService;
	}

	public ActivityApplyService<ActivityApply, Integer> getActivityApplyService() {
		return activityApplyService;
	}

	public void setActivityApplyService(
			ActivityApplyService<ActivityApply, Integer> activityApplyService) {
		this.activityApplyService = activityApplyService;
	}

	public SingleApplyService<SingleApply, Integer> getSingleApplyService() {
		return singleApplyService;
	}

	public void setSingleApplyService(
			SingleApplyService<SingleApply, Integer> singleApplyService) {
		this.singleApplyService = singleApplyService;
	}

	public TeamApplyService<TeamApply, Integer> getTeamApplyService() {
		return teamApplyService;
	}

	public void setTeamApplyService(
			TeamApplyService<TeamApply, Integer> teamApplyService) {
		this.teamApplyService = teamApplyService;
	}

	public TeacherService<Teacher, Integer> getTeacherService() {
		return teacherService;
	}

	public void setTeacherService(TeacherService<Teacher, Integer> teacherService) {
		this.teacherService = teacherService;
	}

	public Opus getOpus() {
		return opus;
	}

	public void setOpus(Opus opus) {
		this.opus = opus;
	}

	public OpusDto getOpusDto() {
		return opusDto;
	}

	public void setOpusDto(OpusDto opusDto) {
		this.opusDto = opusDto;
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
