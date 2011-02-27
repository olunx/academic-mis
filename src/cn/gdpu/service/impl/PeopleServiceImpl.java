package cn.gdpu.service.impl;

import java.util.List;

import cn.gdpu.dao.impl.*;import cn.gdpu.service.*;import cn.gdpu.vo.*;

public class PeopleServiceImpl extends BaseServiceImpl<People, Integer, PeopleDaoImpl> implements PeopleService<People, Integer> {

	@Override
	public People getPeopleByUsername(String username) {
		String hql ="from People p where p.username = '" + username + "'";
		List<People> peoples = getBaseDao().queryByHql(People.class, hql);
		if(peoples != null && peoples.size()!= 0){
			return peoples.get(0);
		}else{
			return null;
		}
	}

}