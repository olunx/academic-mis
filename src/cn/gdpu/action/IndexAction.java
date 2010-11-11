package cn.gdpu.action;

import cn.gdpu.dto.LoginDto;
import cn.gdpu.service.AssistantService;
import cn.gdpu.service.StudentService;
import cn.gdpu.util.Log;
import cn.gdpu.util.Md5;
import cn.gdpu.vo.Assistant;
import cn.gdpu.vo.Student;

public class IndexAction extends BaseAction {
	private StudentService<Student, Integer> studentService;
	private AssistantService<Assistant, Integer> assistantService;
	private LoginDto loginDto;
	
	public String index(){
		return SUCCESS;
	}

	public String login(){
		//学生登陆
		if(loginDto.getLoginType() == 0){      
			if(loginDto.getUsername() != null && !loginDto.getUsername().equals("") 
					&& loginDto.getPassword() != null && !loginDto.getPassword().equals("")){
				Student student = studentService.getStudentByUsernameAndPassword(loginDto.getUsername(), Md5.getMD5(loginDto.getPassword().getBytes()));
				if(student != null){
					getSession().put("student", student);
					Log.init(getClass()).info("学生用户登陆成功：" + student.getRealName());
					return "stulogin";
				}else{
					return "gologin";
				}
			}
			return "gologin";
			
		}
		//管理员助理登陆
		if(loginDto.getLoginType() == 1){      
			if(loginDto.getUsername() != null && !loginDto.getUsername().equals("") 
					&& loginDto.getPassword() != null && !loginDto.getPassword().equals("")){
				Assistant assistant = assistantService.getAssistantByUsernameAndPassword(loginDto.getUsername(), Md5.getMD5(loginDto.getPassword().getBytes()));
				if(assistant != null){
					getSession().put("assistant", assistant);
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

	public LoginDto getLoginDto() {
		return loginDto;
	}

	public void setLoginDto(LoginDto loginDto) {
		this.loginDto = loginDto;
	}
}