package cn.gdpu.jstl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Assistant;
import cn.gdpu.vo.Feed;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.Teacher;
public class Functions {
	public static String formatDate(Date date) {
		Calendar cal = Calendar.getInstance();
		Calendar nowcal = Calendar.getInstance();
		cal.setTime(date);
		long longtime = (nowcal.getTimeInMillis() - cal.getTimeInMillis()) / 1000;

		long sec = longtime % 60;
		long min = longtime / 60;
		long hour = longtime / (60 * 60);
		long day = longtime / (60*60*24);
		if (longtime >= 4 * 24 * 60 * 60)
			return new SimpleDateFormat("MM月dd日 hh:mm").format(date);
		else if (longtime >= 24 * 60 * 60 && longtime < 4 * 24 * 60 * 60)
			return day + "天前";
		else if (longtime > 60 * 60)
			return hour + "小时前";
		else if (longtime > 60)
			return min + "分钟前";
		else if (longtime > 10)
			return sec + "秒前";
		else if (longtime >= 0)
			return "刚刚";
		else
			return new SimpleDateFormat("yyyy-MM-dd hh:mm").format(date);
	};
	
	public static int userTypeCompare(Object object) {
		if(object instanceof Admin)
			return 1;
		else if(object instanceof Assistant)
			return 2;
		else if(object instanceof Student)
			return 3;
		else if(object instanceof Teacher)
			return 4;
		else if(object instanceof Teacher)
			return 4;
		else return 0;
	}
	
	
	/**
	 * 1:系统消息 2:管理者消息 (0-9系统自定义消息)
	 * 11:Activity 12:ActivityApply 13:ActivityResult(10-19学术自定义消息)
	 * 21:group 22:groupApply(20-29学习小组自定义消息)
	 * 31:subject 32:subjectApply(30-39科研课题消息)
	 * 
	 * 
	 */
	public static String checkFeedType(Feed feed) {
		int type = feed.getType();
		if(type >= 0 && type < 10)
			return "系统消息";
		else if(type >= 10 && type < 20)
			return "学术活动";
		else if(type >= 20 && type < 30)
			return "学习小组";
		else if(type >= 30 && type < 40)
			return "科研课题";
		else
			return "系统消息";
	}
}
