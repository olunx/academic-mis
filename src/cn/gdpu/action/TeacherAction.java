package cn.gdpu.action;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Preparable;

import cn.gdpu.dto.TeacherDto;
import cn.gdpu.service.InstituteService;
import cn.gdpu.service.TeacherService;
import cn.gdpu.util.Log;
import cn.gdpu.util.Md5;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Image;
import cn.gdpu.vo.Institute;
import cn.gdpu.vo.Manager;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.Teacher;

public class TeacherAction extends BaseAction implements Preparable {
	private InstituteService<Institute, Integer> instituteService;
	private TeacherService<Teacher, Integer> teacherService;
	private Teacher teacher;
	private TeacherDto teaDto;
	private Image image;
	private PageBean pageBean;
	private int page;
	private int id;

	@Override
	public void prepare() throws Exception {
		HttpServletRequest httpRequest = (HttpServletRequest) ServletActionContext.getRequest();
		String action=  httpRequest.getServletPath().split("/")[2];
		String[] uri = action.split("\\.");
		if(uri[0].equals("addTeacher") || uri[0].equals("goAddTeacher") || uri[0].equals("modifyTeacher") || uri[0].equals("goModifyTeacher")){
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
				teacher.setTitle(teaDto.getTitle());
				teacher.setAvatar(teacher.getAvatar());
				teacher.setRemark(teaDto.getRemark());
				teacher.setInstitute(institute);
				teacher.setRegtime(new Date());
				teacherService.addEntity(teacher);
				getSession().put("user", teacher);
				Log.init(getClass()).info("添加教师用户成功: " + teacher.getRealName());
				return "indexPage";
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
		return super.goAdd();
	}

	@Override
	public String goModify() {
		Teacher teacher = getSession().get("user") instanceof Teacher ? (Teacher)getSession().get("user") : null;
		if(teacher != null){
			teacher = teacherService.getEntity(Teacher.class, teacher.getId());
			getRequest().put("teacher", teacher);
			return super.goModify();
		}
		return ERROR;
	}

	@Override
	public String list() {
		Admin admin = getSession().get("user") instanceof Admin ? (Admin)getSession().get("user") : null;
		if(admin != null){
			this.pageBean = this.teacherService.queryForPage(Teacher.class, 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);

			return super.list();
		}
		return ERROR;
	}

	@Override
	public String modify() {
		Teacher teacher = getSession().get("user") instanceof Teacher ? (Teacher)getSession().get("user") : null;
		if(teacher != null ){
			Teacher tea = teacherService.getEntity(Teacher.class, teaDto.getId());
			if(tea.getId() != teacher.getId()) return "goModify";  //当前用户没有权限修改该账号
			Institute institute = instituteService.getEntity(Institute.class, teaDto.getInstitute());
			tea.setTnum(teaDto.getTnum());
			tea.setRealName(teaDto.getRealName());
			tea.setAge(teaDto.getAge());
			tea.setInstitute(institute);
			tea.setTitle(teaDto.getTitle());
			tea.setSex(teaDto.getSex());
			teacherService.updateEntity(tea);
			Log.init(getClass()).info("修改教师用户成功: " + teacher);
			return "modify";
		}
		return ERROR;
	}
	
	public String modifyPsw() {
		Teacher teacher = getSession().get("user") instanceof Teacher ? (Teacher)getSession().get("user") : null;
		if(teacher != null){
			Teacher tea = teacherService.getEntity(Teacher.class, teaDto.getId());
			if(tea.getId() != teacher.getId()) return "goModify";  //当前用户没有权限修改该账号
			if(teaDto.getOpassword() == null || teaDto.getOpassword().equals("") || !tea.getPassword().equals(Md5.getMD5(teaDto.getOpassword().getBytes())))//验证密码错误
				return "goModify";
			if(teaDto.getPassword() == null || teaDto.getPassword().equals("") || teaDto.getRpassword() == null || teaDto.getRpassword().equals("") || !teaDto.getPassword().equals(teaDto.getRpassword()))//确认新密码错误 
				return "goModify";
			tea.setPassword(Md5.getMD5(teaDto.getPassword().getBytes()));
			teacherService.updateEntity(tea);
			Log.init(getClass()).info("修改教师用户密码成功: " + teacher);
			return "modify";
		}
		return ERROR;
	}

	public String modifyRemark() {
		Teacher teacher = getSession().get("user") instanceof Teacher ? (Teacher)getSession().get("user") : null;
		if(teacher != null ){
			Teacher tea = teacherService.getEntity(Teacher.class, teaDto.getId());
			if(tea.getId() != teacher.getId()) return "goModify";  //当前用户没有权限修改该账号
			tea.setRemark(teaDto.getRemark());
			teacherService.updateEntity(tea);
			Log.init(getClass()).info("修改教师用户介绍成功: " + teacher);
			return "modify";
		}
		return ERROR;
	}
	
	public String addAvatar() {
		Teacher teacher = getSession().get("user") instanceof Teacher ? (Teacher)getSession().get("user") : null;
		if(teacher != null ){
			Teacher tea = teacherService.getEntity(Teacher.class, teaDto.getId());
			if(tea.getId() != teacher.getId()) return "goModify";  //当前用户没有权限修改该账号
			if(image.getOriFileName().equals("") || image.getOriFileName() == null) 
				return "goModify";//没有更新头像
			tea.setAvatar(image);
			teacherService.updateEntity(tea);
			Log.init(getClass()).info("修改学生头像成功: " + teacher);
			return "modify";
		}
		return ERROR;
	}
	
	@Override
	public String view() {
		if(id <= 0) return ERROR;
		teacher = teacherService.getEntity(Teacher.class, id);
		if(teacher == null) return ERROR;
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

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
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
