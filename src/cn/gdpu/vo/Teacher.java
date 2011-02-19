package cn.gdpu.vo;

import java.util.Set;

public class Teacher extends People{
	private String tnum;
	private Institute institute;
	private Set<Opus> opuses;
	private Set<Comment> comments;
	private Set<Subject> subjects;
	/**
	 * title职称： 1教授,2副教授,3讲师,4助教
	 */
	private int title;
	/**
	 * 人物排行，名师风采栏用来对教师介绍的排序
	 */
	private int indext;
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
	public Set<Subject> getSubjects() {
		return subjects;
	}
	public void setSubjects(Set<Subject> subjects) {
		this.subjects = subjects;
	}
	public int getTitle() {
		return title;
	}
	public void setTitle(int title) {
		this.title = title;
	}
	public int getIndext() {
		return indext;
	}
	public void setIndext(int indext) {
		this.indext = indext;
	}
	
}
