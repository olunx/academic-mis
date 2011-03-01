package cn.gdpu.jstl;

import java.util.Date;

import cn.gdpu.vo.Activity;
import cn.gdpu.vo.ActivityApply;
import cn.gdpu.vo.Group;
import cn.gdpu.vo.SingleApply;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.TeamApply;

public class ActivityFunctions {
	/**
	 * 自定义标签my:activityApplyDoneCount函数 ,检查已经成功报名了活动的小组数
	 * @param gas
	 * @return
	 */
	public static int activityApplyDoneCount(Activity activity){
		int count =0;
		for(ActivityApply aa : activity.getActivityApplys()){
			if(aa.getStatus() == 2) count++;
		}
		return count;
	}
	/**
	 * 自定义标签my:activityApplyCount函数 ,检查报名活动的小组数
	 * @param gas
	 * @return
	 */
	public static int activityApplyCount(Activity activity){
		int count =0;
		for(ActivityApply aa : activity.getActivityApplys()){
			if(aa.getStatus() == 1) count++;
		}
		return count;
	}
	/**
	 * 自定义标签my:isMyActivity函数,检查我的小组是否已经报名成功了
	 * @param activity
	 * @param student
	 * @return 1=我个人报名成功,2=我创建的小组已经报名成功，3=我所在的小组已经报名成功
	 */
	public static int isMyActivity(Activity activity, Student student) {
		if (activity != null && student != null){
			//判断活动报名成功的成员里是否存在该student
			if(activity.getApplyCount() == 1){
				for (ActivityApply aa : activity.getActivityApplys()) {
					if(aa.getStatus() != 2) continue;
					SingleApply sa = (SingleApply) aa;
					if(sa.getApplicant().getId() == student.getId()) return 1;
				}
			}else{
				for (ActivityApply aa : activity.getActivityApplys()) {
					if(aa.getStatus() != 2) continue;
					TeamApply ta  = (TeamApply) aa;
					if(aa.getStatus() != 1) continue;
					if(ta.getGroup().getCaptain().getId() == student.getId()) return 2;
					for(Student stu : ta.getApplicants())
						if(stu.getId() == student.getId()) return 3;
				}
			}
		}
		return 0;
	}
	
	/**
	 * 自定义标签my:isSingleApplyDone函数,检查我是否报名该活动-个人报名
	 * @param activity
	 * @param student
	 * @return
	 */
	public static boolean isSingleApplyDone(Activity activity, Student student) {
		if (student != null && activity != null){
				//判断活动报名审核成员里是否存在该student
				if(activity.getApplyCount() == 1){
					for (ActivityApply aa : activity.getActivityApplys()) {
						SingleApply sa = (SingleApply) aa;
						if(sa.getApplicant().getId() == student.getId()) return true;
					}
				}
		}
		return false;
	}
	/**
	 * 自定义标签my:isTeamApplyDone函数,检查我是否报名该活动-团队报名
	 * @param activity
	 * @param student
	 * @return
	 */
	public static Group isTeamApplyDone(Activity activity, Student student) {
		if (student != null && activity != null){
			//判断活动报名审核成员里是否存在该student
			if(activity.getApplyCount() != 1){
				for (ActivityApply aa : activity.getActivityApplys()) {
					TeamApply ta  = (TeamApply) aa;
					if(aa.getStatus() != 1) continue;
					for(Student stu : ta.getApplicants())
						if(stu.getId() == student.getId()) return ta.getGroup();
				}
			}
		}
		return null;
	}
	/**
	 * 自定义标签my:isActivityApplyTime函数,检查现在是否为该活动报名时间
	 * @param activity
	 * @return true = 在报名时间内 ， false = 不在报名时间内
	 */
	public static boolean isActivityApplyTime(Activity activity) {
		Date toDay = new Date();
		//检查是否不在报名时间内
		if(toDay.getTime() < activity.getAirtime().getTime() || toDay.getTime() > activity.getDeadtime().getTime()) 
			return true;
		else
			return false;
	}
}
