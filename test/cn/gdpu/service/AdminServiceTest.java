package cn.gdpu.service;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.gdpu.vo.Admin;



public class AdminServiceTest{
	private static AdminService<Admin, Integer> adminService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext ctx = new ClassPathXmlApplicationContext("conf/spring/applicationContext.xml");
			System.out.println("ctx: " + ctx);
			adminService = (AdminService<Admin, Integer>) ctx.getBean("adminService");
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
	}
}
