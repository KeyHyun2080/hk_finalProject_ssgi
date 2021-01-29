package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.dto.SQNADTO;

import com.woo.ssgi.util.QNAConstant;

public class SQNAModifyCommand implements Command{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String AS_QNA_NUM = request.getParameter("AS_QNA_NUM");
		System.out.println("SQNA 수정 진행 AS_QNA_NUM 출력: " + AS_QNA_NUM );
		
		QNADAO dao = QNAConstant.dao;
		SQNADTO dto = dao.SQNAModify(AS_QNA_NUM);
		System.out.println(dto);
		
		model.addAttribute("dto", dto);
		
	}

}
