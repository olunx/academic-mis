package cn.gdpu.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import cn.gdpu.service.ActivityTypeService;
import cn.gdpu.service.AdminService;
import cn.gdpu.service.InstituteService;
import cn.gdpu.vo.ActivityType;
import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Classes;
import cn.gdpu.vo.Institute;

public class InstallAction extends BaseAction{
	private AdminService<Admin, Integer> adminService;
	private InstituteService<Institute, Integer> instituteService;
	private ActivityTypeService<ActivityType, Integer> activityTypeService;
	
	public String install(){
		List<Admin> admins = adminService.getAllEntity(Admin.class);
		if(admins.size() != 0){
			getRequest().put("error", "系统已经安装过了");
			return ERROR;
		}
		
		//初始化系统管理员
		Admin admin = new Admin();
		admin.setUsername("admin");
		admin.setPassword("admin");
		admin.setRealName("admin");
		admin.setPermission(1);
		admin.setRemark("系统管理员");
		adminService.addEntity(admin);
		
		//初始化学院与班级
		Classes cls1 = new Classes();
		cls1.setName("医药软件");
		Classes cls2 = new Classes();
		cls2.setName("医药信息");
		Classes cls3 = new Classes();
		cls3.setName("医学智能");
		Classes cls4 = new Classes();
		cls4.setName("生物医学");
		Set<Classes> clss = new HashSet<Classes>();
		clss.add(cls1);
		clss.add(cls2);
		clss.add(cls3);
		clss.add(cls4);
		Institute ins = new Institute();
		ins.setName("医药信息工程学院");
		ins.setClasses(clss);
		instituteService.addEntity(ins);
		
		//初始后活动类型
		ActivityType activityType = new ActivityType();
		activityType.setName("全国大学生文科计算机设计大赛");
		activityType.setLevel(4);
		activityType.setIntro("教育部全国大学生文科计算机设计大赛介绍...");
		activityTypeService.addEntity(activityType);
		
		return SUCCESS;
	}
	
	//getter and setter
	public AdminService<Admin, Integer> getAdminService() {
		return adminService;
	}
	public void setAdminService(AdminService<Admin, Integer> adminService) {
		this.adminService = adminService;
	}

	public InstituteService<Institute, Integer> getInstituteService() {
		return instituteService;
	}

	public void setInstituteService(
			InstituteService<Institute, Integer> instituteService) {
		this.instituteService = instituteService;
	}

	public ActivityTypeService<ActivityType, Integer> getActivityTypeService() {
		return activityTypeService;
	}

	public void setActivityTypeService(
			ActivityTypeService<ActivityType, Integer> activityTypeService) {
		this.activityTypeService = activityTypeService;
	}
}
