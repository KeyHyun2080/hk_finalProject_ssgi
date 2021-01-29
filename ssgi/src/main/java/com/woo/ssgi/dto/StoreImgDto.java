package com.woo.ssgi.dto;

public class StoreImgDto {
	private int store_seq;
	private int store_img_seq;
	private String store_image;
	
	public StoreImgDto() {}
	
	public StoreImgDto(int store_seq, int store_img_seq, String store_image) {
		this.store_seq = store_seq;
		this.store_img_seq = store_img_seq;
		this.store_image = store_image;
	}
	
	public int getStore_seq() {
		return store_seq;
	}
	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}
	public int getStore_img_seq() {
		return store_img_seq;
	}
	public void setStore_img_seq(int store_img_seq) {
		this.store_img_seq = store_img_seq;
	}
	public String getStore_image() {
		return store_image;
	}
	public void setStore_image(String store_image) {
		this.store_image = store_image;
	}
	
	
}
