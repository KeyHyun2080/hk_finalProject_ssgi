package com.woo.ssgi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woo.ssgi.command.AdminNoticeDetailCommand;
import com.woo.ssgi.command.AdminNoticeListCommand;
import com.woo.ssgi.command.AdminNoticeWriteCommand;
import com.woo.ssgi.command.Command;
import com.woo.ssgi.command.NoticeCommand;
import com.woo.ssgi.command.NoticeDeleteCommand;
import com.woo.ssgi.command.NoticeDetailCommand;
import com.woo.ssgi.command.NoticeModifyCommand;
import com.woo.ssgi.command.NoticeModifyOKCommand;
import com.woo.ssgi.command.QNAModifyOKCommand;
import com.woo.ssgi.dao.NoticeDAO;
import com.woo.ssgi.dto.NoticeDTO;
import com.woo.ssgi.util.NoticeConstant;

@Controller
public class NoticeController {
	Command command;

	@Autowired
	public void setDao(NoticeDAO dao) {
		NoticeConstant.dao = dao;
	}

	
	
	// ------------------ -------------여기서 부터 Admin 공지사항 컨트롤러----------------------------------------------------------//
	// Admin 페이지 실행  (관리자 권한)
	@RequestMapping("AdminMyPage")
	public String AdminMyPage(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		command = new AdminNoticeListCommand(); 
		command.execute(model);
		System.out.println("Admin 관리자 페이지 실행");
		return "AdminPage/AdminMyPage";
		}
	
	// Admin 페이지 ajax 사용  (관리자 권한)
	@RequestMapping("AdminNotice")
	public String AdminNotice(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		request.getSession().setAttribute("val", "AdminNotice");
		System.out.println("Admin 공지사항 페이지 실행");
		return "redirect:AdminMyPage";
	}
	
	//공지사항 작성페이지  (관리자 권한)
	@RequestMapping("AdminNoticeWrite")
	public String AdminNoticeWrite(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		System.out.println("Admin 공지사항 작성 페이지 실행");
		return "AdminPage/AdminNoticeWriteView";
	}
	
	 //공지사항 작성완료  (관리자 권한)
	@RequestMapping("AdminNoticeWriteOK") 
	public String AdminNoticeWriteOK(Model model, HttpServletRequest request,NoticeDTO dto) {
	    model.addAttribute("request",request);
	    model.addAttribute("dto",dto);
	    command = new AdminNoticeWriteCommand();
	    command.execute(model);
	    request.getSession().setAttribute("val", "AdminNotice");
	    System.out.println("공지사항 전송");
	    return "redirect:AdminMyPage"; //수정
	}
	
	 //공지사항 삭제 (관리자 권한)
	 @RequestMapping("NoticeDelete")
		public String delete(HttpServletRequest request, Model model) {
			System.out.println("삭제()");
			model.addAttribute("request", request);
			command = new NoticeDeleteCommand();
			command.execute(model);
			return "redirect:AdminMyPage"; 
		}	
	 
	 //Admin 공지사항 상세보기 페이지
	 @RequestMapping("AdminNoticeDetail")
		public String AdminNoticeDetail(Model model, HttpServletRequest request) {
			model.addAttribute("request", request);
			command = new AdminNoticeDetailCommand();
	    	command.execute(model);
			System.out.println("Admin 공지사항 페이지 실행");
			return "AdminPage/AdminNoticeDetail";
		}
	 
	 //Admin 공지사항 수정 페이지
	 @RequestMapping("NoticeModify")
		public String NoticeModify(Model model, HttpServletRequest request) {
			model.addAttribute("request", request);
			command = new NoticeModifyCommand();
	    	command.execute(model);
			System.out.println("Admin 공지사항 페이지 실행");
			return "AdminPage/AdminNoticeModify";
		}
	 
	 //Admin 공지사항 수정 완료 (관리자 권한)
	 @RequestMapping("NoticeModifyOK") 
	    public String NoticeModifyOK( Model model,HttpServletRequest request) {
		 	model.addAttribute("request",request);
	    	command = new NoticeModifyOKCommand();
	    	command.execute(model);
	    	System.out.println("공지사항 수정완료(관리자 권한)");
	    	// 수정한 값을 다시 보낼때는 AU_QNA_NUM 으로 보냈으니 그대로 같이 보내줘야 myQNAModify에 출력이 된다.
	    	return "redirect:AdminNoticeDetail?NOTICE_NUM=" + request.getParameter("NOTICE_NUM"); 
	 	}
	
	
	// -------------------------------여기 까지 Admin 공지사항 컨트롤러------------------------------------------------------------//

	
	
	//--------------------여기서부터 일반 공지사항 게시판 컨트롤러-------------------------//
	
	//공지사항 게시판 페이지
	@RequestMapping("Notice")
	public String notice(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		command = new NoticeCommand(); 
		command.execute(model);
		//request.getSession().setAttribute("val", "AdminNotice");
		System.out.println("Admin 공지사항 페이지 실행");
		return "main/Notice";
	}
	
	
	//공지사항 상세보기 페이지
		@RequestMapping("NoticeDetail")
		public String NoticeDetail(Model model, HttpServletRequest request) {
			model.addAttribute("request", request);
			command = new NoticeDetailCommand();
	    	command.execute(model);
			System.out.println("공지사항 작성 페이지 실행");
			return "main/NoticeDetail";
		}
		
		
		
	
	
	
	
	
	//-----------------------여기까지 일반 공지사항 게시판 컨트롤러-----------------------//
	
	
}
