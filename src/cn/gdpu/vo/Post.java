package cn.gdpu.vo;

import java.util.Date;

public class Post {
	private int id;
	private Notice parent;
	private Date time;
	private People author;
	private String content;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Notice getParent() {
		return parent;
	}
	public void setParent(Notice parent) {
		this.parent = parent;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public People getAuthor() {
		return author;
	}
	public void setAuthor(People author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
