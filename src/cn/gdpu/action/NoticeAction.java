package cn.gdpu.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.gdpu.dto.NoticeDto;
import cn.gdpu.service.NoticeService;
import cn.gdpu.service.NoticeTypeService;
import cn.gdpu.util.Log;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Manager;
import cn.gdpu.vo.Notice;
import cn.gdpu.vo.NoticeType;

@SuppressWarnings("serial")
public class NoticeAction extends BaseAction {
	
	private NoticeService<Notice, Integer> noticeService;
	private NoticeTypeService<NoticeType, Integer> noticeTypeService;
	private Notice notice;
	private NoticeDto noticeDto;
	private PageBean pageBean;
	private int page;
	private int id;
	

	public void prepare() throws Exception {
		HttpServletRequest httpRequest = (HttpServletRequest) ServletActionContext.getRequest();
		String action=  httpRequest.getServletPath().split("/")[1];
		String[] uri=action.split("\\.");
		if(uri[0].equals("add")){
			List<NoticeType> nts = noticeTypeService.getAllEntity(NoticeType.class);
			getRequest().put("nts", nts);
		}
		if(uri[0].equals("modify")){
			List<NoticeType> nts = noticeTypeService.getAllEntity(NoticeType.class);
			getRequest().put("nts", nts);
		}
	}
	
	@Override
	public String add() {//文本编辑器图片未处理
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			NoticeType nt = noticeTypeService.getEntity(NoticeType.class, noticeDto.getType());
			if(nt == null) return ERROR;
			notice = new Notice();
			notice.setTitle(noticeDto.getTitle());
			notice.setType(nt);
			notice.setIsCmsAllow(noticeDto.getIsCmsAllow());
			notice.setContent(noticeDto.getContent());
			notice.setAuthor(manager);
			notice.setTime(new Date());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			notice.setRemark(sdf.format(new Date()) + " : " + manager.getRealName() + "发表通知 " + notice.getTitle() + " 成功;");
			noticeService.addEntity(notice);
			Log.init(getClass()).info(manager.getRealName() + "发表通知 " + notice.getTitle() + " 成功.");
			return super.add();
		}
		return ERROR;
	}

	@Override
	public String delete() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(id <= 0) return ERROR;
			notice = noticeService.getEntity(Notice.class, id);
			if(notice == null) return ERROR;
			noticeService.deleteEntity(Notice.class, id);
			Log.init(getClass()).info(manager.getRealName() + " 删除了通知 " + notice.getTitle());
			return super.delete();
		}
		return ERROR;
	}

	@Override
	public String deleteMany() {
		return super.deleteMany();
	}

	@Override
	public String goAdd() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			List<NoticeType> nts = noticeTypeService.getAllEntity(NoticeType.class);
			getRequest().put("nts", nts);
			return super.goAdd();
		}
		return ERROR;
	}

	@Override
	public String goModify() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(id <= 0) return ERROR;
			notice = noticeService.getEntity(Notice.class, id);
			List<NoticeType> nts = noticeTypeService.getAllEntity(NoticeType.class);
			getRequest().put("nts", nts);
			return super.goModify();
		}
		return ERROR;
	}

	@Override
	public String list() {
		this.pageBean = this.noticeService.queryForPage(Notice.class, 10, page);
		if (pageBean.getList().isEmpty())
			pageBean.setList(null);
		return super.list();
	}
	
	public String listType() {
		if(id <= 0) return "list";
		this.pageBean = this.noticeService.queryForPage("from Notice n where n.type.id = '" + id + "' order by n.id desc", 10, page);
		if (pageBean.getList().isEmpty())
			pageBean.setList(null);
		getRequest().put("noticetype", id);
		return "listType";
	}

	@Override
	public String modify() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(id <= 0) return ERROR;
			notice = noticeService.getEntity(Notice.class, id);
			NoticeType nt = noticeTypeService.getEntity(NoticeType.class, noticeDto.getType());
			if(nt == null) return ERROR;
			notice.setTitle(noticeDto.getTitle());
			notice.setType(nt);
			notice.setIsCmsAllow(noticeDto.getIsCmsAllow());
			notice.setContent(noticeDto.getContent());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			notice.setRemark(notice.getRemark() + sdf.format(new Date()) + " : " + manager.getRealName() + "修改通知 " + notice.getTitle() + " 成功;");
			noticeService.updateEntity(notice);
			Log.init(getClass()).info(manager.getRealName() + "修改通知 " + notice.getTitle() + " 成功.");
			return super.modify();
		}
		return ERROR;
	}

	@Override
	public String view() {
		if(id <= 0) return ERROR;
		notice = noticeService.getEntity(Notice.class, id);
		return super.view();
	}

	
	//getter and setter
	public NoticeService<Notice, Integer> getNoticeService() {
		return noticeService;
	}

	public void setNoticeService(NoticeService<Notice, Integer> noticeService) {
		this.noticeService = noticeService;
	}

	public NoticeTypeService<NoticeType, Integer> getNoticeTypeService() {
		return noticeTypeService;
	}

	public void setNoticeTypeService(
			NoticeTypeService<NoticeType, Integer> noticeTypeService) {
		this.noticeTypeService = noticeTypeService;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	public NoticeDto getNoticeDto() {
		return noticeDto;
	}

	public void setNoticeDto(NoticeDto noticeDto) {
		this.noticeDto = noticeDto;
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
