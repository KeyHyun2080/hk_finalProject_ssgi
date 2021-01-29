package com.woo.ssgi.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.dto.UQNADTO;
import com.woo.ssgi.util.PagingVO;
import com.woo.ssgi.util.QNAConstant;

public class QNAListCommand implements Command{

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String USER_ID = (String) request.getAttribute("USER_ID");
		
		PagingVO vo = (PagingVO) map.get("paging");
		System.out.println("kkkkkkkkkk  "+vo);
		QNADAO dao = QNAConstant.dao;
		
		ArrayList<UQNADTO> dtos = dao.QNAList(USER_ID,vo);
		
	
		
		
	}

}
