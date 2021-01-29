package com.woo.ssgi.usercommand;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.woo.ssgi.dao.UserDao;
import com.woo.ssgi.util.UConstant;

public class SJoinCommand implements UCommand{
	BCryptPasswordEncoder passwordEncoder;	//암호화클래스
	@Autowired	//생성자로 해주어야 에러없음 servlet-context.xml에 bean등록
	public SJoinCommand(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;			
	}
		
	@Override
	public void execute(Model model, HttpServletRequest request) {
		
		
//		Map<String,Object> map = model.asMap();
//		request = (HttpServletRequest)map.get("request");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		String user_addr = request.getParameter("user_addr");
		String user_addr2 = request.getParameter("user_addr2");
		String user_ph = request.getParameter("user_ph");
		String user_regist = request.getParameter("user_regist");
		String user_agree = request.getParameter("user_agree");
		String user_gender = request.getParameter("user_gender");
		String user_email = request.getParameter("user_email");
		String user_role = request.getParameter("user_role");
		String user_key = request.getParameter("user_key");
	
		
		System.out.println(user_id +"1");
		System.out.println(user_pw +"2");
		System.out.println(user_name +"3");
		System.out.println(user_addr +"4");
		System.out.println(user_addr2 +"5");
		System.out.println(user_ph +"6");
		System.out.println(user_regist +"7");
		System.out.println(user_agree +"8");
		System.out.println(user_gender +"9");
		System.out.println(user_email +"10");
		System.out.println(user_role +"11");
		System.out.println(user_key +"12");
	

		
		String bPw_org = user_pw;
		//system.out.println(passwordEncoder);
		user_pw = passwordEncoder.encode(bPw_org);//암호화단계
		System.out.println(user_pw + "size " + user_pw.length());	//암호화된 패스워드의 크기
		//UserDto dto = new UserDto(user_id,user_pw,user_name,user_addr,user_addr2, user_ph, null, user_agree, user_gender, user_email, user_role);	//db에는 암호화된 ㅐㅍ스워드를 보내야 하므로 함호된 bPw를 사용.
		
		UserDao dao = UConstant.dao;	
		dao.Sjoin(user_id,user_pw,user_name,user_addr,user_addr2,user_ph,user_email);	
		
		
	}
	



}
