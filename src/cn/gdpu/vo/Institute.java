package cn.gdpu.vo;

import java.util.Set;

public class Institute {
	private String name;
	private School school;
	private Set<Classes> classes;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public Set<Classes> getClasses() {
		return classes;
	}

	public void setClasses(Set<Classes> classes) {
		this.classes = classes;
	}
}
