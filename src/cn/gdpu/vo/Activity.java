package cn.gdpu.vo;

import java.util.Date;
import java.util.Set;


public class Activity {
	private int id;
	private String name;
	private int session;
	private ActivityType activityType;
	private Set<ActivityResult> activityResults;
	private Date airtime;
	private Date deadtime;
	private Date endtime;
	private Set<ActivityApply> activityApplys;
	private OutLay outlay;
	
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
	public ActivityType getActivityType() {
		return activityType;
	}
	public void setActivityType(ActivityType activityType) {
		this.activityType = activityType;
	}
	public Set<ActivityResult> getActivityResults() {
		return activityResults;
	}
	public void setActivityResults(Set<ActivityResult> activityResults) {
		this.activityResults = activityResults;
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
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public Set<ActivityApply> getActivityApplys() {
		return activityApplys;
	}
	public void setActivityApplys(Set<ActivityApply> activityApplys) {
		this.activityApplys = activityApplys;
	}
	public OutLay getOutlay() {
		return outlay;
	}
	public void setOutlay(OutLay outlay) {
		this.outlay = outlay;
	}
}
