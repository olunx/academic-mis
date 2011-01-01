package cn.gdpu.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import cn.gdpu.service.GroupApplyService;
import cn.gdpu.service.GroupService;
import cn.gdpu.service.StudentService;
import cn.gdpu.util.Log;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Group;
import cn.gdpu.vo.GroupApply;
import cn.gdpu.vo.Manager;
import cn.gdpu.vo.Student;

@SuppressWarnings("serial")
public class GroupAction extends BaseAction{
	
	private GroupService<Group, Integer> groupService;
	private GroupApplyService<GroupApply, Integer> groupApplyService;
	private StudentService<Student, Integer> studentService;
	private Group group;
	private PageBean pageBean;
	private int page;
	private int id;

	@Override
	public String add() {
		Student student = (Student) getSession().get("student");
		Group g = groupService.getGroupByName(group.getName());
		if(student != null && g == null){
			group.setCaptain(student);
			Set<Student> students = new HashSet<Student>();
			students.add(student);
			group.setMembers(students);
			groupService.addEntity(group);
			Log.init(getClass()).info(student.getRealName() + "添加了小组：" + group.getName());
			return LIST;
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
		// TODO Auto-generated method stub
		return super.goModify();
	}

	/**
	 * 查看该用户加入的小组
	 */
	@Override
	public String list() {
		Student student = (Student) this.getSession().get("student");
		if(student != null){
			this.pageBean = this.groupService.queryForPage("from Group g where '" + student.getId() + "' = some elements(g.members)", 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			getRequest().put("listType", "list");
			return super.list();
		}
		return ERROR;
	}
	
	/**
	 * 查看该全部的小组
	 */
	public String listAll() {
		this.pageBean = this.groupService.queryForPage("from Group ", 10, page);
		if (pageBean.getList().isEmpty())
			pageBean.setList(null);
		getRequest().put("listType", "listall");
		
		Manager manager = (Manager) getSession().get("manager");
		Admin admin = manager instanceof Admin ? (Admin)manager : null;
		if(admin != null)
			return "admin_listPage";
		else
			return "listall";
	}
	
	/**
	 * 查看该用户创建的小组
	 */
	public String listMe() {
		Student student = (Student) this.getSession().get("student");
		if(student != null){
			this.pageBean = this.groupService.queryForPage("from Group g where g.captain.id = '" + student.getId() + "'", 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			getRequest().put("listType", "listme");
			return "listme";
		}
		return ERROR;
	}
	
	/**
	 * 查看正在审核的小组
	 */
	public String listApply() {
		Student student = (Student) this.getSession().get("student");
		if(student != null){
			this.pageBean = this.groupApplyService.queryForPage("from GroupApply ga where ga.student.id = '" + student.getId() + "'", 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			getRequest().put("listType", "listme");
			return "listapply";
		}
		return ERROR;
	}
	
	
	/**
	 * 申请加入群组
	 * @return
	 */
	public String apply(){
		Student student = (Student) this.getSession().get("student");
		if(student != null){
			group = groupService.getEntity(Group.class, id);
			if(group == null) return ERROR;
			Set<GroupApply> applicants = group.getGroupApplys();
			if(applicants == null) applicants = new HashSet<GroupApply>();
			for (GroupApply applicant : applicants) {
				if(applicant.getStudent().getId() == student.getId()) return ERROR;
			}
			GroupApply groupApply = new GroupApply();
			groupApply.setGroup(group);
			groupApply.setStudent(student);
			groupApply.setStatus(1);
			groupApply.setApplyTime(new Date());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			groupApply.setRecord(sdf.format(new Date()) + " : " + student.getRealName() + " 申请加入 " + group.getName());
			applicants.add(groupApply);
			group.setGroupApplys(applicants);
			groupService.updateEntity(group);
			return "check";
		}
		return ERROR;
	}
	@Override
	public String modify() {
		Student student = (Student) this.getSession().get("student");
		if(student != null){
			// TODO Auto-generated method stub
			return super.modify();
		}
		return ERROR;
	}

	@Override
	public String view() {
		if(id <=0 ) return ERROR;
		group = groupService.getEntity(Group.class, id);
		if(group == null) return ERROR;
		return super.view();
	}
	
	/**
	 * 通过审核
	 * @return
	 */
	public String pass() {
		Student student = (Student) this.getSession().get("student");
		if(student != null){
			GroupApply groupApply = groupApplyService.getEntity(GroupApply.class, id);
			if(groupApply == null) return ERROR;
			group = groupService.getEntity(Group.class, groupApply.getGroup().getId());
			if(group == null) return ERROR;
			Student captain = group.getCaptain();
			if(captain.getId() != student.getId()) return ERROR; //当前操作用户不是该小组的管理者，没有权限操作
			Set<Student> members = group.getMembers();
			if(members == null) members = new HashSet<Student>();
			for(Student stu : members){
				if(stu.getId() == groupApply.getStudent().getId()) return ERROR; //该用户已经加入小组
			}
			members.add(groupApply.getStudent());
			group.setMembers(members);
			groupApply.setStatus(2); //1==申请 2==通过 3==拒绝
			groupApply.setPassTime(new Date());
			groupApply.setOperator(student);
			SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			groupApply.setRecord(groupApply.getRecord() + "; " + sdf.format(new Date()) + " : " + student.getRealName() + "同意你加入小组 " + groupApply.getGroup().getName());
			groupApplyService.updateEntity(groupApply);
			groupService.updateEntity(group);
			Log.init(getClass()).info(sdf.format(new Date()) + " : " + student.getRealName() + "同意 " + groupApply.getStudent().getRealName() + " 加入小组 " + groupApply.getGroup().getName());
			return "audit";
		}
		return ERROR;
		
	}
	/**
	 * 拒绝审核
	 * @return
	 */
	public String refuse() {
		Student student = (Student) this.getSession().get("student");
		if(student != null){
			GroupApply groupApply = groupApplyService.getEntity(GroupApply.class, id);
			if(groupApply == null) return ERROR;
			group = groupService.getEntity(Group.class, groupApply.getGroup().getId());
			if(group == null) return ERROR;
			Student captain = group.getCaptain();
			if(captain.getId() != student.getId()) return ERROR; //当前操作用户不是该小组的管理者，没有权限操作
			groupApply.setStatus(3); //1==申请 2==通过 3==拒绝
			groupApply.setPassTime(new Date());
			groupApply.setOperator(student);
			SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			groupApply.setRecord(groupApply.getRecord() + "; " + sdf.format(new Date()) + " : " + student.getRealName() + "拒绝你加入小组 " + groupApply.getGroup().getName());
			groupApplyService.updateEntity(groupApply);
			groupService.updateEntity(group);
			return "audit";
		}
		return ERROR;
		
	}

	//getter and setter
	public GroupService<Group, Integer> getGroupService() {
		return groupService;
	}

	public void setGroupService(GroupService<Group, Integer> groupService) {
		this.groupService = groupService;
	}


	public StudentService<Student, Integer> getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService<Student, Integer> studentService) {
		this.studentService = studentService;
	}

	public GroupApplyService<GroupApply, Integer> getGroupApplyService() {
		return groupApplyService;
	}

	public void setGroupApplyService(
			GroupApplyService<GroupApply, Integer> groupApplyService) {
		this.groupApplyService = groupApplyService;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
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
