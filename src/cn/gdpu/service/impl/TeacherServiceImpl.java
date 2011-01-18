package cn.gdpu.service.impl;

import java.util.List;

import cn.gdpu.dao.impl.*;import cn.gdpu.service.*;import cn.gdpu.vo.*;

public class TeacherServiceImpl extends BaseServiceImpl<Teacher, Integer, TeacherDaoImpl> implements TeacherService<Teacher, Integer> {

	@Override
	public Teacher getTeacherByTnum(String tnum) {
		String hql ="from Teacher t where t.tnum = '" + tnum + "'";
		List<Teacher> teachers = getBaseDao().queryByHql(Teacher.class, hql);
		if(teachers != null && teachers.size()!= 0){
			return teachers.get(0);
		}else{
			return null;
		}
	}

	@Override
	public Teacher getTeacherByUsername(String username) {
		String hql ="from Teacher t where t.username = '" + username + "'";
		List<Teacher> teachers = getBaseDao().queryByHql(Teacher.class, hql);
		if(teachers != null && teachers.size()!= 0){
			return teachers.get(0);
		}else{
			return null;
		}
	}

	@Override
	public Teacher getTeacherByUsernameAndPassword(String username,	String password) {
		String hql ="from Teacher t where t.username = '" + username + "' and t.password = '" + password + "'";
		List<Teacher> teachers = getBaseDao().queryByHql(Teacher.class, hql);
		if(teachers != null && teachers.size()!= 0){
			return teachers.get(0);
		}else{
			return null;
		}
	}

}