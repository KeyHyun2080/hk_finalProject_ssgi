package com.woo.ssgi.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.QNADAO;
import com.woo.ssgi.dto.SQNADTO;
import com.woo.ssgi.dto.UQNADTO;
import com.woo.ssgi.util.QNAConstant;

public class SAdminQNAAnswerCommand implements Command{

	@Override
	public void execute(Model model) {
		QNADAO dao = QNAConstant.dao;
		ArrayList<SQNADTO> dtos = dao.SAdminQNAList();
		model.addAttribute("list",dtos);
		
	}
	

}
