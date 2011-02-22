package cn.gdpu.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import cn.gdpu.service.ActivityApplyService;
import cn.gdpu.service.ActivityResultService;
import cn.gdpu.util.Log;
import cn.gdpu.vo.ActivityApply;
import cn.gdpu.vo.ActivityResult;
import cn.gdpu.vo.Manager;

@SuppressWarnings("serial")
public class ActivityResultAction extends BaseAction {
	
	private ActivityResultService<ActivityResult, Integer> activityResultService;
	private ActivityApplyService<ActivityApply, Integer> activityApplyService;
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
			ar.setRemark(arDto.getRemark());
			ar.setAwarder(activityApply);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			ar.setRecord(sdf.format(new Date()) + " : " + manager.getRealName() + " 添加了比赛结果;");
			activityResultService.addEntity(ar);
			Log.init(getClass()).info(manager.getRealName() + " 添加了比赛:" + activityApply.getActivity().getName() + "-" + activityApply + " 结果;");
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
			activityResult.setPrize(arDto.getPrize());
			activityResult.setName(arDto.getName());
			activityResult.setRemark(arDto.getRemark());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			activityResult.setRecord(arDto.getRecord() + sdf.format(new Date()) + " : " + manager.getRealName() + " 修改了比赛结果;");
			activityResultService.updateEntity(activityResult);
			Log.init(getClass()).info(manager.getRealName() + " 修改了比赛:" + activityResult.getAwarder().getActivity().getName() + "-" + activityResult.getAwarder() + " 结果;");
			activityApply = activityResult.getAwarder();
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
