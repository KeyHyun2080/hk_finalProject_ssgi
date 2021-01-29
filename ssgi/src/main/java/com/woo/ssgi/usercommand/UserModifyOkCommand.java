package com.woo.ssgi.usercommand;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.woo.ssgi.dao.UserDao;
import com.woo.ssgi.util.UConstant;



public class UserModifyOkCommand implements UCommand{

	BCryptPasswordEncoder passwordEncoder;	//암호화클래스
	@Autowired	//생성자로 해주어야 에러없음 servlet-context.xml에 bean등록
	public UserModifyOkCommand(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;			
	}
	
	
	@Override
	public void execute(Model model, HttpServletRequest request) {
		Map<String, Object> map = model.asMap();
		request = (HttpServletRequest)map.get("request");
		
		String user_id = (String)request.getAttribute("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_addr = request.getParameter("user_addr");
		String user_addr2 = request.getParameter("user_addr2");
		String user_ph = request.getParameter("user_ph");
		
		
		System.out.println("유저아이디 :"+user_id);
		System.out.println("유저비번 :"+user_pw);
		System.out.println("user_addr :"+user_addr);
		System.out.println("user_addr2 :"+user_addr2);
		System.out.println("유저번호 : "+user_ph);
		
		
		System.out.println("회원정보수정 시작");
		
		String bPw_org = user_pw;
		//system.out.println(passwordEncoder);
		user_pw = passwordEncoder.encode(bPw_org);//암호화단계
		System.out.println(user_pw + "size " + user_pw.length());	//암호화된 패스워드의 크기
		
		UserDao dao = UConstant.dao;
		dao.modifyOk(user_id,user_pw,user_addr,user_addr2,user_ph);
	}

}
