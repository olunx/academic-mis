package cn.gdpu.service;

import java.util.HashSet;
import java.util.Set;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.gdpu.vo.Classes;
import cn.gdpu.vo.Group;
import cn.gdpu.vo.Student;



public class GroupServiceTest{
	private static GroupService<Group, Integer> groupService;
	private static StudentService<Student, Integer> studentService;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext ctx = new ClassPathXmlApplicationContext("conf/spring/applicationContext.xml");
			System.out.println("ctx: " + ctx);
			groupService = (GroupService<Group, Integer>) ctx.getBean("groupService");
			studentService = (StudentService<Student, Integer>) ctx.getBean("studentService");
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void add() {
		Student student = studentService.getAllEntity(Student.class).get(0);
		Group group = new Group();
		group.setName("3C");
		group.setIntro("3C TEARM");
		group.setCaptain(student);
		Set<Student> members = new HashSet<Student>();
		members.add(student);
		group.setMembers(members);
		groupService.addEntity(group);
	}
}
