package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.util.QNAConstant;

public class SQNAWriteCommand implements  Command{
	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String USER_ID = request.getParameter("USER_ID");
		String AS_QNA_TITLE = request.getParameter("AS_QNA_TITLE");
		String AS_QNA_CONTENT = request.getParameter("AS_QNA_CONTENT");
		String AS_QNA_DATE = request.getParameter("AS_QNA_DATE");
		
		System.out.println(USER_ID);
		System.out.println(AS_QNA_TITLE);
		System.out.println(AS_QNA_CONTENT);
		System.out.println("as : " +AS_QNA_DATE);
		
		QNADAO dao = QNAConstant.dao;
		dao.SQNAWrite(USER_ID,AS_QNA_TITLE,AS_QNA_CONTENT);
		
	}
}
