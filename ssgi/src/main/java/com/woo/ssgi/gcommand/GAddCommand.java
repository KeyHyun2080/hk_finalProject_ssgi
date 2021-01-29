package com.woo.ssgi.gcommand;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.woo.ssgi.dao.GoodsDao;
import com.woo.ssgi.dto.GoodsImageDto;
import com.woo.ssgi.util.GConstant;

public class GAddCommand implements GCommand {
	
	@Override
	public void execute(Model model) {
		//상품정보 전송
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("mpRequest");
		
		String user_id = request.getParameter("user_id");
		String goods_num = request.getParameter("goods_num");
		String goods_name = request.getParameter("goods_name");
		int goods_price = Integer.parseInt(request.getParameter("goods_price"));
		String goods_content = request.getParameter("goods_content");
		int qty = Integer.parseInt(request.getParameter("qty"));
		String g_category = request.getParameter("g_category");
		
		GoodsDao gDao = GConstant.gDao;
		gDao.addGoodsPro(user_id, goods_num, goods_name, goods_price, goods_content, qty, g_category);
		
		
		//이미지 전송 어휴
		List<GoodsImageDto> gImgDto = new ArrayList<GoodsImageDto>(); 
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) request; 
		List<MultipartFile> fileList = mpRequest.getFiles("goods_image");
		
		for(MultipartFile mpf : fileList) {
			String originalFileName = mpf.getOriginalFilename();
			long fileSize = mpf.getSize();
			System.out.println("originalFileName : " + originalFileName);
			System.out.println("fileSize : " + fileSize);
			
			String path = request.getSession().getServletContext().getRealPath("upload");
			String safeFile = path + "/" + originalFileName;
			System.out.println("safeFile :: " + safeFile);
			System.out.println("path :: " + path);
			
			try {
				mpf.transferTo(new File(safeFile));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			gDao.addGoodsImage(goods_num, 0, originalFileName);
			
			
		}
		
		
		
		
		
		
	}
}
