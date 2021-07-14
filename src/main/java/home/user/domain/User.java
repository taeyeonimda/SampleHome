package home.user.domain;

import java.sql.Date;

public class User {
	private String userId;
	private String userPwd;
	private Date userReg;
	
	public String getUserId() {
		return userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public Date getUserReg() {
		return userReg;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public void setUserReg(Date userReg) {
		this.userReg = userReg;
	}
	
	
}
