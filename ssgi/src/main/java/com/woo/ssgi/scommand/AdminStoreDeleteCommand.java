package com.woo.ssgi.scommand;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.StDao;
import com.woo.ssgi.util.SSConstant;



public class AdminStoreDeleteCommand implements SCommand{

	@Override
	public void execute(Model model) {
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest)map.get("request");
			
			String store_seq = request.getParameter("store_seq");
			
			
			StDao stDao = SSConstant.stDao;
			stDao.AdminStoreDelete(store_seq);
	}
}
