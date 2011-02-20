package cn.gdpu.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import cn.gdpu.dto.SubjectDto;
import cn.gdpu.service.SubjectApplyService;
import cn.gdpu.service.SubjectService;
import cn.gdpu.util.Log;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.Subject;
import cn.gdpu.vo.SubjectApply;
import cn.gdpu.vo.Teacher;

public class SubjectAction extends BaseAction {
	private SubjectService<Subject, Integer> subjectService;
	private SubjectApplyService<SubjectApply, Integer> subjectApplyService;
	private Subject subject;
	private SubjectApply subjectApply;
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

	/**
	 * 申请报名科研课题招聘
	 * @return
	 */
	public String apply(){
		Student student = (Student) this.getSession().get("student");
		if(student != null){
			if(id <= 0) return ERROR;
			subject = subjectService.getEntity(Subject.class, id);
			if(subject == null) return ERROR;
			Date toDay = new Date();
			//检查是否不在报名时间内
			if(toDay.getTime() < subject.getAirtime().getTime() || toDay.getTime() > subject.getDeadtime().getTime()) return "timeout";
			Set<SubjectApply> applicants = subject.getSubjectApplys();
			if(applicants == null) applicants = new HashSet<SubjectApply>();
			for (SubjectApply applicant : applicants) {
				if(applicant.getStudent().getId() == student.getId()) return ERROR;
			}
			SubjectApply subjectApply = new SubjectApply();
			subjectApply.setSubject(subject);
			subjectApply.setStudent(student);
			subjectApply.setStatus(1);
			subjectApply.setApplytime(new Date());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			subjectApply.setRecord(sdf.format(new Date()) + " : " + student.getRealName() + " 申请报名科研课题 " + subject.getName());
			applicants.add(subjectApply);
			subject.setSubjectApplys(applicants);
			subjectService.updateEntity(subject);
			return "check";
		}
		return ERROR;
	}
	
	/**
	 * 查看正在审核的我申请的课题
	 */
	public String listApply() {
		Student student = (Student) this.getSession().get("student");
		if(student != null){
			this.pageBean = this.subjectApplyService.queryForPage("from SubjectApply sa where sa.student.id = '" + student.getId() + "'", 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			return "listapply";
		}
		return ERROR;
	}
	
	/**
	 * 通过审核
	 * @return
	 */
	public String passApply() {
		Teacher teacher = (Teacher) getSession().get("teacher");
		if(teacher != null){
			subjectApply = subjectApplyService.getEntity(SubjectApply.class, id);
			if(subjectApply == null) return ERROR;
			subject = subjectService.getEntity(Subject.class, subjectApply.getSubject().getId());
			if(subject == null) return ERROR;
			if(teacher.getId() != subject.getPublisher().getId()) return ERROR; //当前操作用户不是该课题的发布者，没有权限操作
			subjectApply.setStatus(2); //1==申请 2==通过 3==拒绝
			subjectApply.setEndtime(new Date());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			subjectApply.setRecord(subjectApply.getRecord() + "; " + sdf.format(new Date()) + " : " + teacher.getRealName() + "通过你的课题申请  " + subjectApply.getSubject().getName());
			subjectApplyService.updateEntity(subjectApply);
			subjectService.updateEntity(subject);
			Log.init(getClass()).info(sdf.format(new Date()) + " : " + teacher.getRealName() + "同意 " + subjectApply.getStudent().getRealName() + " 的课题申请 " + subjectApply.getSubject().getName());
			return "audit";
		}
		return ERROR;
		
	}
	/**
	 * 拒绝审核
	 * @return
	 */
	public String refuseApply() {
		Teacher teacher = (Teacher) getSession().get("teacher");
		if(teacher != null){
			subjectApply = subjectApplyService.getEntity(SubjectApply.class, id);
			if(subjectApply == null) return ERROR;
			subject = subjectService.getEntity(Subject.class, subjectApply.getSubject().getId());
			if(subject == null) return ERROR;
			if(teacher.getId() != subject.getPublisher().getId()) return ERROR; //当前操作用户不是该课题的发布者，没有权限操作
			subjectApply.setStatus(3); //1==申请 2==通过 3==拒绝
			subjectApply.setEndtime(new Date());
			SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			subjectApply.setRecord(subjectApply.getRecord() + "; " + sdf.format(new Date()) + " : " + teacher.getRealName() + "拒绝你的课题申请 " + subjectApply.getSubject().getName());
			subjectApplyService.updateEntity(subjectApply);
			subjectService.updateEntity(subject);
			return "audit";
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

	public SubjectApplyService<SubjectApply, Integer> getSubjectApplyService() {
		return subjectApplyService;
	}

	public void setSubjectApplyService(
			SubjectApplyService<SubjectApply, Integer> subjectApplyService) {
		this.subjectApplyService = subjectApplyService;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public SubjectApply getSubjectApply() {
		return subjectApply;
	}

	public void setSubjectApply(SubjectApply subjectApply) {
		this.subjectApply = subjectApply;
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
