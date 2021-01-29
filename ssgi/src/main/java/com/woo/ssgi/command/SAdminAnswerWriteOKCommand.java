package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.util.QNAConstant;

public class SAdminAnswerWriteOKCommand implements Command{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String AS_QNA_NUM = request.getParameter("AS_QNA_NUM");
		String AS_QNA_READ = request.getParameter("AS_QNA_READ");
		String AS_QNA_ANSWER = request.getParameter("AS_QNA_ANSWER");
		
		
		System.out.println("QNA 수정 시작");
		System.out.println("AS_QNA_NUM: " + AS_QNA_NUM);
		System.out.println("AS_QNA_READ: " + AS_QNA_READ);
		System.out.println("AS_QNA_ANSWER: " + AS_QNA_ANSWER);
		
		QNADAO dao = QNAConstant.dao;
		dao.SAdminQNAWriteOK(AS_QNA_NUM,AS_QNA_READ,AS_QNA_ANSWER);
		
	}

}
