package com.woo.ssgi.dao;

import java.util.List;

import com.woo.ssgi.dto.GoodsDto;

public interface IShDao {
	public List<GoodsDto> goodsList();
	
	public List<GoodsDto> goodsDetail(String goods_num);
}
