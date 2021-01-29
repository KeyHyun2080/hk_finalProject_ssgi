package com.woo.ssgi.scommand;

import java.util.List;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.StDao;
import com.woo.ssgi.dto.StoreDto;
import com.woo.ssgi.util.SSConstant;

public class StListCommand implements SCommand {
	@Override
	public void execute(Model model) {
		StDao stDao = SSConstant.stDao;
		List<StoreDto> stDto = stDao.storeList();
		System.out.println("사이즈:"+stDto.size());
		model.addAttribute("storeList", stDto);
	}

}
