package edu.neu.regist.domain;

import java.io.Serializable;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

public class Verify implements Serializable{

	@NotEmpty
	private String username;
	@NotEmpty
	private String password;
	@NotEmpty
	private String verNum;
	
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
	public String getVerNum() {
		return verNum;
	}
	public void setVerNum(String verNum) {
		this.verNum = verNum;
	}

	
}
