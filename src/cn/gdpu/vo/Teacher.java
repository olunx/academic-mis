package cn.gdpu.vo;

import java.util.Set;

public class Teacher extends People{
	private String tnum;
	private Institute institute;
	private Set<Opus> opuses;
	private Set<Comment> comments;
	
	public String getTnum() {
		return tnum;
	}
	public void setTnum(String tnum) {
		this.tnum = tnum;
	}
	public Institute getInstitute() {
		return institute;
	}
	public void setInstitute(Institute institute) {
		this.institute = institute;
	}
	public Set<Opus> getOpuses() {
		return opuses;
	}
	public void setOpuses(Set<Opus> opuses) {
		this.opuses = opuses;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	
}
