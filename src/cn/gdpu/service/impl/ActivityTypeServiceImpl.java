package cn.gdpu.service.impl;

import java.util.List;

import cn.gdpu.dao.impl.*;import cn.gdpu.service.*;import cn.gdpu.vo.*;

public class ActivityTypeServiceImpl extends BaseServiceImpl<ActivityType, Integer, ActivityTypeDaoImpl> implements ActivityTypeService<ActivityType, Integer> {

	@Override
	public ActivityType getActivityTypeByName(String name) {
		String hql ="from ActivityType at where at.name = '" + name + "'";
		List<ActivityType> ats = getBaseDao().queryByHql(ActivityType.class, hql);
		if(ats != null && ats.size()!= 0){
			return ats.get(0);
		}else{
			return null;
		}
	}

}