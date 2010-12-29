package cn.gdpu.service.impl;

import java.util.List;

import cn.gdpu.dao.impl.*;import cn.gdpu.service.*;import cn.gdpu.vo.*;

public class NoticeTypeServiceImpl extends BaseServiceImpl<NoticeType, Integer, NoticeTypeDaoImpl> implements NoticeTypeService<NoticeType, Integer> {
	@Override
	public NoticeType getNoticeTypeByName(String name) {
		String hql ="from NoticeType nt where nt.name = '" + name + "'";
		List<NoticeType> nts = getBaseDao().queryByHql(NoticeType.class, hql);
		if(nts != null && nts.size()!= 0){
			return nts.get(0);
		}else{
			return null;
		}
	}
}