package com.woo.ssgi;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woo.ssgi.command.Command;
import com.woo.ssgi.command.NoticeCommand;
import com.woo.ssgi.command.QNAListCommand;
import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.util.QNAConstant;



@Controller
public class HomeController {	
	
	Command command;
	

	@Autowired
	public void setDao(QNADAO dao) {
		QNAConstant.dao = dao;
	}

	
	
	//----------메인페이지 컨트롤러----------------------------------
	
//	@RequestMapping("main")
//	public String main() {
//		return "main/main";
//	}
	@RequestMapping("main2")
	public String main2() {
	return "main/main2";
	}
	@RequestMapping("kakaologin1")
	public String kakaologin1() {
	return "kakao/kakaologin1";
	}
	
//	@RequestMapping("/") 
//    public String main1() {
//    	return "main/main"; 
//    }
//	
	@RequestMapping("about")
	public String about() {
		return "main/about";
	}
	
	//마이페이지 컨트롤러

    //-----------------여기서 부터 U마이페이지 컨트롤러--------------------------//
    
    @RequestMapping("myRv") 
    public String myRv(Model model, HttpServletRequest request) {
    	model.addAttribute("request",request);
    	request.getSession().setAttribute("val", "myRv1"); 
    	return "mypage/myRv"; 
    }
    
    @RequestMapping("myPay") 
    public String myPay(Model model, HttpServletRequest request) {
    	model.addAttribute("request",request);
    	
    	request.getSession().setAttribute("val", "myPay1"); 
    	return "mypage/myPay"; 
    }
    //-----------------여기까지  U마이페이지 컨트롤러---------------------------//
    
 //-----------------여기서 부터 S 마이페이지 컨트롤러--------------------------//
    

    
    @RequestMapping("SmyPay") 
    public String SmyPay(Model model, HttpServletRequest request) {
    	model.addAttribute("request",request);
//    	command = new QNAListCommand();
//	 	command.execute(model);
    	request.getSession().setAttribute("val", "StoreAd"); 
    	return "mypage/SmyPay"; 
    }
    //-----------------여기까지 마이페이지 컨트롤러---------------------------//
    

	// ------------여기부터 로그인 및 회원가입 컨트롤러-------------------------//
    
	@RequestMapping("UAddjoin")
	public String UAddjoin() {
		return "addjoin/UAddjoin";
	}
	
	@RequestMapping("Charge")
	public String Charge() {
		return "test/charge";
	}

	@RequestMapping("SAddjoin")
	public String SAddjoin() {
		return "addjoin/SAddjoin";
	}

//	@RequestMapping("ULogin")
//	public String ULogin() {
//		return "login/ULogin";
//	}
// 
//	@RequestMapping("SLogin")
//	public String SLogin() {
//		return "login/SLogin";
//	}
	
	//회원가입 성공페이지
    @RequestMapping("UAddjoinFinish") 
    public String UAddjoinFinish() {
    	return "addjoin/UAddjoinFinish"; 
    }
	// ----------------------------------------------------------


	
	@RequestMapping("map")
	public String map() {
		return "map";
	}
	
	
	//
	

}
