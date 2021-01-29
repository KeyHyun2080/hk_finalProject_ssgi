package com.woo.ssgi.dto;

import java.sql.Timestamp;

public class UQNADTO {
	private int AU_QNA_NUM;
	private String AU_QNA_TITLE;
	private String AU_QNA_CONTENT;
	private String USER_ID;
	private String AU_QNA_ANSWER;
	private String AU_QNA_HIDE;
	private String AU_QNA_READ;
	private Timestamp AU_QNA_DATE;
	
	private UserDto UserDto;
	
	public UserDto getUserDto() {
		return UserDto;
	}


	public void setUserDto(UserDto userDto) {
		UserDto = userDto;
	}


	public UQNADTO() {
		
	}
	
	
	public UQNADTO(int aU_QNA_NUM, String aU_QNA_TITLE, String aU_QNA_CONTENT, String uSER_ID, String aU_QNA_ANSWER,
			String aU_QNA_HIDE, String aU_QNA_READ,Timestamp AU_QNA_DATE) {
		super();
		this.AU_QNA_NUM = aU_QNA_NUM;
		this.AU_QNA_TITLE = aU_QNA_TITLE;
		this.AU_QNA_CONTENT = aU_QNA_CONTENT;
		this.USER_ID = uSER_ID;
		this.AU_QNA_ANSWER = aU_QNA_ANSWER;
		this.AU_QNA_HIDE = aU_QNA_HIDE;
		this.AU_QNA_READ = aU_QNA_READ;
		this.AU_QNA_DATE = AU_QNA_DATE;
	}





	public int getAU_QNA_NUM() {
		return AU_QNA_NUM;
	}
	public void setAU_QNA_NUM(int aU_QNA_NUM) {
		this.AU_QNA_NUM = aU_QNA_NUM;
	}
	public String getAU_QNA_TITLE() {
		return AU_QNA_TITLE;
	}
	public void setAU_QNA_TITLE(String aU_QNA_TITLE) {
		this.AU_QNA_TITLE = aU_QNA_TITLE;
	}
	public String getAU_QNA_CONTENT() {
		return AU_QNA_CONTENT;
	}
	public void setAU_QNA_CONTENT(String aU_QNA_CONTENT) {
		this.AU_QNA_CONTENT = aU_QNA_CONTENT;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		this.USER_ID = uSER_ID;
	}
	public String getAU_QNA_ANSWER() {
		return AU_QNA_ANSWER;
	}
	public void setAU_QNA_ANSWER(String aU_QNA_ANSWER) {
		this.AU_QNA_ANSWER = aU_QNA_ANSWER;
	}
	public String getAU_QNA_HIDE() {
		return AU_QNA_HIDE;
	}
	public void setAU_QNA_HIDE(String aU_QNA_HIDE) {
		this.AU_QNA_HIDE = aU_QNA_HIDE;
	}
	public String getAU_QNA_READ() {
		return AU_QNA_READ;
	}
	public void setAU_QNA_READ(String aU_QNA_READ) {
		this.AU_QNA_READ = aU_QNA_READ;
	}
	
	public Timestamp getAU_QNA_DATE() {
		return AU_QNA_DATE;
	}
	public void setAU_QNA_DATE(Timestamp aU_QNA_DATE) {
		this.AU_QNA_DATE = aU_QNA_DATE;
	}


	@Override
	public String toString() {
		return "UQNADTO [AU_QNA_NUM=" + AU_QNA_NUM + ", AU_QNA_TITLE=" + AU_QNA_TITLE + ", AU_QNA_CONTENT="
				+ AU_QNA_CONTENT + ", USER_ID=" + USER_ID + ", AU_QNA_ANSWER=" + AU_QNA_ANSWER + ", AU_QNA_HIDE="
				+ AU_QNA_HIDE + ", AU_QNA_READ=" + AU_QNA_READ + ", AU_QNA_DATE=" + AU_QNA_DATE + "]";
	}



	
	
	
	
} 
