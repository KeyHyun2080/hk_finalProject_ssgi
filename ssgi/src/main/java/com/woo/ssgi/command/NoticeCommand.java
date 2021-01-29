package com.woo.ssgi.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.NoticeDAO;

import com.woo.ssgi.dto.NoticeDTO;
import com.woo.ssgi.util.NoticeConstant;

public class NoticeCommand implements Command{

	@Override
	public void execute(Model model) {
		
		
	NoticeDAO dao = NoticeConstant.dao;
	
	
	ArrayList<NoticeDTO> dtos = dao.NoticeList();
	
	
	System.out.println("Notice 커맨드" + dtos);
	
	
	model.addAttribute("list",dtos);
		
	}

}
