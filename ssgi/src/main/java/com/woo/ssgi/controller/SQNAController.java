package com.woo.ssgi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woo.ssgi.command.Command;
import com.woo.ssgi.command.QNAWriteCommand;
import com.woo.ssgi.command.SQNADeleteCommand;
import com.woo.ssgi.command.SQNADetailCommand;
import com.woo.ssgi.command.SQNAListCommand;
import com.woo.ssgi.command.SQNAModifyCommand;
import com.woo.ssgi.command.SQNAModifyOKCommand;
import com.woo.ssgi.command.SQNAWriteCommand;
import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.dto.SQNADTO;
import com.woo.ssgi.dto.UQNADTO;
import com.woo.ssgi.util.PagingVO;
import com.woo.ssgi.util.QNAConstant;

@Controller
public class SQNAController {
	Command command;
	
	@Autowired
	private QNADAO dao;
	
	
	@Autowired
	public void setDao(QNADAO dao) {
		QNAConstant.dao = dao;
	}

	
	 //SmyPage 수정추가
	 @RequestMapping("Sauthmanage") 
	    public String Sauthmanage(Model model, HttpServletRequest request) {
	    	model.addAttribute("request",request);
	    	request.getSession().setAttribute("val", "Smanage"); //수정추가
	    	return "redirect:SmyPage"; 
	    }
	 
	
	
	
	

	
	    //SQNA 페이지 이동
	 	@RequestMapping("SmyPageQNA") 
	    public String SmyPageQNA(Model model, HttpServletRequest request,Authentication authentication,PagingVO vo, 
	    		  @RequestParam(value="nowPage", required=false)String nowPage
	    		, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
	 		
		 	UserDetails dto = (UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("USER_ID", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);	 		
		 	System.out.println("S 유저 Q&A 페이지 실행");		 	
		 	model.addAttribute("request",request);
		 	
			int total = dao.Scount(dto.getUsername());
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll", dao.SQNAList(dto.getUsername(), vo));
		 	
			
			System.out.println("Scount : " +  dao.Scount(dto.getUsername()));		 	
			
			
		 	command = new SQNAListCommand();
		 	command.execute(model);
		 	request.getSession().setAttribute("val", "Sqna"); //수정추가
		 	return "mypage/SmyPageQNA"; 
	    }
	 
	 	//SQNA 작성 페이지
	 	@RequestMapping("SmyQNAWrite") 
	    public String SmyQNAWrite( Model model,HttpServletRequest request, Authentication authentication) {
	 		
		 	UserDetails dto = (UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("user_id", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);
	 		
	 		
	    	System.out.println("S Q&A쓰기 페이지 이동");
	    	return "mypage/SmyQNAWrite"; 
	    	
	    	
	 	}
	 
	 	 //SQNA 작성완료
		 @RequestMapping("SmyQNAWriteYes") 
		    public String SmyQNAWriteYes(Model model, HttpServletRequest request,SQNADTO dto1, Authentication authentication) {
			 
			 
			 	UserDetails dto = (UserDetails) authentication.getPrincipal();
			 	System.out.println("id:"+dto.getUsername()); 
			 	System.out.println(authentication.getPrincipal());
			 	//request의 user_id 에 dto.getUsername()세션을 담음
			 	request.setAttribute("user_id", dto.getUsername());
			 	//request에 담긴 getUsername을 보냄.
			 	model.addAttribute("request",request);
		    		    	
		    	
		    	model.addAttribute("dto",dto1);
		    	
		    	command = new SQNAWriteCommand();
		    	command.execute(model);
		    	System.out.println("Q&N글 쓰기 전송");
		    	request.getSession().setAttribute("val", "Sqna"); //수정추가

		    	return "redirect:SmyPage"; //수정
		    }
		 
		 //SQNA 삭제
		 @RequestMapping("SmyQNADelete")
			public String Sdelete(HttpServletRequest request, Model model) {
				System.out.println("S삭제()");
				model.addAttribute("request", request);
				command = new SQNADeleteCommand();
				command.execute(model);
				return "mypage/SmyPage"; 
			}	
		 
		 //SQNA글 상세보기
		 @RequestMapping("SmyQNADetail") 
		    public String SmyQNADetail(HttpServletRequest request,Model model) {
		    	model.addAttribute("request", request);
		    	command = new SQNADetailCommand();
		    	command.execute(model);
		    	System.out.println("문의글 상세보기 페이지 이동");
		    	return "mypage/SmyQNADetail"; 
		 	}
		 
		 //SQNA 수정 페이지
		 @RequestMapping("SmyQNAModify") 
		    public String QNAModify(Model model, HttpServletRequest request) {
		    	model.addAttribute("request",request);
		    	System.out.println("QNA 수정 페이지");
		    	command = new SQNAModifyCommand();
		    	command.execute(model);
		    	return "mypage/SmyQNAModify"; 
		    }
		 
		//QNA 수정 완료
		 @RequestMapping("SmyQNAModifyOK") 
		    public String SmyQNAModifyOK( Model model,HttpServletRequest request) {
			 	model.addAttribute("request",request);
		    	command = new SQNAModifyOKCommand();
		    	command.execute(model);
		    	System.out.println("Q&A 수정 완료시작");
		    	// 수정한 값을 다시 보낼때는 AU_QNA_NUM 으로 보냈으니 그대로 같이 보내줘야 myQNAModify에 출력이 된다.
		    	return "redirect:SmyQNADetail?AS_QNA_NUM=" + request.getParameter("AS_QNA_NUM"); 
		 	}
		 
		 
	
	

}
