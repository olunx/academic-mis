package cn.gdpu.action;

import cn.gdpu.dto.OpusDto;
import cn.gdpu.service.ActivityApplyService;
import cn.gdpu.service.OpusService;
import cn.gdpu.service.TeacherService;
import cn.gdpu.util.Log;
import cn.gdpu.vo.ActivityApply;
import cn.gdpu.vo.Opus;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.Teacher;

public class OpusAction extends BaseAction {
	private OpusService<Opus, Integer> opusService;
	private ActivityApplyService<ActivityApply, Integer> activityApplyService;
	private TeacherService<Teacher, Integer> teacherService;
	private Opus opus;
	private OpusDto opusDto;
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
		// TODO Auto-generated method stub
		return super.goModify();
	}

	@Override
	public String list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	public String modify() {
		// TODO Auto-generated method stub
		return super.modify();
	}

	@Override
	public String view() {
		// TODO Auto-generated method stub
		return super.view();
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
