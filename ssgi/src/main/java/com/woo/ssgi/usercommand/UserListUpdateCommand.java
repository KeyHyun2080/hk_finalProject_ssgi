package com.woo.ssgi.usercommand;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.UserDao;
import com.woo.ssgi.util.UConstant;

public class UserListUpdateCommand implements UCommand{
	@Override
	public void execute(Model model, HttpServletRequest request) {
			Map<String, Object> map = model.asMap();
			request = (HttpServletRequest)map.get("request");
			
			String user_id = request.getParameter("user_id");
			String user_key = request.getParameter("user_key");
	
			
			System.out.println("user_id : 1" +  user_id);
			System.out.println("user_key : 2" +  user_key);
	
			UserDao dao = UConstant.dao;
			dao.UserListUpdate(user_id,user_key);
			
	}
}
