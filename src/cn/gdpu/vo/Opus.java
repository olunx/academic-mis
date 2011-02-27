package cn.gdpu.vo;

import java.util.Set;


public class Opus {
	private int id;
	private String name;
	private ActivityApply activityApply;
	private String intro;
	private Teacher instructor;
	private Image image;
	public Image getImage() {
		return image;
	}
	public void setImage(Image image) {
		this.image = image;
	}
	private Set<Comment> comments;
	
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
	public ActivityApply getActivityApply() {
		return activityApply;
	}
	public void setActivityApply(ActivityApply activityApply) {
		this.activityApply = activityApply;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public Teacher getInstructor() {
		return instructor;
	}
	public void setInstructor(Teacher instructor) {
		this.instructor = instructor;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
}
