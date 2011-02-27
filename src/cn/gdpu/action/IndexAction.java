package cn.gdpu.action;

import java.util.List;

import cn.gdpu.dto.LoginDto;
import cn.gdpu.service.ActivityService;
import cn.gdpu.service.AssistantService;
import cn.gdpu.service.FeedService;
import cn.gdpu.service.NoticeHotService;
import cn.gdpu.service.NoticeService;
import cn.gdpu.service.OpusService;
import cn.gdpu.service.StudentService;
import cn.gdpu.service.SubjectService;
import cn.gdpu.service.TeacherService;
import cn.gdpu.util.Log;
import cn.gdpu.util.Md5;
import cn.gdpu.vo.Activity;
import cn.gdpu.vo.Assistant;
import cn.gdpu.vo.Feed;
import cn.gdpu.vo.Notice;
import cn.gdpu.vo.NoticeHot;
import cn.gdpu.vo.Opus;
import cn.gdpu.vo.People;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.Subject;
import cn.gdpu.vo.Teacher;

public class IndexAction extends BaseAction {
	private StudentService<Student, Integer> studentService;
	private AssistantService<Assistant, Integer> assistantService;
	private TeacherService<Teacher, Integer> teacherService;
	private NoticeHotService<NoticeHot, Integer> noticeHotService;
	private NoticeService<Notice, Integer> noticeService;
	private SubjectService<Subject, Integer> subjectService;
	private ActivityService<Activity, Integer> activityService;
	private OpusService<Opus, Integer> opusService;
	private FeedService<Feed, Integer> feedService;
	private LoginDto loginDto;
	
	public String index(){//首页信息，未完成
		//热门通知
		String hql = "from NoticeHot nh order by nh.rank asc, nh.id desc";
		List<NoticeHot> nhs = noticeHotService.queryForLimit(hql, 0, 6);
		if(nhs.isEmpty() || nhs.size() == 0)
			nhs = null;
		getRequest().put("nhs", nhs);
		//最新通知
		List<Notice> notices = noticeService.queryForLimit("from Notice n order by n.id desc", 0, 10);
		if(notices.isEmpty() || notices.size() == 0)
			notices = null;
		getRequest().put("notices", notices);
		//优秀学生
		List<Student> goodStus = studentService.queryForLimit("from Student s order by s.credit desc", 0, 10);
		if(goodStus.isEmpty() || goodStus.size() == 0)
			goodStus = null;
		getRequest().put("goodStus", goodStus);
		//名师课题
		List<Subject> subjects = subjectService.queryForLimit("from Subject s order by s.id desc", 0, 8);
		if(subjects.isEmpty() || subjects.size() == 0)
			subjects = null;
		getRequest().put("subjects", subjects);
		//外包课题
		List<Notice> pns = noticeService.queryForLimit("from Notice n where n.type.name = '外包课题' order by n.id desc", 0, 8);
		if(pns.isEmpty() || pns.size() == 0)
			pns = null;
		getRequest().put("pns", pns);
		//学术活动
		/*List<Activity> activitys = activityService.queryForLimit("from Activity a order by a.id desc", 0, 8);
		if(activitys.isEmpty() || activitys.size() == 0)
			activitys = null;
		getRequest().put("activitys", activitys);*/
		//作品展示
		List<Opus> opuses= opusService.queryForLimit("from Opus o order by o.id desc", 0, 10);
		if(opuses.isEmpty() || opuses.size() == 0)
			opuses = null;
		getRequest().put("opuses", opuses);
		return SUCCESS;
	}

