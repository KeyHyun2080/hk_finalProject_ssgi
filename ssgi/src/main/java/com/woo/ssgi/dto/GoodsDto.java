package com.woo.ssgi.dto;

public class GoodsDto {
	private String user_id;
	private String goods_num;
	private String goods_name;
	private int goods_price;
	private String goods_content;
	private int qty;
	private String g_category;
	
	public GoodsDto() {}

	public GoodsDto(String user_id, String goods_num, String goods_name, int goods_price, String goods_content,
			int qty, String g_category) {
		this.user_id = user_id;
		this.goods_num = goods_num;
		this.goods_name = goods_name;
		this.goods_price = goods_price;
		this.goods_content = goods_content;
		this.qty = qty;
		this.g_category = g_category;
	}
	
	public String getuser_id() {
		return user_id;
	}

	public void setuser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGoods_num() {
		return goods_num;
	}

	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public String getGoods_content() {
		return goods_content;
	}

	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}

	public int getQty() {
		return qty;
	}
	
	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getG_category() {
		return g_category;
	}

	public void setG_category(String g_category) {
		this.g_category = g_category;
	}
	
	
}
