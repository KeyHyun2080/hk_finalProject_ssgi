package com.woo.ssgi.usercommand;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.UserDao;
import com.woo.ssgi.dto.UserDto;
import com.woo.ssgi.util.UConstant;



public class UserListCommand implements UCommand{

	@Override
	public void execute(Model model, HttpServletRequest request) {
		UserDao dao = UConstant.dao;
		ArrayList<UserDto> dtos = dao.UserList();
		model.addAttribute("list",dtos);		
	}

}
