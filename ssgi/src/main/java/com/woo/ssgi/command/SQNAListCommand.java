package com.woo.ssgi.command;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.sun.jmx.snmp.Timestamp;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.dto.SQNADTO;
import com.woo.ssgi.dto.UQNADTO;
import com.woo.ssgi.util.PagingVO;
import com.woo.ssgi.util.QNAConstant;

public class SQNAListCommand implements Command{

	@Override
	public void execute(Model model) {
		
		
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String USER_ID = (String) request.getAttribute("USER_ID");
		PagingVO vo = (PagingVO) map.get("paging");
		System.out.println("kkkkkkkkkk  "+vo);
		QNADAO dao = QNAConstant.dao;
	
		ArrayList<SQNADTO> dtos = dao.SQNAList(USER_ID,vo);
		
		
		
		
	
		
		
		
	}

}
