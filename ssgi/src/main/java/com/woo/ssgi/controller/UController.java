package com.woo.ssgi.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.woo.ssgi.usercommand.SJoinCommand;
import com.woo.ssgi.usercommand.UCommand;
import com.woo.ssgi.usercommand.UJoinCommand;
import com.woo.ssgi.usercommand.UserDeleteCommand;
import com.woo.ssgi.usercommand.UserDetailCommand;
import com.woo.ssgi.usercommand.UserListCommand;
import com.woo.ssgi.usercommand.UserListDeleteCommand;
import com.woo.ssgi.usercommand.UserListUpdateCommand;
import com.woo.ssgi.usercommand.UserMailSendCommand;
import com.woo.ssgi.usercommand.UserModifyCommand;
import com.woo.ssgi.usercommand.UserModifyOkCommand;
import com.woo.ssgi.command.NoticeDeleteCommand;
import com.woo.ssgi.command.QNADetailCommand;
import com.woo.ssgi.command.SAdminQNAAnswerCommand;
import com.woo.ssgi.dao.UserDao;
import com.woo.ssgi.dto.UserDto;
import com.woo.ssgi.util.UConstant;


@Controller
public class UController {
	UCommand com;

	@Autowired
	private UserDao dao;
	

	
	@Autowired
	private UserMailSendCommand mailsender;





	
	@Autowired
	public void setDao(UserDao dao) {
		this.dao = dao;
		UConstant.dao = this.dao;
	}
	
	
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//로그인
	@RequestMapping("ULogin")
	public ModelAndView login(
			@RequestParam(value="log",required =false) String log,
			@RequestParam(value="error",required =false) String error,
			@RequestParam(value="logout",required =false) String logout) {

		
		ModelAndView model = new ModelAndView();
		System.out.println("log : " + log);
		System.out.println("error : " + error);
		System.out.println("logout : " + logout);
		
		if(log == null && error == null && logout == null) {
			System.out.println("log");
			model.addObject("log", "before login!");
		}
		if(log == null &&  logout == null) {
			System.out.println("error");
			model.addObject("error", "Invalid username and password!");
		}
		if(log == null && error == null) {
			System.out.println("msg");
			model.addObject("msg", "you ve been logged out successfully");
		}
		model.setViewName("login/ULogin");
		return model;			
}

	
	

	
	
