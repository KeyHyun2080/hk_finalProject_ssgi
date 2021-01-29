package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.util.QNAConstant;

public class UAdminAnswerWriteOKCommand implements Command{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String AU_QNA_NUM = request.getParameter("AU_QNA_NUM");
		String AU_QNA_READ = request.getParameter("AU_QNA_READ");
		String AU_QNA_ANSWER = request.getParameter("AU_QNA_ANSWER");
		
		
		System.out.println("QNA 수정 시작");
		System.out.println("AU_QNA_NUM: " + AU_QNA_NUM);
		System.out.println("AU_QNA_READ: " + AU_QNA_READ);
		System.out.println("AU_QNA_ANSWER: " + AU_QNA_ANSWER);
		
		QNADAO dao = QNAConstant.dao;
		dao.UAdminQNAWriteOK(AU_QNA_NUM,AU_QNA_READ,AU_QNA_ANSWER);
		
	}

}
