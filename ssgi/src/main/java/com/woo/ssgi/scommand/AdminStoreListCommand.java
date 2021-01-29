package com.woo.ssgi.scommand;

import java.util.ArrayList;


import org.springframework.ui.Model;

import com.woo.ssgi.dao.StDao;
import com.woo.ssgi.dto.StoreDto;
import com.woo.ssgi.util.SSConstant;

public class AdminStoreListCommand implements SCommand {
	@Override
	public void execute(Model model) {
		StDao stDao = SSConstant.stDao;
		ArrayList<StoreDto> stDto = (ArrayList<StoreDto>) stDao.AdminStoreList();

		model.addAttribute("storeList", stDto);
	}

}
