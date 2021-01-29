package com.woo.ssgi.dto;

public class PageDTO {
	int startPage;
	int endPage;
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public PageDTO() {}
	public PageDTO(int startPage, int endPage) {
		super();
		this.startPage = startPage;
		this.endPage = endPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	
	

}