	//회원가입
	@RequestMapping("join")
	public String join(HttpServletRequest request, HttpServletResponse response, Model model, UserDto dto) {
		System.out.println("join");
		com = new UJoinCommand(passwordEncoder);	//passwordEncoder는 속성방식으로 주입받은 객체인데 이름 BCommand객체 생성시 너겨주어 그 객체에서 사용토록 전달
		com.execute(model, request);
		String result = (String)request.getAttribute("result");
		response.setContentType("text/plain; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter writer = null;
		/*
		 * try { writer = response.getWriter(); } catch (Exception e) {
		 * e.printStackTrace(); }
		 * 
		 * if(result.equals("join-success")) { System.out.println("이동"); return
		 * "redirect:main1"; } else
		 */
		
	
		mailsender.mailSendWithUserKey(dto.getUser_id(),dto.getUser_email(), request);
		
			return "redirect:UAddjoinFinish";
	}
	

	
	//회원가입
	@RequestMapping("Sjoin")
	public String Sjoin(HttpServletRequest request, HttpServletResponse response, Model model, UserDto dto) {
		System.out.println("Sjoin");
		com = new SJoinCommand(passwordEncoder);	//passwordEncoder는 속성방식으로 주입받은 객체인데 이름 BCommand객체 생성시 너겨주어 그 객체에서 사용토록 전달
		com.execute(model, request);
		String result = (String)request.getAttribute("result");
		response.setContentType("text/plain; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter writer = null;
		/*
		 * try { writer = response.getWriter(); } catch (Exception e) {
		 * e.printStackTrace(); }
		 * 
		 * if(result.equals("join-success")) { System.out.println("이동"); return
		 * "redirect:main1"; } else
		 */
		
	
		mailsender.mailSendWithUserKey(dto.getUser_id(),dto.getUser_email(), request);
		
			return "redirect:UAddjoinFinish";
	}

	
	
	//아이디중복체크
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idChk(@RequestParam("user_id") String user_id) {

		return dao.idChk(user_id);
	}
	
	//이메일 중복체크
	@RequestMapping(value = "/user/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public int emailChk(@RequestParam("user_email") String user_email) {

		return dao.emailChk(user_email);
	}
	
	
	
	//key 값을 Y로 바꾸는 작업
	@RequestMapping(value = "/user/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("user_id") String user_id, 
								   @RequestParam("user_key") String key
								   ) {

		dao.alter_userKey(user_id, key); // mailsender의 경우 @Autowired
		
		System.out.println("user_id : " +user_id);
		System.out.println("key : "+ key);

		return "regSuccess";
	}
	



	 //main -> myPage수정추가
	 @RequestMapping("myPage") 
	    public String myPage(Model model, HttpServletRequest request, Authentication authentication) {
		 	
		 	//dto 에 userdetails authentication.getPrincipal()를 담음
		 	UserDetails dto=(UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("user_id", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);
		 	
	    	com = new UserDetailCommand();
	    	com.execute(model, request);
	    	System.out.println("마이페이지로 이동");
	    	
	    	return "mypage/myPage"; 
	    }
	 
	 //myPage 수정하러가기
	 @RequestMapping("myPageModifyView") 
	 public String myPageModify(Model model, HttpServletRequest request, Authentication authentication) {
		 	//dto 에 userdetails authentication.getPrincipal()를 담음
		 	UserDetails dto=(UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("user_id", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);
		 	
	    	com = new UserModifyCommand();
	    	com.execute(model, request);
	    	System.out.println("수정하기이동.");

		 return "mypage/myPageModify";
	 }
	 
	 //my페이지 수정완료
	 @RequestMapping("userModify") 
	 public String userModify(Model model, HttpServletRequest request, Authentication authentication) {
		 	UserDetails dto=(UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("user_id", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);
		 	
	    	com = new UserModifyOkCommand(passwordEncoder);
	    	com.execute(model, request);
	    	System.out.println("수정완료 마이페이지로이동.");
		 	
		 	
		 	
		 	return "redirect:myPage?user_id="+ dto.getUsername();
	 }
	 
	 //탈퇴 삭제
	 @RequestMapping("userDelete")
	 public String userDelete (HttpServletResponse response, String logout, Model model, HttpServletRequest request, Authentication authentication
			 ) {
		 	UserDetails dto=(UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("user_id", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);
		 	
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth != null) {
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
			
		 	com = new UserDeleteCommand();
		 	com.execute(model, request);
		 	System.out.println("삭제하기");
 	
		 	
		 	return  "redirect:main"; 
		 	
	 }
	 

	 
	 //main -> SmyPage수정추가
	 @RequestMapping("SmyPage") 
	    public String SmyPage(Model model, HttpServletRequest request, Authentication authentication) {
		 	
		 	//dto 에 userdetails authentication.getPrincipal()를 담음
		 	UserDetails dto=(UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("user_id", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);
		 	
	    	com = new UserDetailCommand();
	    	com.execute(model, request);
	    	System.out.println("S마이페이지로 이동");
	    	
	    	return "mypage/SmyPage"; 
	    }
	 
	 //SmyPage 수정하러가기
	 @RequestMapping("SmyPageModifyView") 
	 public String SmyPageModify(Model model, HttpServletRequest request, Authentication authentication) {
		 	//dto 에 userdetails authentication.getPrincipal()를 담음
		 	UserDetails dto=(UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("user_id", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);
		 	
	    	com = new UserModifyCommand();
	    	com.execute(model, request);
	    	System.out.println("S수정하기이동.");

		 return "mypage/SmyPageModify";
	 }

	 //my페이지 수정완료
	 @RequestMapping("SuserModify") 
	 public String SuserModify(Model model, HttpServletRequest request, Authentication authentication) {
		 	UserDetails dto=(UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("user_id", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);
		 	
	    	com = new UserModifyOkCommand(passwordEncoder);
	    	com.execute(model, request);
	    	System.out.println("S수정완료 마이페이지로이동.");
		 	
		 	
		 	
		 	return "redirect:SmyPage?user_id="+ dto.getUsername();
	 }

	 //탈퇴 삭제
	 @RequestMapping("SuserDelete")
	 public String SuserDelete (HttpServletResponse response, String logout, Model model, HttpServletRequest request, Authentication authentication
			 ) {
		 	UserDetails dto=(UserDetails) authentication.getPrincipal();
		 	System.out.println("id:"+dto.getUsername()); 
		 	System.out.println(authentication.getPrincipal());
		 	//request의 user_id 에 dto.getUsername()세션을 담음
		 	request.setAttribute("user_id", dto.getUsername());
		 	//request에 담긴 getUsername을 보냄.
		 	model.addAttribute("request",request);
		 	
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth != null) {
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
			
		 	com = new UserDeleteCommand();
		 	com.execute(model, request);
		 	System.out.println("S삭제하기");
 	
		 	
		 	return  "redirect:main"; 
		 	
	 }
	 
	 //운영자가 회원강퇴시키기
	 @RequestMapping("UserListDelete")
	 public String UserListDelete (Model model, HttpServletRequest request) {
		 	
		 System.out.println("유저강퇴삭제하기");
		 	model.addAttribute("request",request);
		 	com = new UserListDeleteCommand();
		 	com.execute(model, request);
		 	System.out.println("유저강퇴삭제하기");
		 	request.getSession().setAttribute("val", "UserList");
 	
		 	
		 	return  "redirect:AdminMyPage"; 
		 	
	 }
	 
	 //운영자가  상태변경시키기ㅣ
	 @RequestMapping("UserListUpdate")
	 public String UserListUpdate (Model model, HttpServletRequest request) {
		 	
		 System.out.println("유저상태변경모드1");
		 	model.addAttribute("request",request);
		 	com = new UserListUpdateCommand();
		 	com.execute(model, request);
		 	System.out.println("유저상태변경하기2");
		 	request.getSession().setAttribute("val", "UserList");
 	
		 	
		 	return  "redirect:AdminMyPage"; 
		 	
	 }
	 

	 
	 
	 
	 
	 
	 
	 
	 
	 //USER_LIST 어드민용
	 
		@RequestMapping("UserList")
		public String UserList(Model model, HttpServletRequest request) {
			model.addAttribute("request", request);
			com = new UserListCommand();
			com.execute(model, request);
			
			request.getSession().setAttribute("val", "UserList");
			System.out.println("Admin 판매자 S 회원 문의 페이지 실행");
			
			return "AdminPage/UserList";
		}
	 
	 
}
