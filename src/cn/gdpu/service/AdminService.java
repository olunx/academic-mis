package cn.gdpu.service;

import java.io.Serializable;

import cn.gdpu.vo.Admin;

public interface AdminService<T, ID extends Serializable> extends BaseService<T, ID> {
	
	public abstract Admin getAdminByUsernameAndPassword(String username, String password);
	public abstract Admin getAdminByUsername(String username);
}
