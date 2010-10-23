package cn.gdpu.service.impl;


import java.util.List;

import cn.gdpu.dao.impl.AdminDaoImpl;
import cn.gdpu.service.AdminService;
import cn.gdpu.vo.Admin;

public class AdminServiceImpl extends BaseServiceImpl<Admin, Integer, AdminDaoImpl> implements AdminService<Admin, Integer> {

	public Admin getAdminByUsernameAndPassword(String username, String password) {
		String hql ="from Admin a where a.username = '" + username + "' and a.password = '" + password + "'";
		List<Admin> admins = getBaseDao().queryByHql(Admin.class, hql);
		if(admins != null && admins.size()!= 0){
			return admins.get(0);
		}else{
			return null;
		}
	}

	public Admin getAdminByUsername(String username) {
		String hql ="from Admin a where a.username = '" + username + "'";
		List<Admin> admins = getBaseDao().queryByHql(Admin.class, hql);
		if(admins != null && admins.size()!= 0){
			return admins.get(0);
		}else{
			return null;
		}
	}
}
