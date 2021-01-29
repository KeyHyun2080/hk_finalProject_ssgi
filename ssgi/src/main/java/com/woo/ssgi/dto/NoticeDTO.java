package com.woo.ssgi.dto;

import java.sql.Timestamp;

public class NoticeDTO {
	private int NOTICE_NUM;
	private String NOTICE_TITLE;
	private String NOTICE_NAME;
	private String NOTICE_CONTENT;
	private Timestamp NOTICE_DATE;
	
	
	
	
	public NoticeDTO() {}
	
	public NoticeDTO(int nOTICE_NUM, String nOTICE_TITLE, String nOTICE_NAME, String nOTICE_CONTENT,Timestamp nOTICE_DATE) {
		super();
		this.NOTICE_NUM = nOTICE_NUM;
		this.NOTICE_TITLE = nOTICE_TITLE;
		this.NOTICE_NAME = nOTICE_NAME;
		this.NOTICE_CONTENT = nOTICE_CONTENT;
		this.NOTICE_DATE = nOTICE_DATE;
	}



	public int getNOTICE_NUM() {
		return NOTICE_NUM;
	}
	
	public void setNOTICE_NUM(int nOTICE_NUM) {
		this.NOTICE_NUM = nOTICE_NUM;
	}
	public String getNOTICE_TITLE() {
		return NOTICE_TITLE;
	}
	public void setNOTICE_TITLE(String nOTICE_TITLE) {
		this.NOTICE_TITLE = nOTICE_TITLE;
	}
	public String getNOTICE_NAME() {
		return NOTICE_NAME;
	}
	public void setNOTICE_NAME(String nOTICE_NAME) {
		this.NOTICE_NAME = nOTICE_NAME;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		this.NOTICE_CONTENT = nOTICE_CONTENT;
	}
	public Timestamp getNOTICE_DATE() {
		return NOTICE_DATE;
	}
	public void setNOTICE_DATE(Timestamp nOTICE_DATE) {
		this.NOTICE_DATE = nOTICE_DATE;
	}


	@Override
	public String toString() {
		return "NoticeDTO [NOTICE_NUM=" + NOTICE_NUM + ", NOTICE_TITLE=" + NOTICE_TITLE + ", NOTICE_NAME=" + NOTICE_NAME
				+ ", NOTICE_CONTENT=" + NOTICE_CONTENT + "]";
	}
	
	
	
	
	
	
	
	
	
}
