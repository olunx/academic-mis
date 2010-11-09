package cn.gdpu.action;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import cn.gdpu.service.GroupApplyService;
import cn.gdpu.service.GroupService;
import cn.gdpu.service.StudentService;
import cn.gdpu.util.Log;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Group;
import cn.gdpu.vo.GroupApply;
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
		Student student = (Student) this.getSession().get("student");
		if(student != null){
			this.pageBean = this.groupService.queryForPage("from Group ", 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			getRequest().put("listType", "listall");
			return "listall";
		}
		return ERROR;
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
	 * 自定义标签my:groupApplyCount函数 ,检查申请加入小组人数
	 * @param gas
	 * @return
	 */
	public static int groupApplyCount(Group group){
		int count =0;
		for(GroupApply ga : group.getGroupApplys()){
			if(ga.getStatus() == 1) count++;
		}
		return count;
	}
	/**
	 * 自定义标签my:isMyGroup函数,检查是否我的群组
	 * @param group
	 * @param student
	 * @return
	 */
	public static Boolean isMyGroup(Group group, Student student) {
		System.out.println("group " + group.getName());
		System.out.println("student " + student.getRealName());
		if (student != null && group != null){
			//判断小组成员里是否存在该student
			for (Student stu : group.getMembers()) {
				if(stu.getId() == student.getId()) return true;
			}
		}
		return false;
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
			groupApply.setRecord(new Date() + " : " + student.getRealName() + " 申请加入 " + group.getName());
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
		Student student = (Student) this.getSession().get("student");
		if(student != null){
			group = groupService.getEntity(Group.class, id);
			if(group == null) return ERROR;
			return super.view();
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
