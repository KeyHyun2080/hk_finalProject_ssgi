package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.NoticeDAO;
import com.woo.ssgi.dto.NoticeDTO;
import com.woo.ssgi.util.NoticeConstant;


public class AdminNoticeWriteCommand implements Command{

	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		NoticeDTO dto=(NoticeDTO)map.get("dto");
		
		
		
		
		System.out.println(dto);
		
	
		
		
	
		NoticeDAO dao = NoticeConstant.dao;
		dao.AdminNoticeWrite(dto.getNOTICE_TITLE(),dto.getNOTICE_NAME(),dto.getNOTICE_CONTENT());
		
	}

}
