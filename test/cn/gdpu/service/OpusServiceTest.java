package cn.gdpu.service;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.gdpu.vo.ActivityApply;
import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Opus;



public class OpusServiceTest{
	private static OpusService<Opus, Integer> opusService;
	private static ActivityApplyService<ActivityApply, Integer> activityApplyService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext ctx = new ClassPathXmlApplicationContext("conf/spring/applicationContext.xml");
			System.out.println("ctx: " + ctx);
			opusService = (OpusService<Opus, Integer>) ctx.getBean("opusService");
			activityApplyService = (ActivityApplyService<ActivityApply, Integer>) ctx.getBean("activityApplyService");
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void add() {
		ActivityApply aa = activityApplyService.getAllEntity(ActivityApply.class).get(0);
		if(aa != null){
			Opus opus = new Opus();
			opus.setName("xxx3");
			opus.setIntro("xxx3");
			opus.setActivityApply(aa);
			opusService.addEntity(opus);
		}
	}
}
