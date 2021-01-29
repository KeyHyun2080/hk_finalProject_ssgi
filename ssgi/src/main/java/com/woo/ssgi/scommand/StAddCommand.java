package com.woo.ssgi.scommand;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.woo.ssgi.dao.StDao;
import com.woo.ssgi.dto.StoreImgDto;
import com.woo.ssgi.util.SSConstant;

public class StAddCommand implements SCommand {
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("mpRequest");
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
		
		String user_id = request.getParameter("user_id");
		String store_name = request.getParameter("store_name");
		String store_owner = request.getParameter("store_owner");
		String store_intro = request.getParameter("store_intro");
		String store_ph = request.getParameter("store_ph");
		String store_addr = request.getParameter("store_addr");
		String store_addr2 = request.getParameter("store_addr2");
		String store_open = request.getParameter("store_open");
		String store_close = request.getParameter("store_close");
		String store_state = request.getParameter("store_state");
		String t24h = request.getParameter("t24h");
		String store_category = request.getParameter("store_category");
		String store_bank = request.getParameter("store_bank");
		String store_account = request.getParameter("store_account");
		
		String s_license_b_img = request.getParameter("s_license_b_img");
		String s_license_s_img = request.getParameter("s_license_s_img");
		 
		String s_license_num = request.getParameter("s_license_num");
		String s_admin_state = request.getParameter("s_admin_state");
		String s_agreement = request.getParameter("s_agreement");
		
		System.out.println("user_id"+ user_id);
		
		MultipartFile mf = mRequest.getFile("s_license_b_img");
		String originalFileName = mf.getOriginalFilename();
		long fileSize = mf.getSize();
		String path = request.getSession().getServletContext().getRealPath("sUpload");
		String safeFile = path + "/" + originalFileName;
		try {
			mf.transferTo(new File(safeFile));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		MultipartFile mf1 = mRequest.getFile("s_license_s_img");
		String originalFileName1 = mf1.getOriginalFilename();
		long fileSize1 = mf1.getSize();
		String path1 = request.getSession().getServletContext().getRealPath("sUpload");
		String safeFile1 = path1 + "/" + originalFileName1;
		try {
			mf1.transferTo(new File(safeFile1));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		StDao stDao = SSConstant.stDao;
		int store_seq = stDao.addStorePro(user_id, store_name, store_owner, store_intro, store_ph, store_addr,store_addr2, store_open, store_close, store_state, t24h
				, store_category, store_bank, store_account, originalFileName, originalFileName1, s_license_num, s_admin_state, s_agreement);
		
		System.out.println("currval:"+store_seq);
		
		
		List<StoreImgDto> stImgDto = new ArrayList<StoreImgDto>();
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> fileList = mpRequest.getFiles("store_image");
		
		for(MultipartFile mpf : fileList) {
			String originalFileName2 = mpf.getOriginalFilename();
			long fileSize2 = mpf.getSize();
			System.out.println("originalFileName : " + originalFileName2);
			System.out.println("fileSize : " + fileSize2);
			
			String path2 = request.getSession().getServletContext().getRealPath("sUpload");
			String safeFile2 = path2 + "/" + originalFileName2;
			System.out.println("safeFile :: " + safeFile2);
			System.out.println("path :: " + path2);
			try {
				mpf.transferTo(new File(safeFile2));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			stDao.addStoreImage(store_seq, 0, originalFileName2);
		}
		
		
		
	}
}
