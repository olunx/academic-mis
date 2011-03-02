package cn.gdpu.action;

import cn.gdpu.service.ActivityTypeService;
import cn.gdpu.util.Log;
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
	private int id;
	
	@Override
	public String add() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager)getSession().get("user") : null;
		if(manager != null){
			if(atDto.getName() == null) return ERROR;
			activityType = activityTypeService.getActivityTypeByName(atDto.getName());
			if(activityType != null) return ERROR;
			ActivityType at = new ActivityType();
			at.setName(atDto.getName());
			at.setLevel(atDto.getLevel());
			at.setIntro(atDto.getIntro());
			Log.init(getClass()).info(manager.getRealName() + " 添加了学术活动类型 " + at.getName());
			activityTypeService.addEntity(at);
			
			Admin admin = manager instanceof Admin ? (Admin)manager : null;
			if(admin != null)
				return "admin_list";
			else
				return super.add();
		}
		return ERROR;
	}

	@Override
	public String delete() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager)getSession().get("user") : null;
		if(manager != null){
			activityType = activityTypeService.getEntity(ActivityType.class, id);
			if(activityType == null) return ERROR;
			activityTypeService.deleteEntity(ActivityType.class, activityType.getId());
			Log.init(getClass()).info(manager.getRealName() + " 删除了学术活动类型 " + activityType.getName());
			
			Admin admin = manager instanceof Admin ? (Admin)manager : null;
			if(admin != null)
				return "admin_list";
			else
				return super.delete();
		}
		return ERROR;
	}

	@Override
	public String deleteMany() {
		// TODO Auto-generated method stub
		return super.deleteMany();
	}

	@Override
	public String goAdd() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager)getSession().get("user") : null;
		if(manager != null){
			Admin admin = manager instanceof Admin ? (Admin)manager : null;
			if(admin != null)
				return "admin_addPage";
			else
				return super.goAdd();
		}
		return ERROR;
	}

	@Override
	public String goModify() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager)getSession().get("user") : null;
		if(manager != null){
			activityType = activityTypeService.getEntity(ActivityType.class, id);
			if(activityType == null) return "admin_list";
			Admin admin = manager instanceof Admin ? (Admin)manager : null;
			if(admin != null)
				return "admin_modifyPage";
			else
				return super.goModify();
		}
		return ERROR;
	}

	@Override
	public String list() {
		this.pageBean = this.activityTypeService.queryForPage(ActivityType.class, 10, page);
		if (pageBean.getList().isEmpty())
			pageBean.setList(null);
		
		if(getSession().get("user") instanceof Admin)
			return "admin_listPage";
		else
			return super.list();
	}

	@Override
	public String modify() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager)getSession().get("user") : null;
		if(manager != null){
			activityType = activityTypeService.getEntity(ActivityType.class, atDto.getId());
			if(activityType == null) return ERROR;
			activityType.setName(atDto.getName());
			activityType.setLevel(atDto.getLevel());
			activityType.setIntro(atDto.getIntro());
			Log.init(getClass()).info(manager.getRealName() + " 修改了学术活动类型 " + activityType.getName());
			activityTypeService.updateEntity(activityType);
			
			Admin admin = manager instanceof Admin ? (Admin)manager : null;
			if(admin != null)
				return "admin_list";
			else
				return super.modify();
		}
		return ERROR;
		
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
