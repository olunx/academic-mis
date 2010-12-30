package cn.gdpu.service;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.gdpu.util.Md5;
import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Assistant;



public class AdminServiceTest{
	private static AdminService<Admin, Integer> adminService;
	private static AssistantService<Assistant, Integer> assistantService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext ctx = new ClassPathXmlApplicationContext("conf/spring/applicationContext.xml");
			System.out.println("ctx: " + ctx);
			adminService = (AdminService<Admin, Integer>) ctx.getBean("adminService");
			assistantService = (AssistantService<Assistant, Integer>) ctx.getBean("assistantService");
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void add() {
		Admin admin = new Admin();
		admin.setUsername("admin");
		admin.setPassword("admin");
		admin.setRealName("admin");
		admin.setRemark("系统管理员");
		adminService.addEntity(admin);
		
		Assistant assistant = new Assistant();
		assistant.setUsername("ass");
		assistant.setPassword(Md5.getMD5("ass".getBytes()));
		assistant.setRealName("assistant");
		assistant.setRemark("管理员助理");
		assistantService.addEntity(assistant);
	}
}
