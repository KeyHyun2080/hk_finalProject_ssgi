package com.woo.ssgi.scommand;

import java.util.List;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.ShDao;
import com.woo.ssgi.dto.GoodsDto;
import com.woo.ssgi.util.SSConstant;

public class ShMainCommand implements SCommand {
	@Override
	public void execute(Model model) {
		ShDao shDao = SSConstant.shDao;
		List<GoodsDto> gDtos = shDao.goodsList();
		System.out.println("사이즈"+gDtos.size());
		model.addAttribute("goodsList", gDtos);
	}
}