package cn.gdpu.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import cn.gdpu.service.ActivityService;
import cn.gdpu.service.InstituteService;
import cn.gdpu.service.StudentService;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Activity;
import cn.gdpu.vo.Classes;
import cn.gdpu.vo.Institute;
import cn.gdpu.vo.Student;

public class StatisticsAction extends BaseAction {
	private StudentService<Student, Integer> studentService;
	private InstituteService<Institute, Integer> instituteService;
	private ActivityService<Activity, Integer> activityService;
	private PageBean pageBean;
	private int page;
	private int insId;
	private int clsId;
	private String airtime;
	private String deadtime;

	public String activist(){
		if(clsId == -1){
			pageBean = studentService.queryForPage("from Student s order by s.credit desc", 20, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
		}else if(clsId == 0){
			pageBean = studentService.queryForPage("from Student s where s.classes.institute = '" + insId + "' order by s.credit desc", 20, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
		}else if(clsId > 0){
			pageBean = studentService.queryForPage("from Student s where s.classes = '" + clsId + "' order by s.credit desc", 20, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
		}else{
			pageBean.setList(null);
		}
		
		List<Institute> institutes = instituteService.getAllEntity(Institute.class);
		
		Map<String, Map<String, Object>> map = new LinkedHashMap<String, Map<String, Object>>();
		
		Map<String, Object> insmap = new LinkedHashMap<String, Object>();
		Map<String, Integer> clsmap = new LinkedHashMap<String, Integer>();
		insmap.put("key", 0);
		insmap.put("defaultvalue", -1);
		clsmap.put("所有专业", -1);
		insmap.put("values", clsmap);
		map.put("所有学院", insmap);
		
		for(Institute institute: institutes){
			insmap = new LinkedHashMap<String, Object>();
			clsmap = new LinkedHashMap<String, Integer>();
			insmap.put("key", institute.getId());
			insmap.put("defaultvalue", 0);
			clsmap.put("所有专业", 0);
			for(Classes classes : institute.getClasses()){
				clsmap.put(classes.getName(), classes.getId());
			}
			
			insmap.put("values", clsmap);
			map.put(institute.getName(), insmap);
		}
        JSONObject jo = JSONObject.fromObject(map);
		getRequest().put("clsmap", jo);
		return "activist";
	}
	
	public String activity(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String toDay = sdf.format(new Date());
		String hql; 
		System.out.println("air : " + airtime + ", dead ：" + deadtime);
		if(airtime == null || airtime.equals("") || deadtime == null || deadtime.equals("") || Integer.parseInt(airtime) > Integer.parseInt(deadtime)){
			hql = "from Activity a where a.time >= str_to_date('" + toDay + "-01-01','%Y-%m-%d')";
		}else{
			hql = "from Activity a where a.time between str_to_date('" + airtime + "-01-01','%Y-%m-%d') and  str_to_date('" + deadtime + "-12-31','%Y-%m-%d') order by a.time desc";
		}

		System.out.println("hql : " + hql);
		pageBean = activityService.queryForPage(hql, 20, page);
		System.out.println("pageBean.size = " + pageBean.getList());
		if (pageBean.getList().isEmpty())
			pageBean.setList(null);
		return "activity";
	}
	
	//getter and setter

	public StudentService<Student, Integer> getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService<Student, Integer> studentService) {
		this.studentService = studentService;
	}

	public InstituteService<Institute, Integer> getInstituteService() {
		return instituteService;
	}

	public void setInstituteService(
			InstituteService<Institute, Integer> instituteService) {
		this.instituteService = instituteService;
	}

	public ActivityService<Activity, Integer> getActivityService() {
		return activityService;
	}

	public void setActivityService(
			ActivityService<Activity, Integer> activityService) {
		this.activityService = activityService;
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

	public int getInsId() {
		return insId;
	}

	public void setInsId(int insId) {
		this.insId = insId;
	}

	public int getClsId() {
		return clsId;
	}

	public void setClsId(int clsId) {
		this.clsId = clsId;
	}

	public String getAirtime() {
		return airtime;
	}

	public void setAirtime(String airtime) {
		this.airtime = airtime;
	}

	public String getDeadtime() {
		return deadtime;
	}

	public void setDeadtime(String deadtime) {
		this.deadtime = deadtime;
	}


}
