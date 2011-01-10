package cn.gdpu.service.impl;

import java.util.List;

import cn.gdpu.dao.impl.*;import cn.gdpu.service.*;import cn.gdpu.vo.*;

public class GroupServiceImpl extends BaseServiceImpl<Group, Integer, GroupDaoImpl> implements GroupService<Group, Integer> {

	@Override
	public Group getGroupByName(String name) {
		String hql ="from Group g where g.name = '" + name + "'";
		List<Group> group = getBaseDao().queryByHql(Group.class, hql);
		if(group != null && group.size()!= 0){
			return group.get(0);
		}else{
			return null;
		}
	}

}