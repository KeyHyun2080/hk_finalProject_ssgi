package com.woo.ssgi.scommand;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.woo.ssgi.dao.StDao;
import com.woo.ssgi.util.SSConstant;

public class AdminStoreUpdateCommand implements SCommand{

	@Override
	public void execute(Model model) {
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest)map.get("request");
			
			String store_seq = request.getParameter("store_seq");
			String s_admin_state = request.getParameter("s_admin_state");
			
			
			StDao stDao = SSConstant.stDao;
			stDao.AdminStoreUpdate(store_seq,s_admin_state);
	}
}