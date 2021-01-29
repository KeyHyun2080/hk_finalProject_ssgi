package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.NoticeDAO;
import com.woo.ssgi.dto.NoticeDTO;
import com.woo.ssgi.util.NoticeConstant;



public class NoticeModifyCommand implements Command{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String NOTICE_NUM = request.getParameter("NOTICE_NUM");
		System.out.println("QNA 수정 진행 NOTICE_NUM 출력: " + NOTICE_NUM );
		
		NoticeDAO dao = NoticeConstant.dao;
		NoticeDTO dto = dao.NoticeModify(NOTICE_NUM);
		System.out.println(dto);
		
		model.addAttribute("dto", dto);
		
		
	}

}
