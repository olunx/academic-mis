package cn.gdpu.service;

import java.io.Serializable;

import cn.gdpu.vo.People;

public interface PeopleService<T, ID extends Serializable> extends BaseService<T, ID> {
	public abstract People getPeopleByUsername(String username);
}