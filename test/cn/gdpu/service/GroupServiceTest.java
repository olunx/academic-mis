package cn.gdpu.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.gdpu.vo.Classes;
import cn.gdpu.vo.Group;
import cn.gdpu.vo.GroupApply;
import cn.gdpu.vo.Student;



public class GroupServiceTest{
	private static GroupService<Group, Integer> groupService;
	private static StudentService<Student, Integer> studentService;
	private static GroupApplyService<GroupApply, Integer> groupApplyService;
	@SuppressWarnings("unchecked")
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext ctx = new ClassPathXmlApplicationContext("conf/spring/applicationContext.xml");
			System.out.println("ctx: " + ctx);
			groupService = (GroupService<Group, Integer>) ctx.getBean("groupService");
			studentService = (StudentService<Student, Integer>) ctx.getBean("studentService");
			groupApplyService = (GroupApplyService<GroupApply, Integer>) ctx.getBean("groupApplyService");
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void add() {
		List<Student> students = studentService.getAllEntity(Student.class);
		Group group = new Group();
		for(int i = 0; i < students.size(); i++){
			if(i % 5 == 0){
				group = new Group();
				group.setName("TestTeam" + i);
				group.setIntro("TestTeam" + i);
				group.setCaptain(students.get(i));
				Set<Student> members = new HashSet<Student>();
				members.add(students.get(i));
				group.setMembers(members);
				groupService.addEntity(group);
			}
			else{
				Set<Student> members = group.getMembers();
				if(members == null){
					members = new HashSet<Student>();
				}
				members.add(students.get(i));
				group.setMembers(members);
				groupService.updateEntity(group);
			}
		}
		
	}
	@Test
	public void query(){
		Student student = studentService.getAllEntity(Student.class).get(0);
		List<Group> list = groupService.getEntity(Group.class, "from Group g where '" + student.getId() + "' = some elements(g.members)");
		System.out.println("list size = " + list.size());
	}
	@Test
	public void apply(){
		
	}
}
