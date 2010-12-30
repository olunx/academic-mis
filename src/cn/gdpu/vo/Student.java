package cn.gdpu.vo;

import java.util.Set;

public class Student extends People{
	private String stuNo;
	private Classes classes;
	private int schoolYear;
	private Set<Group> myGroups;
	private Set<Group> groups;
	private Set<GroupApply> groupApplys;
	private Set<SingleApply> singleApplys;
	private Set<TeamApply> TeamApplys;
	
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	public int getSchoolYear() {
		return schoolYear;
	}
	public void setSchoolYear(int schoolYear) {
		this.schoolYear = schoolYear;
	}
	public Set<Group> getMyGroups() {
		return myGroups;
	}
	public void setMyGroups(Set<Group> myGroups) {
		this.myGroups = myGroups;
	}
	public Set<Group> getGroups() {
		return groups;
	}
	public void setGroups(Set<Group> groups) {
		this.groups = groups;
	}
	public Set<GroupApply> getGroupApplys() {
		return groupApplys;
	}
	public void setGroupApplys(Set<GroupApply> groupApplys) {
		this.groupApplys = groupApplys;
	}
	public Set<SingleApply> getSingleApplys() {
		return singleApplys;
	}
	public void setSingleApplys(Set<SingleApply> singleApplys) {
		this.singleApplys = singleApplys;
	}
	public Set<TeamApply> getTeamApplys() {
		return TeamApplys;
	}
	public void setTeamApplys(Set<TeamApply> teamApplys) {
		TeamApplys = teamApplys;
	}
	
	
}
