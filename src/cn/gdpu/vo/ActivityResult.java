package cn.gdpu.vo;


public class ActivityResult {
	private int id;
	private int prize;
	private String remark;
	private ActivityApply awarder;
	private String record;
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
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
}
