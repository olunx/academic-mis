package cn.gdpu.action;


import cn.gdpu.service.NoticeTypeService;
import cn.gdpu.util.Log;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Manager;
import cn.gdpu.vo.NoticeType;

@SuppressWarnings("serial")
public class NoticeTypeAction extends BaseAction {
	
	private NoticeTypeService<NoticeType, Integer> noticeTypeService;
	private NoticeType noticeType;
	private NoticeType ntDto;
	private PageBean pageBean;
	private int page;
	private int id;
	
	@Override
	public String add() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(noticeTypeService.getNoticeTypeByName(ntDto.getName()) != null) return super.goAdd(); //该通知主题已经存在
			noticeType = new NoticeType();
			noticeType.setName(ntDto.getName());
			noticeTypeService.addEntity(noticeType);
			Log.init(getClass()).info(manager.getRealName() + "添加通知类型  " + noticeType.getName() + "成功");
			
			Admin admin = manager instanceof Admin ? (Admin)manager : null;
			if(admin != null)
				return "admin_list";
			else
				return super.goAdd();
		}
		return ERROR;
		
	}

	@Override
	public String delete() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(id == 0) return ERROR;
			noticeType = noticeTypeService.getEntity(NoticeType.class, id);
			if(noticeType == null) return ERROR;
			noticeTypeService.deleteEntity(NoticeType.class, id);
			Log.init(getClass()).info(manager.getRealName() + "删除通知类型 " + noticeType.getName());
			
			Admin admin = manager instanceof Admin ? (Admin)manager : null;
			if(admin != null)
				return "admin_list";
			else
				return super.delete();
		}
		return ERROR;
	}

	@Override
	public String deleteMany() {
		// TODO Auto-generated method stub
		return super.deleteMany();
	}

	@Override
	public String goAdd() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			Admin admin = manager instanceof Admin ? (Admin)manager : null;
			if(admin != null)
				return "admin_addPage";
			else
				return super.goAdd();
		}
		return ERROR;
	}

	@Override
	public String goModify() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			noticeType = noticeTypeService.getEntity(NoticeType.class, id);
			
			Admin admin = manager instanceof Admin ? (Admin)manager : null;
			if(admin != null)
				return "admin_nodifyPage";
			else
				return super.goModify();
		}
		return ERROR;
	}

	@Override
	public String list() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			this.pageBean = noticeTypeService.queryForPage(NoticeType.class, 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			
			Admin admin = manager instanceof Admin ? (Admin)manager : null;
			if(admin != null)
				return "admin_listPage";
			else
				return super.list();
		}
		return ERROR;
	}

	@Override
	public String modify() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			noticeType = noticeTypeService.getEntity(NoticeType.class, id);
			if(noticeType == null) return ERROR;
			noticeType.setName(ntDto.getName());
			noticeTypeService.updateEntity(noticeType);
			Log.init(getClass()).info(manager.getRealName() + "修改通知类型  " + noticeType.getName() + "成功");
			
			Admin admin = manager instanceof Admin ? (Admin)manager : null;
			if(admin != null)
				return "admin_list";
			else
				return super.modify();
		}
		return ERROR;
		
	}

	@Override
	public String view() {
		// TODO Auto-generated method stub
		return super.view();
	}

	//getter and setter
	public NoticeTypeService<NoticeType, Integer> getNoticeTypeService() {
		return noticeTypeService;
	}

	public void setNoticeTypeService(
			NoticeTypeService<NoticeType, Integer> noticeTypeService) {
		this.noticeTypeService = noticeTypeService;
	}

	public NoticeType getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(NoticeType noticeType) {
		this.noticeType = noticeType;
	}

	public NoticeType getNtDto() {
		return ntDto;
	}

	public void setNtDto(NoticeType ntDto) {
		this.ntDto = ntDto;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
