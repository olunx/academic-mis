package cn.gdpu.action;

import cn.gdpu.service.ActivityTypeService;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.ActivityType;
import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Manager;

public class ActivityTypeAction extends BaseAction {
	
	private ActivityTypeService<ActivityType, Integer> activityTypeService;
	private ActivityType activityType;
	private ActivityType atDto;
	private PageBean pageBean;
	private int page;
	
	@Override
	public String add() {
		Manager manager = (Manager) getSession().get("manager");
		Admin admin = manager instanceof Admin ? (Admin)manager : null;
		if(admin != null){
			if(atDto.getName() == null) return ERROR;
			activityType = activityTypeService.getActivityTypeByName(atDto.getName());
			if(activityType != null) return ERROR;
			ActivityType at = new ActivityType();
			at.setName(atDto.getName());
			at.setLevel(atDto.getLevel());
			at.setIntro(atDto.getIntro());
			activityTypeService.addEntity(at);
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
		Admin admin = manager instanceof Admin ? (Admin)manager : null;
		if(admin != null){
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
		Admin admin = manager instanceof Admin ? (Admin)manager : null;
		if(admin != null){
			this.pageBean = this.activityTypeService.queryForPage(ActivityType.class, 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);

			return super.list();
		}
		return ERROR;
		
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
	public ActivityTypeService<ActivityType, Integer> getActivityTypeService() {
		return activityTypeService;
	}

	public void setActivityTypeService(
			ActivityTypeService<ActivityType, Integer> activityTypeService) {
		this.activityTypeService = activityTypeService;
	}

	public ActivityType getActivityType() {
		return activityType;
	}

	public void setActivityType(ActivityType activityType) {
		this.activityType = activityType;
	}

	public ActivityType getAtDto() {
		return atDto;
	}

	public void setAtDto(ActivityType atDto) {
		this.atDto = atDto;
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

}
