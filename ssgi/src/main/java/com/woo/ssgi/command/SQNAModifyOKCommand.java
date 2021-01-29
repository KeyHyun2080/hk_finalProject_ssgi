package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.util.QNAConstant;

public class SQNAModifyOKCommand implements Command{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String AS_QNA_NUM = request.getParameter("AS_QNA_NUM");
		String AS_QNA_TITLE = request.getParameter("AS_QNA_TITLE");
		String AS_QNA_CONTENT = request.getParameter("AS_QNA_CONTENT");
		
		System.out.println("QNA 수정 시작");
		System.out.println("AS_QNA_NUM: " + AS_QNA_NUM);
		System.out.println("AS_QNA_TITLE: " + AS_QNA_TITLE);
		System.out.println("AS_QNA_CONTENT: " + AS_QNA_CONTENT);
		
		QNADAO dao = QNAConstant.dao;
		dao.SQNAModifyOK(AS_QNA_NUM,AS_QNA_TITLE,AS_QNA_CONTENT);
		
	}

}
