package cn.gdpu.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.gdpu.vo.Activity;
import cn.gdpu.vo.ActivityApply;
import cn.gdpu.vo.ActivityType;
import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Assistant;
import cn.gdpu.vo.Group;
import cn.gdpu.vo.SingleApply;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.TeamApply;



public class ActivityServiceTest{
	private static ActivityService<Activity, Integer> activityService;
	private static ActivityTypeService<ActivityType, Integer> activityTypeService;
	private static ActivityApplyService<ActivityApply, Integer> activityApplyService;
	private static SingleApplyService<SingleApply, Integer> singleApplyService;
	private static TeamApplyService<TeamApply, Integer> teamApplyService;
	private static AssistantService<Assistant, Integer> assistantService;
	private static StudentService<Student, Integer> studentService;
	private static GroupService<Group, Integer> groupService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext ctx = new ClassPathXmlApplicationContext("conf/spring/applicationContext.xml");
			System.out.println("ctx: " + ctx);
			activityService = (ActivityService<Activity, Integer>) ctx.getBean("activityService");
			activityTypeService = (ActivityTypeService<ActivityType, Integer>) ctx.getBean("activityTypeService");
			activityApplyService = (ActivityApplyService<ActivityApply, Integer>) ctx.getBean("activityApplyService");
			singleApplyService = (SingleApplyService<SingleApply, Integer>) ctx.getBean("singleApplyService");
			teamApplyService = (TeamApplyService<TeamApply, Integer>) ctx.getBean("teamApplyService");
			assistantService = (AssistantService<Assistant, Integer>) ctx.getBean("assistantService");
			studentService = (StudentService<Student, Integer>) ctx.getBean("studentService");
			groupService = (GroupService<Group, Integer>) ctx.getBean("groupService");
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void addType() {
		Date nextDate = getDate(3);//学术活动在三个月后结束
		Assistant ass = assistantService.getAllEntity(Assistant.class).get(0);
		for(int i = 1; i <= 10; i++){
			ActivityType activityType = new ActivityType();
			activityType.setName("学术活动类型" + i);
			activityType.setLevel((int) Math.floor((Math.random() * 5 ) + 1));
			activityType.setIntro("学术活动类型" + i);
			Set<Activity> activitys = new HashSet<Activity>();
			for(int j = 1; j <= 5; j++){
				Activity activity = new Activity();
				activity.setName(i + "学术活动" + j);
				activity.setIntro(i + "学术活动" + j);
				activity.setSession(j);
				if(i % 3 == 0){
					activity.setApplyCount(1);
				}else{
					activity.setApplyCount(3);
				}
				activity.setOpusNeed(1);
				activity.setAirtime(new Date());
				activity.setDeadtime(nextDate);
				activity.setPublisher(ass);
				activitys.add(activity);
			}
			activityType.setActivitys(activitys);
			activityTypeService.addEntity(activityType);
			
		}
		
	}
	public Date getDate(int month){
		SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(new Date());
		String[] a = str.split("-");
		Date date;
		try {
			String test = a[0] + "-" + (Integer.parseInt(a[1]) + month) + "-" + a[2];
			System.out.println("test : " + test);
			date = sdf.parse(test);
			sdf =   new SimpleDateFormat("yyyy年MM月dd日");
			System.out.println("date : " + sdf.format(date));
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Test
	public void apply() {
		List<Activity> activitys = activityService.getAllEntity(Activity.class);
		List<Student> students = studentService.getAllEntity(Student.class);
		List<Group> groups = groupService.getAllEntity(Group.class);
		Assistant ass = assistantService.getAllEntity(Assistant.class).get(0);
		for(int i = 0; i < activitys.size(); i++){
			if(activitys.get(i).getApplyCount() == 1){
				for(int j = 0; j < students.size(); j += 3){
					SingleApply sa = new SingleApply();
					sa.setActivity(activitys.get(i));
					sa.setStudent(students.get(j));
					sa.setApplytime(new Date());
					sa.setEndtime(new Date());
					sa.setOperator(ass);
					sa.setStatus(2); //1为申请，2为通过，3为拒绝
					singleApplyService.addEntity(sa);
				}
			}
			else{
				for(int j = 0; j < groups.size(); j++){
					TeamApply ta = new TeamApply();
					ta.setActivity(activitys.get(i));
					ta.setGroup(groups.get(j));
					Set<Student> members = groups.get(j).getMembers();
					Set<Student> applicants = new HashSet<Student>();
					for (Iterator iterator = members.iterator(); iterator.hasNext();) {
						Student member = (Student) iterator.next();
						applicants.add(member);
						if(applicants.size() >= 3) break;
						
					}
					ta.setApplicants(applicants);
					ta.setApplytime(new Date());
					ta.setEndtime(new Date());
					ta.setOperator(ass);
					ta.setStatus(2); //1为申请，2为通过，3为拒绝
					teamApplyService.addEntity(ta);
				}
			}
		}
	}
}
