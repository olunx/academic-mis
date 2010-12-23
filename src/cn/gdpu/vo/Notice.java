package cn.gdpu.vo;

import java.util.Date;
import java.util.List;

public class Notice {
	private int id;
	private String title;
	private String content;
	private NoticeType type;
	private Manager author;
	private Date time;
	private String remark;
	private int isCmsAllow;
	private List<Post> comments;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public NoticeType getType() {
		return type;
	}
	public void setType(NoticeType type) {
		this.type = type;
	}
	public Manager getAuthor() {
		return author;
	}
	public void setAuthor(Manager author) {
		this.author = author;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getIsCmsAllow() {
		return isCmsAllow;
	}
	public void setIsCmsAllow(int isCmsAllow) {
		this.isCmsAllow = isCmsAllow;
	}
	public List<Post> getComments() {
		return comments;
	}
	public void setComments(List<Post> comments) {
		this.comments = comments;
	}
}
