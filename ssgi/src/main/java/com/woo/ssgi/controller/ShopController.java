package com.woo.ssgi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woo.ssgi.dao.ShDao;
import com.woo.ssgi.scommand.SCommand;
import com.woo.ssgi.scommand.ShGoodsDetailCommand;
import com.woo.ssgi.scommand.ShMainCommand;
import com.woo.ssgi.util.SSConstant;

@Controller
public class ShopController {
	SCommand command;
	
	@Autowired
	public void setSsDao(ShDao shDao) {
		SSConstant.shDao = shDao;
	}
	
	/*
	@RequestMapping("/")
	public String shopMain(Model model) {
		command = new ShMainCommand();
		command.execute(model);
		return "shop/shopMain";
	}
	*/
	
	
	@RequestMapping("goodsDetail")
	public String goodsDetail(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new ShGoodsDetailCommand();
		command.execute(model);
		return "shop/goodsDetail";
	}
	
	
	@RequestMapping("shop")
	public String shopMain(Model model) {
		command = new ShMainCommand();
		command.execute(model);
		return "shop/shopMain";
	}
	
	
}
