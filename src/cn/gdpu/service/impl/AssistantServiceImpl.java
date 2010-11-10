package cn.gdpu.service.impl;

import java.util.List;

import cn.gdpu.dao.impl.*;import cn.gdpu.service.*;import cn.gdpu.vo.*;

public class AssistantServiceImpl extends BaseServiceImpl<Assistant, Integer, AssistantDaoImpl> implements AssistantService<Assistant, Integer> {

	@Override
	public Assistant getAssistantByUsername(String username) {
		String hql ="from Assistant a where a.username = '" + username + "'";
		List<Assistant> assistants = getBaseDao().queryByHql(Assistant.class, hql);
		if(assistants != null && assistants.size()!= 0){
			return assistants.get(0);
		}else{
			return null;
		}
	}

	@Override
	public Assistant getAssistantByUsernameAndPassword(String username,	String password) {
		String hql ="from Assistant a where a.username = '" + username + "' and a.password = '" + password + "'";
		List<Assistant> assistants = getBaseDao().queryByHql(Assistant.class, hql);
		if(assistants != null && assistants.size()!= 0){
			return assistants.get(0);
		}else{
			return null;
		}
	}

}