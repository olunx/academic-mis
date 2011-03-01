package cn.gdpu.jstl;

import java.util.Set;

import cn.gdpu.vo.ActivityApply;
import cn.gdpu.vo.Comment;
import cn.gdpu.vo.Opus;
import cn.gdpu.vo.SingleApply;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.Teacher;
import cn.gdpu.vo.TeamApply;


public class OpusFunctions {
	/**
	 * 自定义标签my:isMyOpus函数,检查现在是否该学生有没有权限修改作品
	 * @param opus
	 * @param student
	 * @return true = 在报名时间内 ， false = 不在报名时间内
	 */
	public static boolean isMyOpus(ActivityApply aa, Student student) {
		if(aa == null && student == null) return false;
		if(aa.getActivity().getApplyCount() == 1){
			SingleApply sa = (SingleApply) aa;
			if(sa.getApplicant().getId() == student.getId()) return true;
		}else{
			TeamApply ta = (TeamApply) aa;
			if(ta.getGroup().getCaptain().getId() == student.getId()) return true;
		}
		return false;
	}
	
	/**
	 * 自定义标签my:evaluate函数，检查作品等级，1-10
	 * @param opus
	 * @return ★ ★ ★★  ☆
	 */
	public static String evaluate(Opus opus){
		if(opus != null ) {
			Set<Comment> cmts = opus.getComments();
			if(cmts == null || cmts.size() == 0) return "暂无点评";
			int sum = 0;
			int avg = 0;
			for (Comment cmt : cmts) {
				sum += cmt.getScore();
			}
			avg = sum/cmts.size();
			switch (avg) {
			case 10:
				return "★★★★★";
			case 9:
				return "★★★★☆";
			case 8:
				return "★★★★";
			case 7:
				return "★★★☆";
			case 6:
				return "★★★";
			case 5:
				return "★★☆";
			case 4:
				return "★★";
			case 3:
				return "★☆";
			case 2:
				return "★";
			case 1:
				return "☆";
			default:
				return "☆";
			}
		}
		return "null";
	}
	
	/**
	 * 自定义标签my:isIcanCmt函数，检查当前的老师是否已经点评了该作品
	 * @param opus
	 * @param teacher
	 * @return 
	 */
	public static boolean isIcanCmt(Opus opus, Teacher teacher){
		if(opus == null && teacher == null) return false;
		else{
			Set<Comment> cmts = opus.getComments();
			for (Comment cmt : cmts) {
				if(cmt.getTeacher().getId() == teacher.getId()) return false;
			}
			return true;
		}
	}
}
