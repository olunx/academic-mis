package cn.gdpu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.gdpu.dto.ActivityDto;
import cn.gdpu.service.ActivityService;
import cn.gdpu.service.ActivityTypeService;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Activity;
import cn.gdpu.vo.ActivityType;
import cn.gdpu.vo.Manager;

public class ActivityAction extends BaseAction {
	
	private ActivityService<Activity, Integer> activityService;
	private ActivityTypeService<ActivityType, Integer> activityTypeService;
	private Activity activity;
	private ActivityDto acDto;
	private PageBean pageBean;
	private int page;
	
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
	public String add() {
		Manager manager = (Manager) getSession().get("manager");
		if(manager != null){
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
		// TODO Auto-generated method stub
		return super.modify();
	}

	@Override
	public String view() {
		// TODO Auto-generated method stub
		return super.view();
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

}
