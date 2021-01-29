package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.NoticeDAO;
import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.util.NoticeConstant;
import com.woo.ssgi.util.QNAConstant;

public class NoticeDeleteCommand implements Command{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String NOTICE_NUM = request.getParameter("NOTICE_NUM");
		
		
		NoticeDAO dao = NoticeConstant.dao;
		dao.NoticeDelete(NOTICE_NUM);
	}

}
