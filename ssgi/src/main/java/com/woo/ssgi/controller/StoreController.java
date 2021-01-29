package com.woo.ssgi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.woo.ssgi.dao.StDao;
import com.woo.ssgi.scommand.AdminStoreDeleteCommand;
import com.woo.ssgi.scommand.AdminStoreListCommand;
import com.woo.ssgi.scommand.AdminStoreUpdateCommand;
import com.woo.ssgi.scommand.SCommand;
import com.woo.ssgi.scommand.StAddCommand;
import com.woo.ssgi.scommand.StDetailCommand;
import com.woo.ssgi.scommand.StListCommand;
import com.woo.ssgi.usercommand.UserListDeleteCommand;
import com.woo.ssgi.usercommand.UserListUpdateCommand;
import com.woo.ssgi.util.SSConstant;

@Controller
public class StoreController {
	SCommand command;
	
	@Autowired
	public void setStDao(StDao stDao) {
		SSConstant.stDao = stDao;
	}
	
	@RequestMapping("main")
	public String storeList(Model model,HttpServletRequest request) {
		
//	 	//dto 에 userdetails authentication.getPrincipal()를 담음
//	 	UserDetails dto=(UserDetails) authentication.getPrincipal();
//	 	System.out.println("id:"+dto.getUsername()); 
//	 	System.out.println(authentication.getPrincipal());
//	 	
//	 	//request의 user_id 에 dto.getUsername()세션을 담음
//	 	request.setAttribute("user_id", dto.getUsername());
	 	//request에 담긴 getUsername을 보냄.
	 	model.addAttribute("request",request);
		
		
		command = new StListCommand();
		command.execute(model);
		return "main/main";
	}
	
	
	@RequestMapping("main1")
	public String mainFrame(HttpServletRequest request, HttpServletResponse response,Model model) {
	 	model.addAttribute("request",request);
		
		
		command = new StListCommand();
		command.execute(model);
		
		return "main/main";
	}
	
	@RequestMapping("/")
	public String storeList1(Model model,HttpServletRequest request) {
		
//	 	//dto 에 userdetails authentication.getPrincipal()를 담음
//	 	UserDetails dto=(UserDetails) authentication.getPrincipal();
//	 	System.out.println("id:"+dto.getUsername()); 
//	 	System.out.println(authentication.getPrincipal());
//	 	
//	 	//request의 user_id 에 dto.getUsername()세션을 담음
//	 	request.setAttribute("user_id", dto.getUsername());
	 	//request에 담긴 getUsername을 보냄.
	 	model.addAttribute("request",request);
		
		
		command = new StListCommand();
		command.execute(model);
		return "main/main";
	}
	
	
	@RequestMapping("storeList") 
	public String storeList2(Model model,HttpServletRequest request) { 
		command = new StListCommand();
		command.execute(model); 
		request.getSession().setAttribute("val", "addS"); 
		return "redirect:SmyPage";
	}
	
	
	@RequestMapping("addStore")
	public String addStore(Model model,HttpServletRequest request,Authentication authentication) {
		System.out.println("addStore()");
	 	//dto 에 userdetails authentication.getPrincipal()를 담음
	 	UserDetails dto=(UserDetails) authentication.getPrincipal();
	 	System.out.println("id:"+dto.getUsername()); 
	 	System.out.println(authentication.getPrincipal());
	 	
	 	//request의 user_id 에 dto.getUsername()세션을 담음
	 	request.setAttribute("user_id", dto.getUsername());
	 	//request에 담긴 getUsername을 보냄.
	 	model.addAttribute("request",request);
	 	
		return "store/addStore";
	}
	
	@RequestMapping("addStorePro")
	public String addGoodsPro(HttpServletRequest request,MultipartHttpServletRequest mpRequest,
			Model model,Authentication authentication) {
	 	//dto 에 userdetails authentication.getPrincipal()를 담음
	 	UserDetails dto=(UserDetails) authentication.getPrincipal();
	 	System.out.println("id:"+dto.getUsername()); 
	 	System.out.println(authentication.getPrincipal());
	 	
	 	//request의 user_id 에 dto.getUsername()세션을 담음
	 	request.setAttribute("user_id", dto.getUsername());
	 	//request에 담긴 getUsername을 보냄.
	 	model.addAttribute("request",request);
		
		
		System.out.println("addStorePro");
		model.addAttribute("mpRequest", mpRequest);
		command = new StAddCommand();
		command.execute(model);
		
		return "redirect:storeList";
	}
	
	@RequestMapping("storeDetail")
	public String storeDetail(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new StDetailCommand();
		command.execute(model);
		return "store/storeDetail";
	}
	
	
	
	
	
	
	
	
	
	
	
	///StoreList 어드민용
	@RequestMapping("AstoreList")
	public String AstoreList(Model model,HttpServletRequest request) {		
	 	model.addAttribute("request",request);	
		command = new AdminStoreListCommand();
		command.execute(model);
		
		request.getSession().setAttribute("val", "AstoreList");
		System.out.println("Admin 판매자 상점 페이지 실행");
		
		return "AdminPage/StoreList";
	}
	
	 //상점 없애기
	 @RequestMapping("AdminStoreDelete")
	 public String UserListDelete (Model model, HttpServletRequest request) {
		 	
		 	System.out.println("상점 없애기1");
		 	model.addAttribute("request",request);
		 	command = new AdminStoreDeleteCommand();
		 	command.execute(model);
		 	System.out.println("상점 없애기2");
		 	request.getSession().setAttribute("val", "AstoreList");
	
		 	
		 	return  "redirect:AdminMyPage"; 
		 	
	 }
	 
	 //상점 없애기
	 @RequestMapping("AdminStoreUpdate")
	 public String AdminStoreUpdate(Model model, HttpServletRequest request) {
		 	
		 	System.out.println("상점변경1");
		 	model.addAttribute("request",request);
		 	command = new AdminStoreUpdateCommand();
		 	command.execute(model);
		 	System.out.println("상점변경2");
		 	request.getSession().setAttribute("val", "AstoreList");
	
		 	
		 	return  "redirect:AdminMyPage"; 
		 	
	 }
	
	
	
}
