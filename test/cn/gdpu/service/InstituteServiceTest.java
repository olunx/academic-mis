package cn.gdpu.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.gdpu.vo.Classes;
import cn.gdpu.vo.Institute;



public class InstituteServiceTest{
	private static InstituteService<Institute, Integer> instituteService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext ctx = new ClassPathXmlApplicationContext("conf/spring/applicationContext.xml");
			System.out.println("ctx: " + ctx);
			instituteService = (InstituteService<Institute, Integer>) ctx.getBean("instituteService");
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void add() {
		Classes cls1 = new Classes();
		cls1.setName("医药软件");
		Classes cls2 = new Classes();
		cls2.setName("医药信息");
		Classes cls3 = new Classes();
		cls3.setName("医学智能");
		Classes cls4 = new Classes();
		cls4.setName("生物医学");
		Set<Classes> clss = new HashSet<Classes>();
		clss.add(cls1);
		clss.add(cls2);
		clss.add(cls3);
		clss.add(cls4);
		Institute ins = new Institute();
		ins.setName("医药信息工程学院");
		ins.setClasses(clss);
		instituteService.addEntity(ins);
	}
}
