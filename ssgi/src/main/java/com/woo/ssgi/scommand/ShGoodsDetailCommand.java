package com.woo.ssgi.scommand;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.ShDao;
import com.woo.ssgi.dto.GoodsDto;
import com.woo.ssgi.util.SSConstant;

public class ShGoodsDetailCommand implements SCommand {
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String goods_num = request.getParameter("goods_num");
		
		System.out.println("goods_num:"+goods_num);
		
		ShDao shDao = SSConstant.shDao;
		List<GoodsDto> gDto = shDao.goodsDetail(goods_num);
		model.addAttribute("goodsDetail", gDto);
	}
}
