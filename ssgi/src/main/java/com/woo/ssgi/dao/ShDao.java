package com.woo.ssgi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.woo.ssgi.dto.GoodsDto;

public class ShDao implements IShDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<GoodsDto> goodsList() {
		List<GoodsDto> result = sqlSession.selectList("ssdm.goodsList");
		System.out.println("굿즈리스트");
		return result;
	}
	
	public List<GoodsDto> goodsDetail(String goods_num) {
		List<GoodsDto> result = sqlSession.selectList("ssdm.goodsDetail", goods_num);
		return result;
	}
	
}
