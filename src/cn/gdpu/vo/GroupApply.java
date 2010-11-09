package cn.gdpu.vo;

import java.util.Date;

public class GroupApply {
	private int id;
	private Group group;
	private Student student;
	private int status;
	private Date applyTime;
	private Date passTime;
	private Student operator;
	/**
	 * 1为申请，2为通过，3为拒绝
	 */
	private String record;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	public Date getPassTime() {
		return passTime;
	}
	public void setPassTime(Date passTime) {
		this.passTime = passTime;
	}
	public Student getOperator() {
		return operator;
	}
	public void setOperator(Student operator) {
		this.operator = operator;
	}
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
}
