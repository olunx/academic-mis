package cn.gdpu.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import cn.gdpu.service.GroupService;
import cn.gdpu.service.StudentService;
import cn.gdpu.util.Log;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Group;
import cn.gdpu.vo.Student;

@SuppressWarnings("serial")
public class GroupAction extends BaseAction{
	
	private GroupService<Group, Integer> groupService;
	private StudentService<Student, Integer> studentService;
	private Group group;
	private PageBean pageBean;
	private int page;

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
			student = studentService.getEntity(Student.class, student.getId());
			if(student == null) return ERROR;
			Set<Group> groups = student.getGroups();
			if (student != null) {
				this.pageBean = this.groupService.queryForPage(new ArrayList<Group>(groups), 10, page);
				if (pageBean.getList().isEmpty())
					pageBean.setList(null);
			}
			return super.list();
		}
		return ERROR;
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


}
