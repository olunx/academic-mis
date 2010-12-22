package cn.gdpu.vo;

import java.util.Set;

public class NoticeType {
	private int id;
	private String name;
	private Set<Notice> notices;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<Notice> getNotices() {
		return notices;
	}
	public void setNotices(Set<Notice> notices) {
		this.notices = notices;
	}
}
