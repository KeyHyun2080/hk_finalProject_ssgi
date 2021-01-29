package com.woo.ssgi.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.woo.ssgi.dto.NoticeDTO;
import com.woo.ssgi.dto.SQNADTO;
import com.woo.ssgi.dto.UQNADTO;

public class NoticeDAO implements NoticeIDAO{

	
	@Autowired
	private SqlSession sqlSession; //field autowired
	//관리자 공지사항 페이지
	@Override
	public ArrayList<NoticeDTO> AdminNoticeList() {
		ArrayList<NoticeDTO> result = (ArrayList) sqlSession.selectList("NoticeIDAO.AdminList");
		System.out.println("Admin Notice 공지사항 리스트 출력");
		System.out.println(result);
		return result;
	}
	//관리자 공지사항 작성
	public void AdminNoticeWrite(String NOTICE_TITLE, String NOTICE_NAME, String NOTICE_CONTENT) {
		NoticeDTO dto = new NoticeDTO(0, NOTICE_TITLE, NOTICE_NAME, NOTICE_CONTENT,null);
		System.out.println("AdminNotice 작성 중 ");
		sqlSession.insert("NoticeWrite",dto);	
		
	}
	//일반 공지사항 페이지
	public ArrayList<NoticeDTO> NoticeList() {
		ArrayList<NoticeDTO> result = (ArrayList) sqlSession.selectList("NoticeIDAO.NomalList");
		System.out.println("일반 Notice 공지사항 리스트 출력");
		System.out.println(result);
		return result;
	}
	//관리자 공지사항 삭제
	public void NoticeDelete(String NOTICE_NUM) {
		System.out.println("notice 삭제 완료");
		sqlSession.selectOne("NoticeDelete", Integer.parseInt(NOTICE_NUM));	
		
	}
	//공지사항 수정페이지 (관리자 권한)
	public NoticeDTO NoticeModify(String NOTICE_NUM) {
		System.out.println("공지사항 수정페이지 출력: " + NOTICE_NUM);
		return sqlSession.selectOne("NoticeModify",Integer.parseInt(NOTICE_NUM));
	}	
		
	//관리자 공지사항 상세보기 페이지
	public NoticeDTO AdminNoticeDetail(String NOTICE_NUM) {
		System.out.println("관리자 공지사항 상세보기: " + NOTICE_NUM);
		return sqlSession.selectOne("AdminNoticeDetail",Integer.parseInt(NOTICE_NUM));
	}
	//공지사항 상세보기 페이지 
	public NoticeDTO NoticeDetail(String NOTICE_NUM) {
		System.out.println("공지사항 상세보기: " + NOTICE_NUM);
		return sqlSession.selectOne("NoticeDetail",Integer.parseInt(NOTICE_NUM));
	}
	
	//공지사항 수정완료(관리자 권한)
	public void NoticeModifyOK(String NOTICE_NUM, String NOTICE_TITLE, String NOTICE_CONTENT) {
		System.out.println("수정 : " +  NOTICE_NUM);
		System.out.println("수정 : " +  NOTICE_TITLE);
		System.out.println("수정 : " +  NOTICE_CONTENT);
		NoticeDTO dto = new NoticeDTO(Integer.parseInt(NOTICE_NUM),NOTICE_TITLE,null,NOTICE_CONTENT,null);
		sqlSession.update("NoticeModifyOK", dto);
			
	}
	
	
	
}
