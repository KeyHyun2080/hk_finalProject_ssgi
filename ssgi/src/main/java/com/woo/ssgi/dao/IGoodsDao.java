package com.woo.ssgi.dao;

import java.util.List;

import com.woo.ssgi.dto.GoodsDto;

public interface IGoodsDao {
	public List<GoodsDto> sGoodsList();
	
	public void addGoodsPro(String user_id, String goods_num, String goods_name, int goods_price, String goods_content, int qty, String g_category);
	
	public void addGoodsImage(String goods_num, int goods_img_seq, String goods_image);
	
	public List<GoodsDto> sGoodsDetail(String goods_num);
}