	public String login(){
		//学生登陆
		if(loginDto.getLoginType() == 0){      
			if(loginDto.getUsername() != null && !loginDto.getUsername().equals("") 
					&& loginDto.getPassword() != null && !loginDto.getPassword().equals("")){
				Student student = studentService.getStudentByUsernameAndPassword(loginDto.getUsername(), Md5.getMD5(loginDto.getPassword().getBytes()));
				if(student != null){
					getSession().put("user", student);
					Log.init(getClass()).info("学生用户登陆成功：" + student.getRealName());
					return "login";
				}else{
					return "gologin";
				}
			}
			return "gologin";
			
		}
		//教师登陆
		if(loginDto.getLoginType() == 1){      
			if(loginDto.getUsername() != null && !loginDto.getUsername().equals("") 
					&& loginDto.getPassword() != null && !loginDto.getPassword().equals("")){
				Teacher teacher = teacherService.getTeacherByUsernameAndPassword(loginDto.getUsername(), Md5.getMD5(loginDto.getPassword().getBytes()));
				if(teacher!= null){
					getSession().put("user", teacher);
					Log.init(getClass()).info("教师登陆成功：" + teacher.getRealName());
					return "login";
				}else{
					return "gologin";
				}
			}
			return "gologin";
		}
		//管理员助理登陆
		if(loginDto.getLoginType() == 2){      
			if(loginDto.getUsername() != null && !loginDto.getUsername().equals("") 
					&& loginDto.getPassword() != null && !loginDto.getPassword().equals("")){
				Assistant assistant = assistantService.getAssistantByUsernameAndPassword(loginDto.getUsername(), Md5.getMD5(loginDto.getPassword().getBytes()));
				if(assistant != null){
					getSession().put("user", assistant);
					Log.init(getClass()).info("管理员助理登陆成功：" + assistant.getRealName());
					return "login";
				}else{
					return "gologin";
				}
			}
			return "gologin";
		}
		return ERROR;
	}
	
	public String logout(){
		if(getSession().get("user") != null) 
			getSession().remove("user");
		return SUCCESS;
	}
	
	public String myindex(){
		People people = (People) getSession().get("user");
		if(people != null){
			//三角色主页公共部分
			//系统通知			
			List<Notice> notices = noticeService.queryForLimit("from Notice n order by n.id desc", 0, 10);
			if(notices.isEmpty() || notices.size() == 0)
				notices = null;
			getRequest().put("notices", notices);
			//Feed消息
			List<Feed> feeds = feedService.queryForLimit("from Feed f where '" + people.getId() + "' = some elements(f.recipients) order by f.hasRead asc, f.id desc", 0, 10);
			if(feeds.isEmpty() || feeds.size() == 0)
				feeds = null;
			getRequest().put("feeds", feeds);
			
			int go = 0;
			go = people instanceof Student ? 1 : (people instanceof Teacher ? 2 : (people instanceof Assistant ? 3 : 0));
			switch (go) {
			case 1:
				return "stulogin";
			case 2:
				return "tchlogin";
			case 3:
				return "asslogin";
			default:
				break;
			} 
		}
		return "gologin";
	}
	//getter and setter

	public StudentService<Student, Integer> getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService<Student, Integer> studentService) {
		this.studentService = studentService;
	}

	public AssistantService<Assistant, Integer> getAssistantService() {
		return assistantService;
	}

	public void setAssistantService(
			AssistantService<Assistant, Integer> assistantService) {
		this.assistantService = assistantService;
	}

	public TeacherService<Teacher, Integer> getTeacherService() {
		return teacherService;
	}

	public void setTeacherService(TeacherService<Teacher, Integer> teacherService) {
		this.teacherService = teacherService;
	}

	public NoticeHotService<NoticeHot, Integer> getNoticeHotService() {
		return noticeHotService;
	}

	public void setNoticeHotService(
			NoticeHotService<NoticeHot, Integer> noticeHotService) {
		this.noticeHotService = noticeHotService;
	}

	public NoticeService<Notice, Integer> getNoticeService() {
		return noticeService;
	}

	public void setNoticeService(NoticeService<Notice, Integer> noticeService) {
		this.noticeService = noticeService;
	}
	public SubjectService<Subject, Integer> getSubjectService() {
		return subjectService;
	}

	public void setSubjectService(SubjectService<Subject, Integer> subjectService) {
		this.subjectService = subjectService;
	}

	public ActivityService<Activity, Integer> getActivityService() {
		return activityService;
	}

	public void setActivityService(
			ActivityService<Activity, Integer> activityService) {
		this.activityService = activityService;
	}

	public OpusService<Opus, Integer> getOpusService() {
		return opusService;
	}

	public void setOpusService(OpusService<Opus, Integer> opusService) {
		this.opusService = opusService;
	}

	public FeedService<Feed, Integer> getFeedService() {
		return feedService;
	}

	public void setFeedService(FeedService<Feed, Integer> feedService) {
		this.feedService = feedService;
	}

	public LoginDto getLoginDto() {
		return loginDto;
	}

	public void setLoginDto(LoginDto loginDto) {
		this.loginDto = loginDto;
	}
}
