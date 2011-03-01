package cn.gdpu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.gdpu.dto.NoticeDto;
import cn.gdpu.dto.NoticeHotDto;
import cn.gdpu.service.NoticeHotService;
import cn.gdpu.service.NoticeService;
import cn.gdpu.util.Log;
import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Image;
import cn.gdpu.vo.Manager;
import cn.gdpu.vo.Notice;
import cn.gdpu.vo.NoticeHot;
import cn.gdpu.vo.NoticeType;

public class NoticeHotAction extends BaseAction {
	
	private NoticeService<Notice, Integer> noticeService;
	private NoticeHotService<NoticeHot, Integer> noticeHotService;
	private NoticeHot noticeHot;
	private Notice notice;
	private NoticeHotDto nhDto;
	private Image image;
	private int id;

	public void prepare() throws Exception {
		HttpServletRequest httpRequest = (HttpServletRequest) ServletActionContext.getRequest();
		String action=  httpRequest.getServletPath().split("/")[1];
		String[] uri=action.split("\\.");
		if(uri[0].equals("add")){
			Notice notice = noticeService.getEntity(Notice.class, id);
			String hql = "from NoticeHot nh order by nh.rank asc, nh.id desc";
			List<NoticeHot> nhs = noticeHotService.queryForLimit(hql, 0, 6);
			if(nhs.isEmpty() || nhs.size() == 0)
				nhs = null;
			getRequest().put("notice", notice);
			getRequest().put("nhs", nhs);
		}
		if(uri[0].equals("modify")){
			Notice notice = noticeService.getEntity(Notice.class, id);
			getRequest().put("notice", notice);
		}
	}
	
	@Override
	public String add() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(id <= 0) return ERROR;
			if(image == null) return ERROR;
			notice = noticeService.getEntity(Notice.class, id);
			if(notice.getNoticeHot() != null) return ERROR; //检测是否已经设置为热门通知
			noticeHot = new NoticeHot();
			noticeHot.setNotice(notice);
			noticeHot.setImage(image);
			if(nhDto.getRank() > 6 || nhDto.getRank() < 1) nhDto.setRank(1);//如果没有设定序号，或者输入的序号有错，自动当成第一个
			//为该插入的序号排序
			NoticeHot nh;
			List<NoticeHot> gfq = noticeHotService.getEntity(NoticeHot.class,"from NoticeHot nh where nh.rank ='" + nhDto.getRank() + "'");
			if(gfq != null && gfq.size() !=0){
				nh = gfq.get(0);
			}
			else{
				nh = null;
			}
			if(nh == null){
				System.out.println("nh == null");
				noticeHot.setRank(nhDto.getRank());
				noticeHotService.addEntity(noticeHot);
			}
			else{
				changRank(nh);
				noticeHot.setRank(nhDto.getRank());
				noticeHotService.addEntity(noticeHot);
			}
			Log.init(getClass()).info(manager.getRealName() + " 添加了热门通知 " + noticeHot.getNotice().getTitle());
			
			Admin admin = manager instanceof Admin ? (Admin)manager : null;
			if(admin != null)
				return "admin_list";
			else
				return super.add();
		}
		return ERROR;
	}
	
	/**添加热门通知时，用来重新排序的递归
	 * @param nh
	 */
	public void changRank(NoticeHot nh){
		NoticeHot nh2;
		List<NoticeHot> gfq = noticeHotService.getEntity(NoticeHot.class, "from NoticeHot nh where nh.rank ='" + (nh.getRank() + 1) + "'");
		if(gfq != null && gfq.size() !=0){
			nh2 = gfq.get(0);
		}
		else{
			nh2 = null;
		}
		if(nh2 == null ){
			nh.setRank(nh.getRank() + 1);
			noticeHotService.updateEntity(nh);
			return;
		}else if(nh2.getRank() == 7){
			nh.setRank(7);
			noticeHotService.updateEntity(nh);
			return;
		}else{
			changRank(nh2);
			nh.setRank(nh.getRank() + 1);
			noticeHotService.updateEntity(nh);
			return;
		}
	}

	@Override
	public String delete() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(id <= 0) return ERROR;
			noticeHot = noticeHotService.getEntity(NoticeHot.class, id);
			if(noticeHot == null) return ERROR;
			noticeHotService.deleteEntity(NoticeHot.class, id);
			Log.init(getClass()).info(manager.getRealName() + " 删除了热门通知 " + noticeHot.getNotice().getTitle());
			
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
			if(id <= 0) return ERROR;
			notice = noticeService.getEntity(Notice.class, id);
			if(notice == null) return ERROR;
			String hql = "from NoticeHot nh order by nh.rank asc, nh.id desc";
			List<NoticeHot> nhs = noticeHotService.queryForLimit(hql, 0, 6);
			if(nhs.isEmpty() || nhs.size() == 0)
				nhs = null;
			getRequest().put("nhs", nhs);
			
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
		// TODO Auto-generated method stub
		return super.goModify();
	}

	@Override
	public String list() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			String hql = "from NoticeHot nh order by nh.rank asc, nh.id desc";
			List<NoticeHot> nhs = noticeHotService.queryForLimit(hql, 0, 6);
			if(nhs.isEmpty() || nhs.size() == 0)
				nhs = null;
			getRequest().put("nhs", nhs);
			
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
		// TODO Auto-generated method stub
		return super.modify();
	}

	@Override
	public String view() {
		// TODO Auto-generated method stub
		return super.view();
	}

	
	//getter and setter
	public NoticeService<Notice, Integer> getNoticeService() {
		return noticeService;
	}

	public void setNoticeService(NoticeService<Notice, Integer> noticeService) {
		this.noticeService = noticeService;
	}

	public NoticeHotService<NoticeHot, Integer> getNoticeHotService() {
		return noticeHotService;
	}

	public void setNoticeHotService(
			NoticeHotService<NoticeHot, Integer> noticeHotService) {
		this.noticeHotService = noticeHotService;
	}

	public NoticeHot getNoticeHot() {
		return noticeHot;
	}

	public void setNoticeHot(NoticeHot noticeHot) {
		this.noticeHot = noticeHot;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	public void setNhDto(NoticeHotDto nhDto) {
		this.nhDto = nhDto;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

}
