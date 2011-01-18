package cn.gdpu.dto;

public class NoticeDto {
	private int id;
	private String title;
	private String content;
	private int type;
	private int isCmsAllow;
	private String image;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getIsCmsAllow() {
		return isCmsAllow;
	}
	public void setIsCmsAllow(int isCmsAllow) {
		this.isCmsAllow = isCmsAllow;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
