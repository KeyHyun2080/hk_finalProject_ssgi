package com.woo.ssgi.dto;

public class StoreLocationDto {
	private int store_seq;
	private int store_location_seq;
	private String store_latitude;
	private String store_longitude;
	
	public StoreLocationDto() {}
	
	public StoreLocationDto(int store_seq, int store_location_seq, String store_latitude, String store_longitude) {
		this.store_seq = store_seq;
		this.store_location_seq = store_location_seq;
		this.store_latitude = store_latitude;
		this.store_longitude = store_longitude;
	}
	
	public int getStore_seq() {
		return store_seq;
	}
	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}
	public int getStore_location_seq() {
		return store_location_seq;
	}
	public void setStore_location_seq(int store_location_seq) {
		this.store_location_seq = store_location_seq;
	}
	public String getStore_latitude() {
		return store_latitude;
	}
	public void setStore_latitude(String store_latitude) {
		this.store_latitude = store_latitude;
	}
	public String getStore_longitude() {
		return store_longitude;
	}
	public void setStore_longitude(String store_longitude) {
		this.store_longitude = store_longitude;
	}
	
}
