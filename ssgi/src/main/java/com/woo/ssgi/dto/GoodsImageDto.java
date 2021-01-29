package com.woo.ssgi.dto;

public class GoodsImageDto  {
	private String goods_num;
	private int goods_img_seq;
	private String goods_image;
	
	
	

	public GoodsImageDto() {}

	public GoodsImageDto(String goods_num, int goods_img_seq, String goods_image) {
		this.goods_num = goods_num;
		this.goods_img_seq = goods_img_seq;
		this.goods_image = goods_image;
	}

	public String getGoods_num() {
		return goods_num;
	}

	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}

	public int getGoods_img_seq() {
		return goods_img_seq;
	}

	public void setGoods_img_seq(int goods_img_seq) {
		this.goods_img_seq = goods_img_seq;
	}

	public String getGoods_image() {
		return goods_image;
	}

	public void setGoods_image(String goods_image) {
		this.goods_image = goods_image;
	}
	
	
}
