package cn.gdpu.action;

import java.util.List;

import cn.gdpu.dto.LoginDto;
import cn.gdpu.service.AssistantService;
import cn.gdpu.service.NoticeHotService;
import cn.gdpu.service.StudentService;
import cn.gdpu.service.TeacherService;
import cn.gdpu.util.Log;
import cn.gdpu.util.Md5;
import cn.gdpu.vo.Assistant;
import cn.gdpu.vo.NoticeHot;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.Teacher;

public class IndexAction extends BaseAction {
	private StudentService<Student, Integer> studentService;
	private AssistantService<Assistant, Integer> assistantService;
	private TeacherService<Teacher, Integer> teacherService;
	private NoticeHotService<NoticeHot, Integer> noticeHotService;
	private LoginDto loginDto;
	
	public String index(){
		String hql = "from NoticeHot nh order by nh.rank asc, nh.id desc";
		List<NoticeHot> nhs = noticeHotService.queryForLimit(hql, 0, 6);
		if(nhs.isEmpty() || nhs.size() == 0)
			nhs = null;
		getRequest().put("nhs", nhs);
		return SUCCESS;
	}

	public String login(){
		//学生登陆
		if(loginDto.getLoginType() == 0){      
			if(loginDto.getUsername() != null && !loginDto.getUsername().equals("") 
					&& loginDto.getPassword() != null && !loginDto.getPassword().equals("")){
				Student student = studentService.getStudentByUsernameAndPassword(loginDto.getUsername(), Md5.getMD5(loginDto.getPassword().getBytes()));
				if(student != null){
					getSession().put("people", student);
					getSession().put("student", student);
					if(getSession().get("manager") != null) getSession().put("manager", null);
					if(getSession().get("teacher") != null) getSession().put("teacher", null);
					Log.init(getClass()).info("学生用户登陆成功：" + student.getRealName());
					return "stulogin";
				}else{
					return "gologin";
				}
			}
			return "gologin";
			
		}
		//教师登陆
		if(loginDto.getLoginType() == 1){      
			if(loginDto.getUsername() != null && !loginDto.getUsername().equals("") 
					&& loginDto.getPassword() != null && !loginDto.getPassword().equals("")){
				Teacher teacher = teacherService.getTeacherByUsernameAndPassword(loginDto.getUsername(), Md5.getMD5(loginDto.getPassword().getBytes()));
				if(teacher!= null){
					getSession().put("people", teacher);
					getSession().put("teacher", teacher);
					if(getSession().get("manager") != null) getSession().put("manager", null);
					if(getSession().get("student") != null) getSession().put("student", null);
					Log.init(getClass()).info("教师登陆成功：" + teacher.getRealName());
					return "tchlogin";
				}else{
					return "gologin";
				}
			}
			return "gologin";
		}
		//管理员助理登陆
		if(loginDto.getLoginType() == 2){      
			if(loginDto.getUsername() != null && !loginDto.getUsername().equals("") 
					&& loginDto.getPassword() != null && !loginDto.getPassword().equals("")){
				Assistant assistant = assistantService.getAssistantByUsernameAndPassword(loginDto.getUsername(), Md5.getMD5(loginDto.getPassword().getBytes()));
				if(assistant != null){
					getSession().put("people", assistant);
					getSession().put("manager", assistant);
					if(getSession().get("student") != null) getSession().put("student", null);
					if(getSession().get("teacher") != null) getSession().put("teacher", null);
					Log.init(getClass()).info("管理员助理登陆成功：" + assistant.getRealName());
					return "asslogin";
				}else{
					return "gologin";
				}
			}
			return "gologin";
		}
		return ERROR;
	}
	
	//getter and setter

	public StudentService<Student, Integer> getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService<Student, Integer> studentService) {
		this.studentService = studentService;
	}

	public AssistantService<Assistant, Integer> getAssistantService() {
		return assistantService;
	}

	public void setAssistantService(
			AssistantService<Assistant, Integer> assistantService) {
		this.assistantService = assistantService;
	}

	public TeacherService<Teacher, Integer> getTeacherService() {
		return teacherService;
	}

	public void setTeacherService(TeacherService<Teacher, Integer> teacherService) {
		this.teacherService = teacherService;
	}

	public NoticeHotService<NoticeHot, Integer> getNoticeHotService() {
		return noticeHotService;
	}

	public void setNoticeHotService(
			NoticeHotService<NoticeHot, Integer> noticeHotService) {
		this.noticeHotService = noticeHotService;
	}

	public LoginDto getLoginDto() {
		return loginDto;
	}

	public void setLoginDto(LoginDto loginDto) {
		this.loginDto = loginDto;
	}
}
