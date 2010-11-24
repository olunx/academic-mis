package cn.gdpu.action;

import cn.gdpu.service.ActivityResultService;
import cn.gdpu.vo.ActivityResult;

public class ActivityResultAction extends BaseAction {
	private ActivityResultService<ActivityResult, Integer> activityResultService;
	private ActivityResult activityResult;

	@Override
	public String add() {
		// TODO Auto-generated method stub
		return super.add();
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
		// TODO Auto-generated method stub
		return super.goAdd();
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

	public ActivityResultService<ActivityResult, Integer> getActivityResultService() {
		return activityResultService;
	}

	public void setActivityResultService(
			ActivityResultService<ActivityResult, Integer> activityResultService) {
		this.activityResultService = activityResultService;
	}

	public ActivityResult getActivityResult() {
		return activityResult;
	}

	public void setActivityResult(ActivityResult activityResult) {
		this.activityResult = activityResult;
	}

}
