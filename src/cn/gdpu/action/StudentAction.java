package cn.gdpu.action;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Preparable;

import cn.gdpu.dto.StudentDto;
import cn.gdpu.service.ClassesService;
import cn.gdpu.service.InstituteService;
import cn.gdpu.service.StudentService;
import cn.gdpu.service.ActivityApplyService;
import cn.gdpu.util.Log;
import cn.gdpu.util.Md5;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.ActivityApply;
import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Classes;
import cn.gdpu.vo.Institute;
import cn.gdpu.vo.Manager;
import cn.gdpu.vo.Student;

@SuppressWarnings("serial")
public class StudentAction extends BaseAction implements Preparable {

	private InstituteService<Institute, Integer> instituteService;
	private ClassesService<Classes, Integer> classesService;
	private StudentService<Student, Integer> studentService;
	private ActivityApplyService<ActivityApply, Integer> activityApplyService;
	private StudentDto stuDto;
	private Student student;
	private PageBean pageBean;
	private int page;
	private int id;

	@Override
	public void prepare() throws Exception {
		HttpServletRequest httpRequest = (HttpServletRequest) ServletActionContext.getRequest();
		String action=  httpRequest.getServletPath().split("/")[2];
		String[] uri = action.split("\\.");
		if(uri[0].equals("goAddStudent") || uri[0].equals("addStudent")){
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
		if(uri[0].equals("goModifyStudent") || uri[0].equals("modifyStudent") || uri[0].equals("modifyPswStudent")){//待修改
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
		if(stuDto.getUsername() != null && !stuDto.getUsername().equals("") 
				&& stuDto.getPassword() != null && !stuDto.getPassword().equals("") 
				&& stuDto.getRpassword() != null && !stuDto.getRpassword().equals("")
				&& stuDto.getPassword().equals(stuDto.getRpassword())){
			
			Student oldStu = studentService.getStudentByUsername(stuDto.getUsername());
			if(oldStu != null){
				this.addFieldError("stuDto.username", "该用户名已存在");
				if (hasFieldErrors()) {
					return super.goAdd();
				}
			}
			Student noStu = studentService.getStudentByStuNo(stuDto.getStuNo());
			if(noStu != null){
				this.addFieldError("stuDto.stuNo", "该学号已存在");
				if (hasFieldErrors()) {
					return super.goAdd();
				}
			}
			if(oldStu == null && noStu == null){
				Classes classes = classesService.getEntity(Classes.class, stuDto.getClasses());
				student = new Student();
				student.setUsername(stuDto.getUsername());
				student.setPassword(Md5.getMD5(stuDto.getPassword().getBytes()));
				student.setStuNo(stuDto.getStuNo());
				student.setRealName(stuDto.getRealName());
				student.setSex(stuDto.getSex());
				student.setAge(stuDto.getAge());
				student.setSchoolYear(stuDto.getSchoolYear());
				student.setAvatar(student.getAvatar());
				student.setRemark(stuDto.getRemark());
				student.setClasses(classes);
				studentService.addEntity(student);
				getSession().put("user", student);
				Log.init(getClass()).info("添加学生用户成功: " + student);
				return "indexPage";
			}else{
				this.addFieldError("stuDto.username", "该学生已存在");
				if (hasFieldErrors()) {
					return super.goAdd();
				}
			}
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
		return super.goAdd();
	}

	@Override
	public String goModify() {
		Student student = getSession().get("user") instanceof Student ? (Student)getSession().get("user") : null;
		if(student != null){
			student = studentService.getEntity(Student.class, student.getId());
			getRequest().put("student", student);
			return super.goModify();
		}
		return ERROR;
	}

	@Override
	public String list() {
		Admin admin = getSession().get("user") instanceof Admin ? (Admin)getSession().get("user") : null;
		if(admin != null){
			this.pageBean = this.studentService.queryForPage(Student.class, 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);

			return super.list();
		}
		return ERROR;
	}

	@Override
	public String modify() {
		Student student = getSession().get("user") instanceof Student ? (Student)getSession().get("user") : null;
		if(student != null ){
			Student stu = studentService.getEntity(Student.class, stuDto.getId());
			if(stu.getId() != student.getId()) return "goModify";  //当前用户没有权限修改该账号
			Classes classes = classesService.getEntity(Classes.class, stuDto.getClasses());
			stu.setUsername(stuDto.getUsername());
			stu.setStuNo(stuDto.getStuNo());
			stu.setRealName(stuDto.getRealName());
			stu.setAge(stuDto.getAge());
			stu.setClasses(classes);
			stu.setSchoolYear(stuDto.getSchoolYear());
			stu.setSex(stuDto.getSex());
			studentService.updateEntity(stu);
			Log.init(getClass()).info("修改学生用户成功: " + student);
			return "modify";
		}
		return ERROR;
	}
	
	public String modifyPsw() {
		Student student = getSession().get("user") instanceof Student ? (Student)getSession().get("user") : null;
		if(student != null){
			Student stu = studentService.getEntity(Student.class, stuDto.getId());
			if(stu.getId() != student.getId()) return "goModify";  //当前用户没有权限修改该账号
			if(stuDto.getOpassword() == null || !stu.getPassword().equals(Md5.getMD5(stuDto.getOpassword().getBytes())))//验证密码错误
				return "goModify";
			if(stuDto.getPassword() == null || stuDto.getRpassword() == null || !stuDto.getPassword().equals(stuDto.getRpassword()))//确认新密码错误 
				return "goModify";
			stu.setPassword(Md5.getMD5(stuDto.getPassword().getBytes()));
			studentService.updateEntity(stu);
			Log.init(getClass()).info("修改学生用户密码成功: " + student);
			return "modify";
		}
		return ERROR;
	}

	@Override
	public String view() {
		if(id <= 0) return ERROR;
		student = studentService.getEntity(Student.class, id);
		if(student == null) return ERROR;
		List<ActivityApply> aa = activityApplyService.getEntity(ActivityApply.class, "from ActivityApply aa where (aa.student.id = '" + student.getId() + "') or ('" + student.getId() + "' = some elements(aa.applicants))");
		if(aa.isEmpty() || aa.size() == 0)
			aa = null;
		getRequest().put("aa", aa);
		
		Admin admin = getSession().get("user") instanceof Admin ? (Admin)getSession().get("user") : null;
		if(admin != null)
			return "admin_viewPage";
		else
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

	public StudentService<Student, Integer> getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService<Student, Integer> studentService) {
		this.studentService = studentService;
	}

	public ActivityApplyService<ActivityApply, Integer> getActivityApplyService() {
		return activityApplyService;
	}

	public void setActivityApplyService(
			ActivityApplyService<ActivityApply, Integer> activityApplyService) {
		this.activityApplyService = activityApplyService;
	}

	public StudentDto getStuDto() {
		return stuDto;
	}

	public void setStuDto(StudentDto stuDto) {
		this.stuDto = stuDto;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
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
