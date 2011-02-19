package cn.gdpu.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import cn.gdpu.dto.SubjectDto;
import cn.gdpu.service.SubjectService;
import cn.gdpu.util.Log;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Subject;
import cn.gdpu.vo.Teacher;

public class SubjectAction extends BaseAction {
	private SubjectService<Subject, Integer> subjectService;
	private Subject subject;
	private SubjectDto sjDto;
	private PageBean pageBean;
	private int page;
	private int id;
	
	@Override
	public String add() {
		Teacher teacher = (Teacher) getSession().get("teacher");
		if(teacher != null){
			subject = new Subject();
			subject.setName(sjDto.getName());
			subject.setIntro(sjDto.getIntro());
			System.out.println("sj name : " + sjDto.getName());
			System.out.println("sj airtime : " + sjDto.getAirtime());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = null;
			try {
				date = sdf.parse(sjDto.getAirtime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			System.out.println("date : " + date);
			if(date == null) return ERROR;
			subject.setAirtime(date);
			date = null;
			try {
				date = sdf.parse(sjDto.getDeadtime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if(date == null) return ERROR;
			subject.setDeadtime(date);
			subject.setTime(new Date());
			subject.setPublisher(teacher);
			subjectService.addEntity(subject);
			Log.init(getClass()).info("教师：" + teacher.getRealName() + " 添加学术活动  " + subject.getName() +  " 成功!");
			return "list_me";
		}
		return ERROR;
	}

	@Override
	public String delete() {
		Teacher teacher = (Teacher) getSession().get("teacher");
		if(teacher != null){
			if(id <= 0 ) return ERROR;
			subject = subjectService.getEntity(Subject.class, id);
			if(subject == null) return ERROR;
			subjectService.deleteEntity(Subject.class, subject.getId());
			Log.init(getClass()).info("教师：" + teacher.getRealName() + " 删除学术活动  id = " + subject.getId() + " name = " + subject.getName() +  " 成功!");
			return "list_me";
		}
		return ERROR;
	}

	@Override
	public String goAdd() {
		Teacher teacher = (Teacher) getSession().get("teacher");
		if(teacher != null){
			return super.goAdd();
		}
		return ERROR;
	}

	@Override
	public String goModify() {
		Teacher teacher = (Teacher) getSession().get("teacher");
		if(teacher != null){
			if(id <= 0 ) return ERROR;
			subject = subjectService.getEntity(Subject.class, id);
			if(subject == null) return ERROR;
			return super.goModify();
		}
		return ERROR;
	}

	@Override
	public String list() {
		this.pageBean = this.subjectService.queryForPage(Subject.class, 10, page);
		if (pageBean.getList().isEmpty())
			pageBean.setList(null);
		return super.list();
	}
	
	public String listMe() {
		Teacher teacher = (Teacher) getSession().get("teacher");
		if(teacher != null){
			this.pageBean = this.subjectService.queryForPage("from Subject s where s.publisher.id ='" + teacher.getId() + "'", 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			return "listPage_me";
		}
		return ERROR;
	}

	@Override
	public String modify() {
		Teacher teacher = (Teacher) getSession().get("teacher");
		if(teacher != null){
			subject = new Subject();
			subject.setId(sjDto.getId());
			subject.setName(sjDto.getName());
			subject.setIntro(sjDto.getIntro());
			System.out.println("sj name : " + sjDto.getName());
			System.out.println("sj airtime : " + sjDto.getAirtime());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = null;
			try {
				date = sdf.parse(sjDto.getAirtime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			System.out.println("date : " + date);
			if(date == null) return ERROR;
			subject.setAirtime(date);
			date = null;
			try {
				date = sdf.parse(sjDto.getDeadtime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if(date == null) return ERROR;
			subject.setDeadtime(date);
			subject.setPublisher(teacher);
			subjectService.updateEntity(subject);
			Log.init(getClass()).info("教师：" + teacher.getRealName() + " 修改了学术活动  " + subject.getName() +  " 成功!");
			return "list_me";
		}
		return ERROR;
	}

	@Override
	public String view() {
		if(id <= 0 ) return ERROR;
		subject = subjectService.getEntity(Subject.class, id);
		if(subject == null) return ERROR;
		return super.view();
	}
	
	//getter and setter
	public SubjectService<Subject, Integer> getSubjectService() {
		return subjectService;
	}

	public void setSubjectService(SubjectService<Subject, Integer> subjectService) {
		this.subjectService = subjectService;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public SubjectDto getSjDto() {
		return sjDto;
	}

	public void setSjDto(SubjectDto sjDto) {
		this.sjDto = sjDto;
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
