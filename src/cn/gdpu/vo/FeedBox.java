package cn.gdpu.vo;


public class FeedBox {
	private int id;
	private Feed feed;
	private People people;
	private int hasRead;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Feed getFeed() {
		return feed;
	}
	public void setFeed(Feed feed) {
		this.feed = feed;
	}
	public People getPeople() {
		return people;
	}
	public void setPeople(People people) {
		this.people = people;
	}
	public int getHasRead() {
		return hasRead;
	}
	public void setHasRead(int hasRead) {
		this.hasRead = hasRead;
	}
}
