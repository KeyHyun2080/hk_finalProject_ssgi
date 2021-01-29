package com.woo.ssgi.scommand;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.StDao;
import com.woo.ssgi.dto.StoreDto;
import com.woo.ssgi.util.SSConstant;

public class StDetailCommand implements SCommand {
	public void execute(Model model) {
		
		  Map<String, Object> map = model.asMap(); 
		  HttpServletRequest request = (HttpServletRequest) map.get("request");
		  String store_seq = request.getParameter("store_seq");	  
		  StDao stDao = SSConstant.stDao; 
		  
		  List<StoreDto> stDto = stDao.storeDetail(store_seq); 
		  model.addAttribute("storeDetail", stDto);
		 
		
		/*
		 Map<String, Object> map = model.asMap();
		 HttpServletRequest request = (HttpServletRequest) map.get("request");
		 String store_seq = request.getParameter("store_seq");
		 StDao stDao = SSConstant.stDao;
		 StoreDto stDto = stDao.storeDetail(store_seq); 
		 model.addAttribute("storeDetail", stDto);
		 */
		
		
	}
}
