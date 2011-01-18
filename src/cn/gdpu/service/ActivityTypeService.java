package cn.gdpu.service;

import java.io.Serializable;

import cn.gdpu.vo.ActivityType;


public interface ActivityTypeService<T, ID extends Serializable> extends BaseService<T, ID> {
	public abstract ActivityType getActivityTypeByName(String name);
}