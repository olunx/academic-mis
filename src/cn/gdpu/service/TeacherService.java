package cn.gdpu.service;

import java.io.Serializable;

import cn.gdpu.vo.Teacher;


public interface TeacherService<T, ID extends Serializable> extends BaseService<T, ID> {
	public abstract Teacher getTeacherByUsernameAndPassword(String username, String password);
	public abstract Teacher getTeacherByUsername(String username);
	public abstract Teacher getTeacherByTnum(String tnum);
}