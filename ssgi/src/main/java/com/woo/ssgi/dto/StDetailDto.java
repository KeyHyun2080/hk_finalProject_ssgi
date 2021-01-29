package com.woo.ssgi.dto;

public class StDetailDto {
	private String user_id;
	private int store_seq;
	private int store_img_seq;
	private String store_image;
	private String store_name;
	private String store_owner;
	private String store_addr;
	private String store_addr2;
	private String store_intro;
	
	public StDetailDto() {}
	
	public StDetailDto(String user_id, int store_seq, int store_img_seq, String store_image, String store_name,
			String store_owner, String store_addr, String store_addr2, String store_intro) {
		this.user_id = user_id;
		this.store_seq = store_seq;
		this.store_img_seq = store_img_seq;
		this.store_image = store_image;
		this.store_name = store_name;
		this.store_owner = store_owner;
		this.store_addr = store_addr;
		this.store_addr2 = store_addr2;
		this.store_intro = store_intro;
	}
	public String getuser_id() {
		return user_id;
	}
	public void setuser_id(String user_id) {
		this.user_id = user_id;
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
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_owner() {
		return store_owner;
	}
	public void setStore_owner(String store_owner) {
		this.store_owner = store_owner;
	}
	public String getStore_addr() {
		return store_addr;
	}
	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}
	public String getStore_addr2() {
		return store_addr2;
	}
	public void setStore_addr2(String store_addr2) {
		this.store_addr2 = store_addr2;
	}
	public String getStore_intro() {
		return store_intro;
	}
	public void setStore_intro(String store_intro) {
		this.store_intro = store_intro;
	}
	
	
	
	
}
