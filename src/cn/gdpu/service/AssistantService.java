package cn.gdpu.service;

import java.io.Serializable;

import cn.gdpu.vo.Assistant;

public interface AssistantService<T, ID extends Serializable> extends BaseService<T, ID> {

	public abstract Assistant getAssistantByUsernameAndPassword(String username, String password);
	public abstract Assistant getAssistantByUsername(String username);
}