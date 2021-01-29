package com.woo.ssgi.usercommand;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.UserDao;
import com.woo.ssgi.dto.UserDto;
import com.woo.ssgi.util.UConstant;

public class UserDetailCommand implements UCommand{
	
		@Override
		public void execute(Model model, HttpServletRequest request) {
			
		Map<String, Object> map = model.asMap();
		request = (HttpServletRequest)map.get("request");
		
		
		//
		String user_id = (String)request.getAttribute("user_id");
		
		System.out.println(user_id);
		
		
		UserDao dao = UConstant.dao;
		UserDto dto = dao.detail(user_id);
		
		model.addAttribute("dto", dto);
	}

}
