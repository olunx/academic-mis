package cn.gdpu.vo;

import java.util.Date;
import java.util.Set;

public class Subject {
	private int id;
	private String name;
	private String intro;
	private Date airtime;
	private Date deadtime;
	private Date time;
	private Teacher publisher;
	private Set<SubjectApply> subjectApplys;
	
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Teacher getPublisher() {
		return publisher;
	}
	public void setPublisher(Teacher publisher) {
		this.publisher = publisher;
	}
	public Set<SubjectApply> getSubjectApplys() {
		return subjectApplys;
	}
	public void setSubjectApplys(Set<SubjectApply> subjectApplys) {
		this.subjectApplys = subjectApplys;
	}
}
