package cn.gdpu.jstl;


import cn.gdpu.vo.Group;
import cn.gdpu.vo.GroupApply;
import cn.gdpu.vo.Student;

public class GroupFunctions {
	
	/**
	 * 自定义标签my:groupApplyCount函数 ,检查申请加入小组人数
	 * @param gas
	 * @return
	 */
	public static int groupApplyCount(Group group){
		int count =0;
		for(GroupApply ga : group.getGroupApplys()){
			if(ga.getStatus() == 1) count++;
		}
		return count;
	}
	/**
	 * 自定义标签my:isMyGroup函数,检查是否我的群组
	 * @param group
	 * @param student
	 * @return
	 */
	public static Boolean isMyGroup(Group group, Student student) {
		if (student != null && group != null){
			//判断小组成员里是否存在该student
			for (Student stu : group.getMembers()) {
				if(stu.getId() == student.getId()) return true;
			}
		}
		return false;
	}
	/**
	 * 自定义标签my:isMyApplyGroup函数,检查是否已经申请加入该群组
	 * @param group
	 * @param student
	 * @return
	 */
	public static Boolean isMyApplyGroup(Group group, Student student) {
		if (student != null && group != null){
			//判断小组成员里是否存在该student
			for (GroupApply ga : group.getGroupApplys()) {
				if(ga.getStudent().getId() == student.getId()) return true;
			}
		}
		return false;
	}
}
