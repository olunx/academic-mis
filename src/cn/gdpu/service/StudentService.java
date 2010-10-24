package cn.gdpu.service;

import java.io.Serializable;

import cn.gdpu.vo.Student;


public interface StudentService<T, ID extends Serializable> extends BaseService<T, ID> {
	public abstract Student getStudentByUsernameAndPassword(String username, String password);
	public abstract Student getStudentByUsername(String username);
}