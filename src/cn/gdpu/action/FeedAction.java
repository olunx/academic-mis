package cn.gdpu.action;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import cn.gdpu.dto.FeedDto;
import cn.gdpu.service.FeedService;
import cn.gdpu.service.PeopleService;
import cn.gdpu.util.Log;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Feed;
import cn.gdpu.vo.Manager;
import cn.gdpu.vo.People;

public class FeedAction extends BaseAction {
	private FeedService<Feed, Integer> feedService;
	private PeopleService<People, Integer> peopleService;
	private Feed feed;
	private FeedDto feDto;
	private PageBean pageBean;
	private int page;
	private int id;
	
	@Override
	public String add() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager)getSession().get("user") : null;
		if(manager != null){
			feed = new Feed();
			feed.setHasRead(0);
			feed.setNews(feDto.getNews());
			Set<People> recipients = new HashSet<People>();
			String usernames[] = feDto.getRecipients().split(",");
			for (String username : usernames) {
				if(username == null || username.trim().equals("")) continue;
				People people = (People) peopleService.getPeopleByUsername(username);
				if(people != null){
					recipients.add(people);
				}else{
					continue;
				}
			}
			feed.setRecipients(recipients);
			feed.setTime(new Date());
			feed.setType(feDto.getType());
			feedService.addEntity(feed);
			Log.init(getClass()).info(manager.getRealName() + "添加了系统消息：" + feed.getNews());
			return super.add();
		}
		return ERROR;
		
	}
	@Override
	public String delete() {
		// TODO Auto-generated method stub
		return super.delete();
	}
	@Override
	public String goAdd() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager)getSession().get("user") : null;
		if(manager != null){
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
		Manager manager = getSession().get("user") instanceof Manager ? (Manager)getSession().get("user") : null;
		if(manager != null){
			this.pageBean = feedService.queryForPage("from Feed f where f.type >= 0 and f.type < 10", 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			return super.list();
			}
		return ERROR;
	}

	public String listMe() {
		People people = getSession().get("user") instanceof People ? (People)getSession().get("user") : null;
		if(people != null){
			this.pageBean = feedService.queryForPage("from Feed f where '" + people.getId() + "' = some elements(f.recipients) ", 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			return "listPage_me";
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
		if(id <= 0) return ERROR;
		feed = feedService.getEntity(Feed.class, id);
		if(feed == null) return ERROR;
		feed.setHasRead(1);
		feedService.updateEntity(feed);
		return super.view();
	}
	public String read(){
		if(id <= 0) return ERROR;
		feed = feedService.getEntity(Feed.class, id);
		if(feed == null) return ERROR;
		feed.setHasRead(1);
		feedService.updateEntity(feed);
		return "read";
	}
	
	//getter and setter
	public FeedService<Feed, Integer> getFeedService() {
		return feedService;
	}
	public void setFeedService(FeedService<Feed, Integer> feedService) {
		this.feedService = feedService;
	}
	public PeopleService<People, Integer> getPeopleService() {
		return peopleService;
	}
	public void setPeopleService(PeopleService<People, Integer> peopleService) {
		this.peopleService = peopleService;
	}
	public void setFeDto(FeedDto feDto) {
		this.feDto = feDto;
	}
	public Feed getFeed() {
		return feed;
	}
	public void setFeed(Feed feed) {
		this.feed = feed;
	}
	public FeedDto getFeDto() {
		return feDto;
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
