package com.woo.ssgi.dao;

import java.util.ArrayList;

import com.woo.ssgi.dto.NoticeDTO;
import com.woo.ssgi.dto.SQNADTO;
import com.woo.ssgi.dto.UQNADTO;

public interface NoticeIDAO {
		//------------------------여기서 부터 Admin Notice 관리페이지------------------------------------------//
	
	
		public ArrayList<NoticeDTO> AdminNoticeList();
		public void AdminNoticeWrite(  String NOTICE_TITLE, String NOTICE_NAME , String NOTICE_CONTENT);
		public void NoticeDelete(String NOTICE_NUM);
		public NoticeDTO AdminNoticeDetail(String NOTICE_NUM); 
		public NoticeDTO NoticeModify(String NOTICE_NUM); 
		public void NoticeModifyOK( String NOTICE_NUM, String NOTICE_TITLE, String NOTICE_CONTENT);
		//------------------------여기서 부터 Admin Notice 관리페이지------------------------------------------//
		//------------------------여기서 부터 일반 Notice 관리 페이지--------------------------------------------//
		
		public ArrayList<NoticeDTO> NoticeList();
		public NoticeDTO NoticeDetail(String NOTICE_NUM);
		
		
		
		//------------------------여기 까지 일반 Notice 관리 페이지---------------------------------------------// 
}
