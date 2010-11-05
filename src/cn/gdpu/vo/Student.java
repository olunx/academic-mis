package cn.gdpu.vo;

import java.util.Set;

public class Student {
	private int id;
	private String username;
	private String password;
	private String realName;
	private int sex;
	private int age;
	private Classes classes;
	private int schoolYear;
	private String avatar;
	private String remark;
	private Set<Group> groups;
	private Set<Group> groupApplys;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
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
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Set<Group> getGroups() {
		return groups;
	}
	public void setGroups(Set<Group> groups) {
		this.groups = groups;
	}
	public Set<Group> getGroupApplys() {
		return groupApplys;
	}
	public void setGroupApplys(Set<Group> groupApplys) {
		this.groupApplys = groupApplys;
	}
	
}
