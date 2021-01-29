package com.woo.ssgi.gcommand;

import java.util.List;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.GoodsDao;
import com.woo.ssgi.dto.GoodsDto;
import com.woo.ssgi.util.GConstant;

public class GListCommand implements GCommand {
	@Override
	public void execute(Model model) {
		GoodsDao gDao = GConstant.gDao;
		List<GoodsDto> gDtos = gDao.sGoodsList();
		System.out.println("사이즈"+gDtos.size());
		model.addAttribute("sGoodsList", gDtos);
	}
}
