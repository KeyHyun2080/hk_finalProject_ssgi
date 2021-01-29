package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.NoticeDAO;
import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.util.NoticeConstant;
import com.woo.ssgi.util.QNAConstant;

public class NoticeModifyOKCommand implements Command{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		String NOTICE_NUM = request.getParameter("NOTICE_NUM");
		String NOTICE_TITLE = request.getParameter("NOTICE_TITLE");
		String NOTICE_CONTENT = request.getParameter("NOTICE_CONTENT");
		
		
		
		System.out.println("QNA 수정 시작");
		System.out.println("NOTICE_NUM: " + NOTICE_NUM);
		System.out.println("NOTICE_TITLE: " + NOTICE_TITLE);
		System.out.println("NOTICE_CONTENT: " + NOTICE_CONTENT);
		
		NoticeDAO dao = NoticeConstant.dao;
		dao.NoticeModifyOK(NOTICE_NUM,NOTICE_TITLE,NOTICE_CONTENT);
		
	}

}
