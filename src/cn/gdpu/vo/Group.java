package cn.gdpu.vo;

import java.util.Set;

public class Group {
	private int id;
	private String name;
	private String intro;
	private Student captain;
	private Set<Student> members;
	private Set<Student> applicants;
	
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
	public Student getCaptain() {
		return captain;
	}
	public void setCaptain(Student captain) {
		this.captain = captain;
	}
	public Set<Student> getMembers() {
		return members;
	}
	public void setMembers(Set<Student> members) {
		this.members = members;
	}
	public Set<Student> getApplicants() {
		return applicants;
	}
	public void setApplicants(Set<Student> applicants) {
		this.applicants = applicants;
	}
}
