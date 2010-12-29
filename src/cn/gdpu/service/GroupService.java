package cn.gdpu.service;

import java.io.Serializable;

import cn.gdpu.vo.Group;

public interface GroupService<T, ID extends Serializable> extends BaseService<T, ID> {
	public abstract Group getGroupByName(String name);
}