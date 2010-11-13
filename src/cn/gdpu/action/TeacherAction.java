package cn.gdpu.action;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import cn.gdpu.dto.TeacherDto;
import cn.gdpu.service.InstituteService;
import cn.gdpu.service.TeacherService;
import cn.gdpu.util.Log;
import cn.gdpu.util.Md5;
import cn.gdpu.vo.Classes;
import cn.gdpu.vo.Institute;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.Teacher;

public class TeacherAction extends BaseAction {
	private InstituteService<Institute, Integer> instituteService;
	private TeacherService<Teacher, Integer> teacherService;
	private Teacher teacher;
	private TeacherDto teaDto;

	public void prepare() throws Exception {
		HttpServletRequest httpRequest = (HttpServletRequest) ServletActionContext.getRequest();
		String action=  httpRequest.getServletPath().split("/")[1];
		String[] uri=action.split("\\.");
		if(uri[0].equals("add")){
			List<Institute> institutes = instituteService.getAllEntity(Institute.class);
			getRequest().put("institutes", institutes);
		}
	}
	
	@Override
	public String add() {
		if(teaDto.getUsername() != null && !teaDto.getUsername().equals("") 
				&& teaDto.getPassword() != null && !teaDto.getPassword().equals("") 
				&& teaDto.getRpassword() != null && !teaDto.getRpassword().equals("")
				&& teaDto.getPassword().equals(teaDto.getRpassword())){
			
			Teacher oldTch = teacherService.getTeacherByUsername(teaDto.getUsername());
			if(oldTch != null){
				this.addFieldError("teaDto.username", "该用户名已存在");
				if (hasFieldErrors()) {
					return super.goAdd();
				}
			}
			Teacher noTch = teacherService.getTeacherByTnum(teaDto.getTnum());
			if(noTch != null){
				this.addFieldError("teaDto.stuNo", "该教师号已存在");
				if (hasFieldErrors()) {
					return super.goAdd();
				}
			}
			if(oldTch == null && noTch == null){
				Institute institute = instituteService.getEntity(Institute.class, teaDto.getInstitute());
				teacher = new Teacher();
				teacher.setUsername(teaDto.getUsername());
				teacher.setPassword(Md5.getMD5(teaDto.getPassword().getBytes()));
				teacher.setTnum(teaDto.getTnum());
				teacher.setRealName(teaDto.getRealName());
				teacher.setSex(teaDto.getSex());
				teacher.setAge(teaDto.getAge());
				teacher.setAvatar(teacher.getAvatar());
				teacher.setRemark(teaDto.getRemark());
				teacher.setInstitute(institute);
				teacherService.addEntity(teacher);
				getSession().put("teacher", teacher);
				Log.init(getClass()).info("添加教师用户成功: " + teacher.getRealName());
				return "viewPage";
			}else{
				this.addFieldError("teaDto.username", "该教师已存在");
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
		List<Institute> institutes = instituteService.getAllEntity(Institute.class);
		getRequest().put("institutes", institutes);
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

	// getter and setter
	public InstituteService<Institute, Integer> getInstituteService() {
		return instituteService;
	}

	public void setInstituteService(
			InstituteService<Institute, Integer> instituteService) {
		this.instituteService = instituteService;
	}

	public TeacherService<Teacher, Integer> getTeacherService() {
		return teacherService;
	}

	public void setTeacherService(TeacherService<Teacher, Integer> teacherService) {
		this.teacherService = teacherService;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public TeacherDto getTeaDto() {
		return teaDto;
	}

	public void setTeaDto(TeacherDto teaDto) {
		this.teaDto = teaDto;
	}

}
