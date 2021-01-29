package com.woo.ssgi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.woo.ssgi.command.Command;
import com.woo.ssgi.command.QNAModifyCommand;
import com.woo.ssgi.command.SAdminAnswerWriteOKCommand;
import com.woo.ssgi.command.SAdminQNAAnswerCommand;
import com.woo.ssgi.command.SAdminQNAWriteCommand;
import com.woo.ssgi.command.UAdminAnswerWriteOKCommand;
import com.woo.ssgi.command.UAdminQNAAnswerCommand;
import com.woo.ssgi.command.UAdminQNAWriteCommand;
import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.util.QNAConstant;

@Controller
public class AdminQNAController {
	Command command;

	@Autowired
	public void setDao(QNADAO dao) {
		QNAConstant.dao = dao;
	}
	
	@Autowired
	private QNADAO dao;
	

	// -----------------------------------------------------여기서 부터 관리자 Admin 문의 컨트롤러---------------------------------------------------//

	

	// -------------------------------여기서 부터는 판매자 회원 S QNA 문의 답변 Admin 페이지 처리---------------------------------------//

	// Admin S 판매자회원 문의 페이지
	@RequestMapping("SAnswer")
	public String SAnswer(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		command = new SAdminQNAAnswerCommand();
		command.execute(model);
		request.getSession().setAttribute("val", "SAnswer");
		System.out.println("Admin 판매자 S 회원 문의 페이지 실행");
		return "AdminPage/SAdminAnswerView";
	}

	// Admin S 판매자 회원 답변 페이지
	@RequestMapping("SAdminAnswerWrite")
	public String SAdminAnswerWrite(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		command = new SAdminQNAWriteCommand();
		command.execute(model);
		System.out.println("Admin 판매자 회원 문의 답변 페이지 실행");
		return "AdminPage/SAdminAnswerWrite";
	}

	//Admin S 판매자 회원 답변 전송
	@RequestMapping("SAdminAnswerWriteOK")
	public String SAdminAnswerWriteOK(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		command = new SAdminAnswerWriteOKCommand();
		command.execute(model);
		System.out.println("Q&A 수정 완료시작");
		// 수정한 값을 다시 보낼때는 AU_QNA_NUM 으로 보냈으니 그대로 같이 보내줘야 myQNAModify에 출력이 된다.
		request.getSession().setAttribute("val", "SAnswer");
		return "redirect:AdminMyPage?AS_QNA_NUM=" + request.getParameter("AS_QNA_NUM");
	}
	
	

	// -------------------------------여기 까지 판매자 회원 QNA 문의 답변 Admin 페이지 처리-------------------------------------------//

	// -------------------------------여기서 부터는 일반 회원 U QNA 문의 답변 Admin 페이지 처리---------------------------------------//

	// Admin 일반회원 U 문의 페이지
	@RequestMapping("UAnswer")
	public String UAnswer(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		command = new UAdminQNAAnswerCommand();
		command.execute(model);
		request.getSession().setAttribute("val", "UAnswer");
		System.out.println("Admin 일반 U 회원 문의 페이지 실행");
		return "AdminPage/UAdminAnswerView";
	}

	// Admin 일반 U 회원 답변 페이지
	@RequestMapping("UAdminAnswerWrite")
	public String UAdminAnswerWrite(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		command = new UAdminQNAWriteCommand();
		command.execute(model);
		System.out.println("Admin 일반 회원 U 문의 답변 페이지 실행");
		return "AdminPage/UAdminAnswerWrite";
	}

	// UQNA 수정 완료
	@RequestMapping("UAdminAnswerWriteOK")
	public String UAdminAnswerWriteOK(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		command = new UAdminAnswerWriteOKCommand();
		command.execute(model);
		System.out.println("Q&A 수정 완료시작");
		// 수정한 값을 다시 보낼때는 AU_QNA_NUM 으로 보냈으니 그대로 같이 보내줘야 myQNAModify에 출력이 된다.
		request.getSession().setAttribute("val", "UAnswer");
		return "redirect:AdminMyPage?AU_QNA_NUM=" + request.getParameter("AU_QNA_NUM");
	}

	// -------------------------------여기 까지 일반 회원 U QNA 문의 답변 Admin 페이지 처리--------------------------------------------//
	 //----------------------답변확인 비교 컨트롤러------------------------------------------------------//
	
	
	//S 답변확인 
	@RequestMapping(value = "/SAdminQNA/OKCheck", method = RequestMethod.GET)
	@ResponseBody
	public String OKCheck(@RequestParam("AS_QNA_READ") String AS_QNA_READ) {
		return  dao.SOKCheck(AS_QNA_READ)+"";
	}
	
	
	
	 //U 답변확인
	 @RequestMapping(value = "/UAdminQNA/OKCheck", method = RequestMethod.GET)
		@ResponseBody
		public String UOKCheck(@RequestParam("AU_QNA_READ") String AU_QNA_READ) {
			return  dao.UOKCheck(AU_QNA_READ)+"";
		}
	 
	
	 

	 
	 //-------------------------회원관리----------------------------------//


	
}
