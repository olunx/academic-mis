package cn.gdpu.service;

import java.io.Serializable;

import cn.gdpu.vo.ActivityType;
import cn.gdpu.vo.NoticeType;

public interface NoticeTypeService<T, ID extends Serializable> extends BaseService<T, ID> {
	public abstract NoticeType getNoticeTypeByName(String name);
}