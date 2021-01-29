package com.woo.ssgi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.dto.UQNADTO;
import com.woo.ssgi.util.QNAConstant;

public class QNAWriteCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		UQNADTO dto = (UQNADTO)map.get("dto");
		
		
	
		
		System.out.println(dto);
		
		QNADAO dao = QNAConstant.dao;
		dao.QNAWrite(dto.getUSER_ID(),dto.getAU_QNA_TITLE(),dto.getAU_QNA_CONTENT());
		
	}
	

}
