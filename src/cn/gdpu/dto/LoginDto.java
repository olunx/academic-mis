package cn.gdpu.dto;

public class LoginDto {
	private String username;
	private String password;
	/**
	 * 登陆类型 0为学生登陆，1为管理员助理登陆，2为教师登陆
	 */
	private int loginType;
	
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
	public int getLoginType() {
		return loginType;
	}
	public void setLoginType(int loginType) {
		this.loginType = loginType;
	}
}
