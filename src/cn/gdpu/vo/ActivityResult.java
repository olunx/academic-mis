package cn.gdpu.vo;


public class ActivityResult {
	private int id;
	/**
	 * 获奖等级，一名或一等奖1，二名或二等奖2，三名或三等奖3，其它4
	 */
	private int prize;
	private String name;
	private double credit;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getCredit() {
		return credit;
	}
	public void setCredit(double credit) {
		this.credit = credit;
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
