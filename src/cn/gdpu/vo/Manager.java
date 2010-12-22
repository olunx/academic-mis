package cn.gdpu.vo;

import java.util.Set;

public abstract class Manager extends People{
	private Set<Activity> activitys;
	private Set<Notice> notices;
	public Set<Notice> getNotices() {
		return notices;
	}
	public void setNotices(Set<Notice> notices) {
		this.notices = notices;
	}
	public Set<Activity> getActivitys() {
		return activitys;
	}
	public void setActivitys(Set<Activity> activitys) {
		this.activitys = activitys;
	}
	
}
