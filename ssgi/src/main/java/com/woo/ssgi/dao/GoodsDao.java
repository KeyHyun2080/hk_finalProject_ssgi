package com.woo.ssgi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.woo.ssgi.dto.GoodsDto;
import com.woo.ssgi.dto.GoodsImageDto;

public class GoodsDao implements IGoodsDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<GoodsDto> sGoodsList() {
		List<GoodsDto> result = sqlSession.selectList("gdm.sGoodsList");
		System.out.println("리스트");
		return result;
	}
	
	public void addGoodsPro(String user_id, String goods_num, String goods_name, int goods_price, String goods_content, int qty, String g_category) {
		GoodsDto gDto = new GoodsDto(user_id, goods_num, goods_name, goods_price, goods_content, qty, g_category);
		sqlSession.insert("gdm.addGoodsPro", gDto);
	}
	
	public void addGoodsImage(String goods_num, int goods_img_seq, String goods_image) {
		GoodsImageDto gIDto = new GoodsImageDto(goods_num, goods_img_seq, goods_image);
		sqlSession.insert("gdm.addGoodsImage", gIDto);
	}
	
	public List<GoodsDto> sGoodsDetail(String goods_num) {
		
		System.out.println("goods_num"+goods_num);
		return sqlSession.selectList("gdm.sGoodsDetail", goods_num);
	}
}
