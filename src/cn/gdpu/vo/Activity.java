package cn.gdpu.vo;

import java.util.Date;
import java.util.Set;


public class Activity {
	private int id;
	private String name;
	private int session;
	private String intro;
	private ActivityType activityType;
	private int applyCount;
	/**
	 * 0=不用交作品，1=作品必要
	 */
	private int opusNeed;
	private Date airtime;
	private Date deadtime;
	private Manager publisher;
	private Date time;
	private Set<ActivityApply> activityApplys;
	private Outlay outlay;
	
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
	public int getSession() {
		return session;
	}
	public void setSession(int session) {
		this.session = session;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public ActivityType getActivityType() {
		return activityType;
	}
	public void setActivityType(ActivityType activityType) {
		this.activityType = activityType;
	}
	public int getApplyCount() {
		return applyCount;
	}
	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}
	public int getOpusNeed() {
		return opusNeed;
	}
	public void setOpusNeed(int opusNeed) {
		this.opusNeed = opusNeed;
	}
	public Date getAirtime() {
		return airtime;
	}
	public void setAirtime(Date airtime) {
		this.airtime = airtime;
	}
	public Date getDeadtime() {
		return deadtime;
	}
	public void setDeadtime(Date deadtime) {
		this.deadtime = deadtime;
	}
	public Manager getPublisher() {
		return publisher;
	}
	public void setPublisher(Manager publisher) {
		this.publisher = publisher;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Set<ActivityApply> getActivityApplys() {
		return activityApplys;
	}
	public void setActivityApplys(Set<ActivityApply> activityApplys) {
		this.activityApplys = activityApplys;
	}
	public Outlay getOutlay() {
		return outlay;
	}
	public void setOutlay(Outlay outlay) {
		this.outlay = outlay;
	}
	
}
