package com.woo.ssgi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.woo.ssgi.dao.GoodsDao;
import com.woo.ssgi.gcommand.GAddCommand;
import com.woo.ssgi.gcommand.GCommand;
import com.woo.ssgi.gcommand.GDetailCommand;
import com.woo.ssgi.gcommand.GListCommand;
import com.woo.ssgi.util.GConstant;

@Controller
public class GController {
	GCommand command;
	
	
	@Autowired
	public void setGDao(GoodsDao gDao) {
		GConstant.gDao = gDao;
	}
	

	//굿즈 리스트 보기
	@RequestMapping("sGoodsList")
	public String sGoodsList(Model model,HttpServletRequest request,Authentication authentication) {
		

		
		System.out.println("sGoodsList()");
		System.out.println("model :" + model);
		command = new GListCommand();
		command.execute(model);
		
		return "goods/sGoodsList";
	}
	
	//상품등록 페이지 이동
	@RequestMapping("addGoods")
	public String addGoods(Model model,HttpServletRequest request,Authentication authentication) {
		System.out.println("addGoods()");
		
	 	UserDetails dto=(UserDetails) authentication.getPrincipal();
	 	System.out.println("id:"+dto.getUsername()); 
	 	System.out.println(authentication.getPrincipal());
	 	
	 	//request의 user_id 에 dto.getUsername()세션을 담음
	 	request.setAttribute("user_id", dto.getUsername());
	 	//request에 담긴 getUsername을 보냄.
	 	model.addAttribute("request",request);
	 	
		return "goods/addGoods";
	}
	
	//상품 등록(버튼 누르면)
	@RequestMapping("addGoodsPro")
	public String addGoodsPro(HttpServletRequest request,MultipartHttpServletRequest mpRequest,
			Model model,Authentication authentication) {
		System.out.println("addGoods()");
	 	UserDetails dto=(UserDetails) authentication.getPrincipal();
	 	System.out.println("id:"+dto.getUsername()); 
	 	System.out.println(authentication.getPrincipal());
	 	
	 	//request의 user_id 에 dto.getUsername()세션을 담음
	 	request.setAttribute("user_id", dto.getUsername());
	 	//request에 담긴 getUsername을 보냄.
	 	model.addAttribute("request",request);
		
		System.out.println("addGoodsPro()");
		model.addAttribute("mpRequest", mpRequest);
		command = new GAddCommand();
		command.execute(model);
		
		
		request.getSession().setAttribute("val", "SmyGoods");
		return "redirect:SmyPage";
	}
	
	//상품 디테일
	@RequestMapping("sGoodsDetail")
	public String sGoodsDetail(HttpServletRequest request, Model model) {
		System.out.println("sGoodsDetail()");
		model.addAttribute("request", request);
		command = new GDetailCommand();
		command.execute(model);
		
		return "goods/sGoodsDetail";
	}
	
	
	//S굳즈마이컨트롤 
	
    @RequestMapping("SmyGoods") 
    public String SmyGoods(Model model, HttpServletRequest request) {
    	
    	
		System.out.println("sGoodsList()");
		System.out.println("model :" + model);
		command = new GListCommand();
		command.execute(model);
    	
    	model.addAttribute("request",request);
    	request.getSession().setAttribute("val", "SmyGoods");
    	return "mypage/SmyGoods"; 
    }
    
    
    
    
	@RequestMapping("kakaopay")
	public String kakaopay(Model model, HttpServletRequest request) {
		
		
		
		return "public/kakaopay";
	}
}
