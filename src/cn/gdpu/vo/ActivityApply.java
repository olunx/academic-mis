package cn.gdpu.vo;

import java.util.Date;
import java.util.Set;

public class ActivityApply {
	private int id;
	private Activity activity;
	private Group group;
	private Date applyTime;
	private Date endTime;
	private Assistant operator;
	private String record;
	private Set<Student> applicants;
	private int status;
	private Opus opus;
	
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
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Assistant getOperator() {
		return operator;
	}
	public void setOperator(Assistant operator) {
		this.operator = operator;
	}
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	public Set<Student> getApplicants() {
		return applicants;
	}
	public void setApplicants(Set<Student> applicants) {
		this.applicants = applicants;
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
}
