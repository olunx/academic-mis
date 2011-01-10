package cn.gdpu.jstl;

import cn.gdpu.vo.ActivityApply;
import cn.gdpu.vo.SingleApply;
import cn.gdpu.vo.Student;
import cn.gdpu.vo.TeamApply;


public class OpusFunctions {
	/**
	 * 自定义标签my:isMyOpus函数,检查现在是否该学生有没有权限修改作品
	 * @param opus
	 * @param student
	 * @return true = 在报名时间内 ， false = 不在报名时间内
	 */
	public static boolean isMyOpus(ActivityApply aa, Student student) {
		if(aa.getActivity().getApplyCount() == 1){
			SingleApply sa = (SingleApply) aa;
			if(sa.getStudent().getId() == student.getId()) return true;
		}else{
			TeamApply ta = (TeamApply) aa;
			if(ta.getGroup().getCaptain().getId() == student.getId()) return true;
		}
		return false;
	}
}
