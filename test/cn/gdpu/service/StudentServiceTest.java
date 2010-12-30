package cn.gdpu.service;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.gdpu.util.Md5;
import cn.gdpu.vo.Classes;
import cn.gdpu.vo.Student;



public class StudentServiceTest{
	private static StudentService<Student, Integer> studentService;
	private static ClassesService<Classes, Integer> classesService;
	
	@SuppressWarnings("unchecked")
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
		List<Classes> cls = classesService.getAllEntity(Classes.class);
		for(int i = 0; i < cls.size(); i++){
			for(int j = 1; j <= 50; j++){
				Student student;
				student = studentService.getStudentByUsername(i + "test" + j);
				if(student == null)
					student = new Student();
				else 
					continue;
				student.setUsername( i + "test" + j);
				student.setPassword(Md5.getMD5("test".getBytes()));
				student.setStuNo(i + "0000" + j);	
				student.setRealName( i + "test" + j);
				student.setClasses(cls.get(i));
				student.setSchoolYear(2007);
				studentService.addEntity(student);
				System.out.println("添加学生 ： " + student.getRealName());
			}
		}
	}
}
