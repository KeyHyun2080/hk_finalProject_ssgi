package com.woo.ssgi.dto;

public class StoreDto {
	private String user_id;
	private int store_seq;
	private String store_name;
	private String store_owner;
	private String store_intro;
	private String store_ph;
	private String store_addr;
	private String store_addr2;
	private String store_open;
	private String store_close;
	private String store_state;
	private String t24h;
	private String store_category;
	private String store_bank;
	private String store_account;
	private String s_license_b_img;
	private String s_license_s_img;
	private String s_license_num;
	private String s_admin_state;
	private String s_agreement;
	
	public StoreDto() {}
	
	public StoreDto(String user_id, int store_seq, String store_name, String store_owner, String store_intro,
			String store_ph, String store_addr, String store_addr2, String store_open, String store_close,
			String store_state, String t24h, String store_category, String store_bank, String store_account,
			String s_license_b_img, String s_license_s_img, String s_license_num, String s_admin_state,
			String s_agreement) {
		this.user_id = user_id;
		this.store_seq = store_seq;
		this.store_name = store_name;
		this.store_owner = store_owner;
		this.store_intro = store_intro;
		this.store_ph = store_ph;
		this.store_addr = store_addr;
		this.store_addr2 = store_addr2;
		this.store_open = store_open;
		this.store_close = store_close;
		this.store_state = store_state;
		this.t24h = t24h;
		this.store_category = store_category;
		this.store_bank = store_bank;
		this.store_account = store_account;
		this.s_license_b_img = s_license_b_img;
		this.s_license_s_img = s_license_s_img;
		this.s_license_num = s_license_num;
		this.s_admin_state = s_admin_state;
		this.s_agreement = s_agreement;
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
	public String getStore_intro() {
		return store_intro;
	}
	public void setStore_intro(String store_intro) {
		this.store_intro = store_intro;
	}
	public String getStore_ph() {
		return store_ph;
	}
	public void setStore_ph(String store_ph) {
		this.store_ph = store_ph;
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
	public String getStore_open() {
		return store_open;
	}
	public void setStore_open(String store_open) {
		this.store_open = store_open;
	}
	public String getStore_close() {
		return store_close;
	}
	public void setStore_close(String store_close) {
		this.store_close = store_close;
	}
	public String getStore_state() {
		return store_state;
	}
	public void setStore_state(String store_state) {
		this.store_state = store_state;
	}
	public String getT24h() {
		return t24h;
	}
	public void setT24h(String t24h) {
		this.t24h = t24h;
	}
	public String getStore_category() {
		return store_category;
	}
	public void setStore_category(String store_category) {
		this.store_category = store_category;
	}
	public String getStore_bank() {
		return store_bank;
	}
	public void setStore_bank(String store_bank) {
		this.store_bank = store_bank;
	}
	public String getStore_account() {
		return store_account;
	}
	public void setStore_account(String store_account) {
		this.store_account = store_account;
	}
	public String getS_license_b_img() {
		return s_license_b_img;
	}
	public void setS_license_b_img(String s_license_b_img) {
		this.s_license_b_img = s_license_b_img;
	}
	public String getS_license_s_img() {
		return s_license_s_img;
	}
	public void setS_license_s_img(String s_license_s_img) {
		this.s_license_s_img = s_license_s_img;
	}
	public String getS_license_num() {
		return s_license_num;
	}
	public void setS_license_num(String s_license_num) {
		this.s_license_num = s_license_num;
	}
	public String getS_admin_state() {
		return s_admin_state;
	}
	public void setS_admin_state(String s_admin_state) {
		this.s_admin_state = s_admin_state;
	}
	public String getS_agreement() {
		return s_agreement;
	}
	public void setS_agreement(String s_agreement) {
		this.s_agreement = s_agreement;
	}
	
	
}
