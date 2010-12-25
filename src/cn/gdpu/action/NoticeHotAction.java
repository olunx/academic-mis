package cn.gdpu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.gdpu.dto.NoticeDto;
import cn.gdpu.service.NoticeHotService;
import cn.gdpu.service.NoticeService;
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
	private NoticeHot nhDto;
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
		Manager manager = (Manager) getSession().get("manager");
		if(manager != null){
			if(id <= 0) return ERROR;
			if(image == null) return ERROR;
			notice = noticeService.getEntity(Notice.class, id);
			if(notice.getNoticeHot() != null) return ERROR; //检测是否已经设置为热门通知
			noticeHot = new NoticeHot();
			noticeHot.setNotice(notice);
			noticeHot.setImage(image);
			System.out.println("nhDto.getRank() : " + nhDto.getRank());
			if(nhDto.getRank() > 6 || nhDto.getRank() < 1) return ERROR;
			System.out.println("sadfasdfsadf222222");
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
			List<NoticeHot> nhs = noticeHotService.getAllEntity(NoticeHot.class);
			System.out.println("nh3 : " );
			for(NoticeHot nh3 : nhs){
				System.out.print("nh3 : " +nh3.getNotice().getTitle() + ", ");
			}
			System.out.println("");
			return super.add();
		}
		return ERROR;
	}
	
	/**添加热门通知时，用来重新排序的递归
	 * @param nh
	 */
	public void changRank(NoticeHot nh){
		System.out.println("nh : " + nh.getNotice().getTitle() + " | rank : " + nh.getRank());
		NoticeHot nh2;
		System.out.println("hql : from NoticeHot nh where nh.rank ='" + (nh.getRank() + 1) + "'");
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
		// TODO Auto-generated method stub
		return super.delete();
	}

	@Override
	public String deleteMany() {
		// TODO Auto-generated method stub
		return super.deleteMany();
	}

	@Override
	public String goAdd() {
		Manager manager = (Manager) getSession().get("manager");
		if(manager != null){
			if(id <= 0) return ERROR;
			notice = noticeService.getEntity(Notice.class, id);
			if(notice == null) return ERROR;
			String hql = "from NoticeHot nh order by nh.rank asc, nh.id desc";
			List<NoticeHot> nhs = noticeHotService.queryForLimit(hql, 0, 6);
			if(nhs.isEmpty() || nhs.size() == 0)
				nhs = null;
			getRequest().put("nhs", nhs);
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
		Manager manager = (Manager) getSession().get("manager");
		if(manager != null){
			String hql = "from NoticeHot nh order by nh.rank asc, nh.id desc";
			List<NoticeHot> nhs = noticeHotService.queryForLimit(hql, 0, 6);
			if(nhs.isEmpty() || nhs.size() == 0)
				nhs = null;
			getRequest().put("nhs", nhs);
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

	public NoticeHot getNhDto() {
		return nhDto;
	}

	public void setNhDto(NoticeHot nhDto) {
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
