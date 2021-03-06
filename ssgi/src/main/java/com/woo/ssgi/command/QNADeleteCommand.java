package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.util.QNAConstant;

public class QNADeleteCommand implements Command{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String AU_QNA_NUM = request.getParameter("AU_QNA_NUM");
		
		
		QNADAO dao = QNAConstant.dao;
		dao.delete(AU_QNA_NUM);
	}

}
