package cn.gdpu.vo;

import java.util.Date;

public class ActivityApply {
	private int id;
	private Activity activity;
	private Date applytime;
	private Date endtime;
	private Manager operator;
	private String record;
	/**
	 * 1为申请，2为通过，3为拒绝
	 */
	private int status;
	private Opus opus;
	private ActivityResult activityResult;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	public Date getApplytime() {
		return applytime;
	}
	public void setApplytime(Date applytime) {
		this.applytime = applytime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public Manager getOperator() {
		return operator;
	}
	public void setOperator(Manager operator) {
		this.operator = operator;
	}
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Opus getOpus() {
		return opus;
	}
	public void setOpus(Opus opus) {
		this.opus = opus;
	}
	public ActivityResult getActivityResult() {
		return activityResult;
	}
	public void setActivityResult(ActivityResult activityResult) {
		this.activityResult = activityResult;
	}
}
