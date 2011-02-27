package cn.gdpu.dto;

import java.util.Date;

public class FeedDto {
	private int id;
	/**
	 * 1:系统消息 2:管理者消息 (0-9系统自定义消息)
	 * 11:Activity 12:ActivityApply 13:ActivityResult(10-19学术自定义消息)
	 * 21:group 22:groupApply(20-29学习小组自定义消息)
	 * 31:subject 32:subjectApply(30-39科研课题消息)
	 * 
	 * 
	 */
	private int type;
	private String news;
	private String recipients;
	private Date time;
	private int hasRead;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getNews() {
		return news;
	}
	public void setNews(String news) {
		this.news = news;
	}
	public String getRecipients() {
		return recipients;
	}
	public void setRecipients(String recipients) {
		this.recipients = recipients;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getHasRead() {
		return hasRead;
	}
	public void setHasRead(int hasRead) {
		this.hasRead = hasRead;
	}
}
