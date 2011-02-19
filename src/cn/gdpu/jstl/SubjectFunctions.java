package cn.gdpu.jstl;

import java.util.Date;

import cn.gdpu.vo.Activity;
import cn.gdpu.vo.ActivityApply;
import cn.gdpu.vo.SingleApply;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.Subject;
import cn.gdpu.vo.SubjectApply;
import cn.gdpu.vo.Teacher;
import cn.gdpu.vo.TeamApply;

public class SubjectFunctions {
	/**
	 * 自定义标签my:subjectApplyCount函数 ,检查正在申请报名课题招募的人数
	 * @param subject
	 * @return count
	 */
	public static int subjectApplyCount(Subject subject){
		int count =0;
		for(SubjectApply sa : subject.getSubjectApplys()){
			if(sa.getStatus() == 1) count++;
		}
		return count;
	}
	
	/**
	 * 自定义标签my:subjectApplyCount函数 ,检查已经成功报名该课题的人数
	 * @param subject
	 * @return
	 */
	public static int subjectApplyDoneCount(Subject subject){
		int count =0;
		for(SubjectApply sa : subject.getSubjectApplys()){
			if(sa.getStatus() == 2) count++;
		}
		return count;
	}
	
	/**
	 * 自定义标签my:mySubjectApplyStatus函数,检查我的课题招募报名情况
	 * @param subject
	 * @param student
	 * @return 1=申请，2=通过，3=拒绝
	 */
	public static int mySubjectApplyStatus(Subject subject, Student student) {
		if (subject != null && student != null){
			//判断课题招募报名成功的成员里是否存在该student
			for (SubjectApply sa : subject.getSubjectApplys()) {
				if(sa.getStudent().getId() == student.getId()) 
					return sa.getStatus();
			}
		}
		return 0;
	}
	
	/**
	 * 自定义标签my:isSubjectApplyTime函数,检查现在是否为该课题的招募时间
	 * @param subject
	 * @return true = 在招募时间内 ， false = 不在招募时间内
	 */
	public static boolean isSubjectApplyTime(Subject subject) {
		Date toDay = new Date();
		//检查是否不在报名时间内
		if(toDay.getTime() < subject.getAirtime().getTime() || toDay.getTime() > subject.getDeadtime().getTime()) 
			return true;
		else
			return false;
	}
	
}
