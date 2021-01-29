package com.woo.ssgi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woo.ssgi.command.Command;
import com.woo.ssgi.command.QNADeleteCommand;
import com.woo.ssgi.command.QNADetailCommand;
import com.woo.ssgi.command.QNAListCommand;
import com.woo.ssgi.command.QNAModifyCommand;
import com.woo.ssgi.command.QNAModifyOKCommand;
import com.woo.ssgi.command.QNAWriteCommand;
import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.dto.UQNADTO;
import com.woo.ssgi.util.PagingVO;
import com.woo.ssgi.util.QNAConstant;

@Controller
public class QNAController {
	Command command;
	

	@Autowired
	private QNADAO dao;
	
	@Autowired
	public void setDao(QNADAO dao) {
		QNAConstant.dao = dao;
	}
	


	 
	
	
	 //myPage 수정추가
	 @RequestMapping("authmanage") 
	    public String authmanage(Model model, HttpServletRequest request) {
	    	model.addAttribute("request",request);
//	    	command = new QNAWriteCommand();
//	    	command.execute(model);
//	    	System.out.println("Q&N글 쓰기 전송");
	    	request.getSession().setAttribute("val", "manage"); //수정추가
	    	return "redirect:myPage"; 
	    }
	 
	 
	 
	 
//----------------------------------------	 

	 //QNA 페이지 이동
	 @RequestMapping("myPageQNA") 
	    public String myPageQNA(Model model, HttpServletRequest request, Authentication authentication,PagingVO vo, 
	    		  @RequestParam(value="nowPage", required=false)String nowPage
	    		, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		 	System.out.println("Q&A 페이지 실행");
		 	
		 	UserDetails dto = (UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("USER_ID", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);
		 	
		 	
			int total = dao.count(dto.getUsername());
			System.out.println(dto.getUsername());
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
			model.addAttribute("viewAll", dao.QNAList(dto.getUsername(), vo));
			
		 	
			System.out.println("vo : " +  vo.getStart());
			System.out.println("count : " +  dao.count(dto.getUsername()));
			
			
		 	command = new QNAListCommand();
		 	command.execute(model);
		 	request.getSession().setAttribute("val", "qna"); //수정추가
		 	
		 	return "mypage/myPageQNA"; 
	    }
	 
	 //QNA 작성 페이지
	 @RequestMapping("myQNAWrite") 
	    public String myQNAWrite( Model model, HttpServletRequest request, Authentication authentication) {
		 
		 	UserDetails dto = (UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("user_id", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);
		 	
	    	System.out.println("Q&A쓰기 페이지 이동");
	    	return "mypage/myQNAWrite"; 
	 	}
	
	 //QNA 작성완료
	 @RequestMapping("myQNAWriteYes") 
	    public String myQNAWriteYes(Model model, HttpServletRequest request, UQNADTO dto1, Authentication authentication) {
		 
		 	UserDetails dto = (UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("user_id", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);
	    	
	    	
	    	
	    	model.addAttribute("dto",dto1);
	    	
	    	command = new QNAWriteCommand();
	    	command.execute(model);
	    	System.out.println("Q&N글 쓰기 전송");
	    	request.getSession().setAttribute("val", "qna"); //수정추가

	    	return "redirect:myPage"; //수정
	    }
 
	 //QNA 삭제
	 @RequestMapping("myQNADelete")
		public String delete(HttpServletRequest request, Model model) {
			System.out.println("삭제()");
			model.addAttribute("request", request);
			command = new QNADeleteCommand();
			command.execute(model);
			return "mypage/myPage"; 
		}	
	 
	 //QNA글 상세보기
	 @RequestMapping("myQNADetail") 
	    public String myQNADetail(HttpServletRequest request,Model model) {
	    	model.addAttribute("request", request);
	    	command = new QNADetailCommand();
	    	command.execute(model);
	    	System.out.println("문의글 상세보기 페이지 이동");
	    	return "mypage/myQNADetail"; 
	 	}
	 
	 //QNA 수정 페이지
	 @RequestMapping("myQNAModify") 
	    public String QNAModify(Model model, HttpServletRequest request) {
	    	model.addAttribute("request",request);
	    	System.out.println("QNA 수정 페이지");
	    	command = new QNAModifyCommand();
	    	command.execute(model);
	    	return "mypage/myQNAModify"; 
	    }
	 
	 //QNA 수정 완료
	 @RequestMapping("myQNAModifyOK") 
	    public String myQNAModifyOK( Model model,HttpServletRequest request) {
		 	model.addAttribute("request",request);
	    	command = new QNAModifyOKCommand();
	    	command.execute(model);
	    	System.out.println("Q&A 수정 완료시작");
	    	// 수정한 값을 다시 보낼때는 AU_QNA_NUM 으로 보냈으니 그대로 같이 보내줘야 myQNAModify에 출력이 된다.
	    	return "redirect:myQNADetail?AU_QNA_NUM=" + request.getParameter("AU_QNA_NUM"); 
	 	}
	 
	 
	 
	
	 
	
	 

}
