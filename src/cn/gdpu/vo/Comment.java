package cn.gdpu.vo;

import java.util.Date;


public class Comment {
	private int id;
	private int score;
	private String remark;
	private Opus opus;
	private Teacher teacher;
	private Date time;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Opus getOpus() {
		return opus;
	}
	public void setOpus(Opus opus) {
		this.opus = opus;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
}
