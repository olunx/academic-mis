package cn.gdpu.dto;

import java.util.List;



public class ApplyDto {
	private int activity;
	private int group;
	private List<Integer> applicants;
	
	public int getActivity() {
		return activity;
	}
	public void setActivity(int activity) {
		this.activity = activity;
	}
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	public List<Integer> getApplicants() {
		return applicants;
	}
	public void setApplicants(List<Integer> applicants) {
		this.applicants = applicants;
	}
}
