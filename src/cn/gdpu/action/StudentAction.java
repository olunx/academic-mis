package cn.gdpu.action;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;


import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import cn.gdpu.service.ClassesService;
import cn.gdpu.service.InstituteService;
import cn.gdpu.util.Log;
import cn.gdpu.vo.Classes;
import cn.gdpu.vo.Institute;
import cn.gdpu.vo.Student;

@SuppressWarnings("serial")
public class StudentAction extends BaseAction {

	private InstituteService<Institute, Integer> instituteService;
	private ClassesService<Classes, Integer> classesService;

	public void prepare() throws Exception {
		HttpServletRequest httpRequest = (HttpServletRequest) ServletActionContext.getRequest();
		String action=  httpRequest.getServletPath().split("/")[1];
		String[] uri=action.split("\\.");
		if(uri[0].equals("add")){
			List<Institute> institutes = instituteService.getAllEntity(Institute.class);
			
			Map<String, Map<String, Object>> map = new LinkedHashMap<String, Map<String, Object>>();
			for(Institute institute: institutes){
				Map<String, Object> insmap = new LinkedHashMap<String, Object>();
				Map<String, Integer> clsmap = new LinkedHashMap<String, Integer>();
				insmap.put("key", institute.getId());
				insmap.put("defaultvalue", institute.getClasses().iterator().next().getId());
				for(Classes classes : institute.getClasses()){
					clsmap.put(classes.getName(), classes.getId());
				}
				
				insmap.put("values", clsmap);
				map.put(institute.getName(), insmap);
			}
	        JSONObject jo = JSONObject.fromObject(map);
			getRequest().put("clsmap", jo);
		}
	}
	
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
		List<Institute> institutes = instituteService.getAllEntity(Institute.class);
		
		Map<String, Map<String, Object>> map = new LinkedHashMap<String, Map<String, Object>>();
		for(Institute institute: institutes){
			Map<String, Object> insmap = new LinkedHashMap<String, Object>();
			Map<String, Integer> clsmap = new LinkedHashMap<String, Integer>();
			insmap.put("key", institute.getId());
			insmap.put("defaultvalue", institute.getClasses().iterator().next().getId());
			for(Classes classes : institute.getClasses()){
				clsmap.put(classes.getName(), classes.getId());
			}
			
			insmap.put("values", clsmap);
			map.put(institute.getName(), insmap);
		}
        JSONObject jo = JSONObject.fromObject(map);
		getRequest().put("clsmap", jo);
		
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
	public InstituteService<Institute, Integer> getInstituteService() {
		return instituteService;
	}

	public void setInstituteService(
			InstituteService<Institute, Integer> instituteService) {
		this.instituteService = instituteService;
	}

	public ClassesService<Classes, Integer> getClassesService() {
		return classesService;
	}

	public void setClassesService(ClassesService<Classes, Integer> classesService) {
		this.classesService = classesService;
	}
}
