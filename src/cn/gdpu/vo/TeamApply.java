package cn.gdpu.vo;

import java.util.Set;

public class TeamApply extends ActivityApply{
	private Group group;
	private Set<Student> applicants;
	
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	public Set<Student> getApplicants() {
		return applicants;
	}
	public void setApplicants(Set<Student> applicants) {
		this.applicants = applicants;
	}
}
