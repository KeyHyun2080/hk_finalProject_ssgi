package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.dto.UQNADTO;
import com.woo.ssgi.util.QNAConstant;

public class QNADetailCommand implements Command{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String AU_QNA_NUM = request.getParameter("AU_QNA_NUM");
		System.out.println("AU_QNA_NUM출력: " + AU_QNA_NUM );
		
		QNADAO dao = QNAConstant.dao;
		UQNADTO dto = dao.QNADetail(AU_QNA_NUM);
		System.out.println(dto);
		
		model.addAttribute("dto", dto);
		
	}

}
