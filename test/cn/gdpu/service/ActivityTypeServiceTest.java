package cn.gdpu.service;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.gdpu.vo.ActivityType;
import cn.gdpu.vo.Admin;



public class ActivityTypeServiceTest{
	private static ActivityTypeService<ActivityType, Integer> activityTypeService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext ctx = new ClassPathXmlApplicationContext("conf/spring/applicationContext.xml");
			System.out.println("ctx: " + ctx);
			activityTypeService = (ActivityTypeService<ActivityType, Integer>) ctx.getBean("activityTypeService");
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void add() {
		ActivityType activityType = new ActivityType();
		activityType.setName("文科设计大赛");
		activityType.setLevel(4);
		activityType.setIntro("教育部全国大学生文科计算机设计大赛介绍...");
		activityTypeService.addEntity(activityType);
	}
}
