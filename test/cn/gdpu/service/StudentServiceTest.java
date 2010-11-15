package cn.gdpu.service;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.gdpu.vo.Classes;
import cn.gdpu.vo.Student;



public class StudentServiceTest{
	private static StudentService<Student, Integer> studentService;
	private static ClassesService<Classes, Integer> classesService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext ctx = new ClassPathXmlApplicationContext("conf/spring/applicationContext.xml");
			System.out.println("ctx: " + ctx);
			studentService = (StudentService<Student, Integer>) ctx.getBean("studentService");
			classesService = (ClassesService<Classes, Integer>) ctx.getBean("classesService");
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void add() {
		Classes cls = classesService.getAllEntity(Classes.class).get(0);
		Student student = new Student();
		student.setUsername("user");
		student.setPassword("user");
		student.setStuNo("0000");
		student.setRealName("user");
		student.setClasses(cls);
		student.setSchoolYear(2007);
		studentService.addEntity(student);
	}
}
