package com.woo.ssgi.dao;

import java.util.ArrayList;

import com.woo.ssgi.dto.NoticeDTO;
import com.woo.ssgi.dto.SQNADTO;
import com.woo.ssgi.dto.UQNADTO;
import com.woo.ssgi.util.PagingVO;

public interface QNAIDAO {
	
	
	//---------------------여기서 부터 U 회원 인터페이스----------------------------------------------//
	
	public int count(String USER_ID);//카운트
	
	public ArrayList<UQNADTO> QNAList(String USER_ID,PagingVO vo);
	public void QNAWrite( String USER_ID, String AU_QNA_TITLE, String AU_QNA_CONTENT);
	public void delete(String AU_QNA_NUM);
	public UQNADTO QNADetail(String AU_QNA_NUM); 
	public UQNADTO QNAModify(String AU_QNA_NUM); 
	public void QNAModifyOK( String AU_QNA_NUM, String AU_QNA_TITLE, String AU_QNA_CONTENT);
	
	//------------------------여기까지 U 회원 인터페이스---------------------------------------------//
	
	
	
	//------------------------여기서 부터 S 회원 인터페이스------------------------------------------//
	
	public int Scount(String USER_ID);
	public ArrayList<SQNADTO> SQNAList(String USER_ID,PagingVO vo);
	public void SQNAWrite( String USER_ID, String AS_QNA_TITLE, String AS_QNA_CONTENT);
	public void SDelete(String AS_QNA_NUM);
	public SQNADTO SQNADetail(String AS_QNA_NUM); 
	public SQNADTO SQNAModify(String AS_QNA_NUM); 
	public void SQNAModifyOK( String AS_QNA_NUM, String AS_QNA_TITLE, String AS_QNA_CONTENT);
	
	//------------------------여기서 까지 S 회원 인터페이스------------------------------------------//
	
	
	
	
	//------------------------여기서 부터 Admin S 판매자 인터페이스------------------------------------------//
	
	public ArrayList<SQNADTO> SAdminQNAList();
	public SQNADTO SAdminQNAWrite(String AU_QNA_NUM); 
	public void SAdminQNAWriteOK(String AS_QNA_NUM, String AS_QNA_READ, String AS_QNA_ANSWER);
	public int SOKCheck(String AS_QNA_READ);

	//------------------------여기 까지 Admin S 판매자 인터페이스--------------------------------------------//
	
	
	
	
	//------------------------여기서 부터 Admin U 판매자 인터페이스------------------------------------------//
	
	public ArrayList<UQNADTO> UAdminQNAList();
	public UQNADTO UAdminQNAWrite(String AU_QNA_NUM); 
	public void UAdminQNAWriteOK(String AU_QNA_NUM, String AU_QNA_READ, String AU_QNA_ANSWER);
	public int UOKCheck(String AU_QNA_READ);

	//------------------------여기 까지 Admin U 판매자 인터페이스--------------------------------------------//
		
	
	
}
