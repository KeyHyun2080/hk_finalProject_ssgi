package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.util.QNAConstant;

public class QNAModifyOKCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		String AU_QNA_NUM = request.getParameter("AU_QNA_NUM");
		String AU_QNA_TITLE = request.getParameter("AU_QNA_TITLE");
		String AU_QNA_CONTENT = request.getParameter("AU_QNA_CONTENT");
		
		
		
		System.out.println("QNA 수정 시작");
		System.out.println("AU_QNA_NUM: " + AU_QNA_NUM);
		System.out.println("AU_QNA_TITLE: " + AU_QNA_TITLE);
		System.out.println("AU_QNA_CONTENT: " + AU_QNA_CONTENT);
		QNADAO dao = QNAConstant.dao;
		dao.QNAModifyOK(AU_QNA_NUM,AU_QNA_TITLE,AU_QNA_CONTENT);
	}

}
