package cn.gdpu.vo;

import java.util.Set;


public class ActivityType {
	private int id;
	private String name;
	private String intro;
	/**
	 * 1院级，2校级，3省级，4全国，5国际
	 */
	private int level;
	private Set<Activity> activitys;
	
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
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public Set<Activity> getActivitys() {
		return activitys;
	}
	public void setActivitys(Set<Activity> activitys) {
		this.activitys = activitys;
	}
}
