package com.woo.ssgi.dto;

import java.sql.Timestamp;

public class SQNADTO {
	private int AS_QNA_NUM;
	private String AS_QNA_TITLE;
	private String AS_QNA_CONTENT;
	private String USER_ID;
	private String AS_QNA_ANSWER;
	private String AS_QNA_HIDE;
	private String AS_QNA_READ;
	private Timestamp AS_QNA_DATE;

	private UserDto UserDto;



	public SQNADTO(int aS_QNA_NUM, String aS_QNA_TITLE, String aS_QNA_CONTENT, String uSER_ID, String aS_QNA_ANSWER,
			String aS_QNA_HIDE, String aS_QNA_READ,Timestamp aS_QNA_DATE) {
		super();
		this.AS_QNA_NUM = aS_QNA_NUM;
		this.AS_QNA_TITLE = aS_QNA_TITLE;
		this.AS_QNA_CONTENT = aS_QNA_CONTENT;
		this.USER_ID = uSER_ID;
		this.AS_QNA_ANSWER = aS_QNA_ANSWER;
		this.AS_QNA_HIDE = aS_QNA_HIDE;
		this.AS_QNA_READ = aS_QNA_READ;
		this.AS_QNA_DATE = aS_QNA_DATE;
	}



public SQNADTO() {}




public int getAS_QNA_NUM() {
	return AS_QNA_NUM;
}
public void setAS_QNA_NUM(int aS_QNA_NUM) {
	this.AS_QNA_NUM = aS_QNA_NUM;
}
public String getAS_QNA_TITLE() {
	return AS_QNA_TITLE;
}
public void setAS_QNA_TITLE(String aS_QNA_TITLE) {
	this.AS_QNA_TITLE = aS_QNA_TITLE;
}
public String getAS_QNA_CONTENT() {
	return AS_QNA_CONTENT;
}
public void setAS_QNA_CONTENT(String aS_QNA_CONTENT) {
	this.AS_QNA_CONTENT = aS_QNA_CONTENT;
}
public String getUSER_ID() {
	return USER_ID;
}
public void setUSER_ID(String uSER_ID) {
	this.USER_ID = uSER_ID;
}
public String getAS_QNA_ANSWER() {
	return AS_QNA_ANSWER;
}
public void setAS_QNA_ANSWER(String aS_QNA_ANSWER) {
	this.AS_QNA_ANSWER = aS_QNA_ANSWER;
}
public String getAS_QNA_HIDE() {
	return AS_QNA_HIDE;
}
public void setAS_QNA_HIDE(String aS_QNA_HIDE) {
	this.AS_QNA_HIDE = aS_QNA_HIDE;
}
public String getAS_QNA_READ() {
	return AS_QNA_READ;
}
public void setAS_QNA_READ(String aS_QNA_READ) {
	this.AS_QNA_READ = aS_QNA_READ;
}
public Timestamp getAS_QNA_DATE() {
	return AS_QNA_DATE;
}
public void setAS_QNA_DATE(Timestamp aS_QNA_DATE) {
	this.AS_QNA_DATE = aS_QNA_DATE;
}




@Override
public String toString() {
	return "SQNADTO [AS_QNA_NUM=" + AS_QNA_NUM + ", AS_QNA_TITLE=" + AS_QNA_TITLE + ", AS_QNA_CONTENT=" + AS_QNA_CONTENT
			+ ", USER_ID=" + USER_ID + ", AS_QNA_ANSWER=" + AS_QNA_ANSWER + ", AS_QNA_HIDE=" + AS_QNA_HIDE
			+ ", AS_QNA_READ=" + AS_QNA_READ + ", AS_QNA_DATE=" + AS_QNA_DATE + "]";
}





}

