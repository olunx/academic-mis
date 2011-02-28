package cn.gdpu.vo;

import java.util.Date;
import java.util.Set;

public abstract class People {
	private int id;
	private String username;
	private String password;
	private String realName;
	private Image avatar;
	private int sex;
	private int age;
	private String remark;
	private Set<Post> posts;
	private Set<FeedBox> feedBoxs;
	private Set<Feed> feeds;
	private Date regtime;
	private Date lastLogin;
	private Date logintime;
	
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
	public Image getAvatar() {
		return avatar;
	}
	public void setAvatar(Image avatar) {
		this.avatar = avatar;
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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Set<Post> getPosts() {
		return posts;
	}
	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}
	public Set<FeedBox> getFeedBoxs() {
		return feedBoxs;
	}
	public void setFeedBoxs(Set<FeedBox> feedBoxs) {
		this.feedBoxs = feedBoxs;
	}
	public Set<Feed> getFeeds() {
		return feeds;
	}
	public void setFeeds(Set<Feed> feeds) {
		this.feeds = feeds;
	}
	public Date getRegtime() {
		return regtime;
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	public Date getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	public Date getLogintime() {
		return logintime;
	}
	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}
}
