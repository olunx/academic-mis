package cn.gdpu.vo;


public class ActivityResult {
	private int id;
	private int prize;
	private ActivityApply awarder;
	private String remark;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPrize() {
		return prize;
	}
	public void setPrize(int prize) {
		this.prize = prize;
	}
	public ActivityApply getAwarder() {
		return awarder;
	}
	public void setAwarder(ActivityApply awarder) {
		this.awarder = awarder;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
