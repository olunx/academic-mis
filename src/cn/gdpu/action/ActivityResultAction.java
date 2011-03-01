package cn.gdpu.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import cn.gdpu.service.ActivityApplyService;
import cn.gdpu.service.ActivityResultService;
import cn.gdpu.service.SingleApplyService;
import cn.gdpu.service.StudentService;
import cn.gdpu.service.TeamApplyService;
import cn.gdpu.util.Log;
import cn.gdpu.vo.ActivityApply;
import cn.gdpu.vo.ActivityResult;
import cn.gdpu.vo.Manager;
import cn.gdpu.vo.SingleApply;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.TeamApply;

@SuppressWarnings("serial")
public class ActivityResultAction extends BaseAction {
	
	private ActivityResultService<ActivityResult, Integer> activityResultService;
	private ActivityApplyService<ActivityApply, Integer> activityApplyService;
	private SingleApplyService<SingleApply, Integer> singleApplyService;
	private TeamApplyService<TeamApply, Integer> teamApplyService;
	private StudentService<Student, Integer> studentService;
	private ActivityResult activityResult;
	private ActivityApply activityApply;
	private ActivityResult arDto;
	private int id;

	@Override
	public String add() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			activityApply = activityApplyService.getEntity(ActivityApply.class, id);
			if(activityApply == null) return ERROR;
			if(activityApply.getActivityResult() != null) return ERROR;
			ActivityResult ar = new ActivityResult();
			ar.setPrize(arDto.getPrize());
			ar.setName(arDto.getName());
			ar.setCredit(arDto.getCredit());
			ar.setRemark(arDto.getRemark());
			ar.setAwarder(activityApply);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			ar.setRecord(sdf.format(new Date()) + " : " + manager.getRealName() + " 添加了比赛结果;");
			activityResultService.addEntity(ar);
			Log.init(getClass()).info(manager.getRealName() + " 添加了比赛:" + activityApply.getActivity().getName() + "-" + activityApply + " 结果;");
			
			//学分 加分
			if(activityApply.getActivity().getApplyCount() == 1){
				Student student = activityApply.getApplicant();
				student.setCredit(student.getCredit() + ar.getCredit());
				studentService.updateEntity(student);
			}else{
				TeamApply teamApply = teamApplyService.getEntity(TeamApply.class, activityApply.getId());
				for (Student student : teamApply.getApplicants()) {
					student.setCredit(student.getCredit() + ar.getCredit());
					studentService.updateEntity(student);
				}
			}
			return "save";
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
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			return super.goAdd();
		}
		return ERROR;
	}

	@Override
	public String goModify() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(id == 0) return ERROR;
			activityResult = activityResultService.getEntity(ActivityResult.class, id);
			return super.goModify();
		}
		return ERROR;
	}

	@Override
	public String list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	public String modify() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(id == 0) return ERROR;
			activityResult = activityResultService.getEntity(ActivityResult.class, id);
			double preCredit = activityResult.getCredit();	//先前的学分
			activityResult.setPrize(arDto.getPrize());
			activityResult.setName(arDto.getName());
			activityResult.setCredit(arDto.getCredit());
			activityResult.setRemark(arDto.getRemark());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			activityResult.setRecord(arDto.getRecord() + sdf.format(new Date()) + " : " + manager.getRealName() + " 修改了比赛结果;");
			activityResultService.updateEntity(activityResult);
			Log.init(getClass()).info(manager.getRealName() + " 修改了比赛:" + activityResult.getAwarder().getActivity().getName() + "-" + activityResult.getAwarder() + " 结果;");
			activityApply = activityResult.getAwarder();
			
			//学分 加分
			if(activityApply.getActivity().getApplyCount() == 1){
				Student student = activityApply.getApplicant();
				student.setCredit(student.getCredit() - preCredit + activityResult.getCredit());
				studentService.updateEntity(student);
			}else{
				TeamApply teamApply = teamApplyService.getEntity(TeamApply.class, activityApply.getId());
				for (Student student : teamApply.getApplicants()) {
					student.setCredit(student.getCredit() - preCredit + activityResult.getCredit());
					studentService.updateEntity(student);
				}
			}
			return "save";
		}
		return ERROR;
	}

	@Override
	public String view() {
		// TODO Auto-generated method stub
		return super.view();
	}
	
	//getter and setter

	public ActivityResultService<ActivityResult, Integer> getActivityResultService() {
		return activityResultService;
	}

	public void setActivityResultService(
			ActivityResultService<ActivityResult, Integer> activityResultService) {
		this.activityResultService = activityResultService;
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

	public StudentService<Student, Integer> getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService<Student, Integer> studentService) {
		this.studentService = studentService;
	}

	public ActivityResult getActivityResult() {
		return activityResult;
	}

	public void setActivityResult(ActivityResult activityResult) {
		this.activityResult = activityResult;
	}

	public ActivityApply getActivityApply() {
		return activityApply;
	}

	public void setActivityApply(ActivityApply activityApply) {
		this.activityApply = activityApply;
	}

	public ActivityResult getArDto() {
		return arDto;
	}

	public void setArDto(ActivityResult arDto) {
		this.arDto = arDto;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
