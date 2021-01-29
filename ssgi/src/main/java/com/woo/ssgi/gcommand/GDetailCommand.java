package com.woo.ssgi.gcommand;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


import com.woo.ssgi.dao.GoodsDao;
import com.woo.ssgi.dto.GoodsDto;
import com.woo.ssgi.util.GConstant;

public class GDetailCommand implements GCommand {
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String goods_num = request.getParameter("goods_num");
		GoodsDao gDao = GConstant.gDao;
		List<GoodsDto> gDto = gDao.sGoodsDetail(goods_num);
		model.addAttribute("sGoodsDetail", gDto);	
		
	}
}
