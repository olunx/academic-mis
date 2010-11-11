package cn.gdpu.service.impl;

import java.util.List;

import cn.gdpu.dao.impl.*;import cn.gdpu.service.*;import cn.gdpu.vo.*;

public class StudentServiceImpl extends BaseServiceImpl<Student, Integer, StudentDaoImpl> implements StudentService<Student, Integer> {

	@Override
	public Student getStudentByUsername(String username) {
		String hql ="from Student s where s.username = '" + username + "'";
		List<Student> students = getBaseDao().queryByHql(Student.class, hql);
		if(students != null && students.size()!= 0){
			return students.get(0);
		}else{
			return null;
		}
	}
	
	@Override
	public Student getStudentByStuNo(String stuNo) {
		String hql ="from Student s where s.stuNo = '" + stuNo + "'";
		List<Student> students = getBaseDao().queryByHql(Student.class, hql);
		if(students != null && students.size()!= 0){
			return students.get(0);
		}else{
			return null;
		}
	}

	@Override
	public Student getStudentByUsernameAndPassword(String username,	String password) {
		String hql ="from Student s where s.username = '" + username + "' and s.password = '" + password + "'";
		List<Student> students = getBaseDao().queryByHql(Student.class, hql);
		if(students != null && students.size()!= 0){
			return students.get(0);
		}else{
			return null;
		}
	}

}