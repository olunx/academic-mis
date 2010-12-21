package cn.gdpu.vo;

import java.util.Set;

public abstract class Manager extends People{
	private Set<Activity> activitys;
	
	public Set<Activity> getActivitys() {
		return activitys;
	}
	public void setActivitys(Set<Activity> activitys) {
		this.activitys = activitys;
	}
	
}
