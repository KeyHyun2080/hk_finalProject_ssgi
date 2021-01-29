package com.woo.ssgi.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.NoticeDAO;
import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.dto.NoticeDTO;
import com.woo.ssgi.util.NoticeConstant;
import com.woo.ssgi.util.QNAConstant;

public class AdminNoticeListCommand implements Command{

	@Override
	public void execute(Model model) {
		NoticeDAO dao = NoticeConstant.dao;
		ArrayList<NoticeDTO> dtos = dao.AdminNoticeList();
		System.out.println("AdminNotice 컨트롤러" + dtos );
		model.addAttribute("list",dtos);
		
	}

}
