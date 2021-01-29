package com.woo.ssgi.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.woo.ssgi.dto.NoticeDTO;
import com.woo.ssgi.dto.SQNADTO;
import com.woo.ssgi.dto.UQNADTO;
import com.woo.ssgi.util.PagingVO;
import com.woo.ssgi.util.QNAConstant;

public class QNADAO implements QNAIDAO {
	


	@Autowired
	private SqlSession sqlSession; //field autowired

	
	//----------------------------------여기서 부터 일반 U 회원 DAO 영역----------------------------------//
	//QNA  메인 리스트 
	public ArrayList<UQNADTO> QNAList(String USER_ID,PagingVO vo) {

		Map<String , Object> map = new HashMap<String, Object>();
		
		
		map.put("USER_ID", USER_ID);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		
		ArrayList<UQNADTO> result = (ArrayList) sqlSession.selectList("com.woo.ssgi.dao.QNAIDAO.list", map);
		System.out.println("리스트 출력");
		return result;
	}
	
	
	//전체
	@Override
	public int count(String USER_ID) {
		
		System.out.println("USER_ID :" +  USER_ID);
		
		return sqlSession.selectOne("com.woo.ssgi.dao.QNAIDAO.count",USER_ID);
		
		
	}
	
	
	@Override
	public int Scount(String USER_ID) {
		
		return sqlSession.selectOne("SQNAIDAO.Scount",USER_ID);
		
		
	}
	
	//QNA 문의글 작성
	public void QNAWrite(String USER_ID, String AU_QNA_TITLE, String AU_QNA_CONTENT) {
		UQNADTO dto = new UQNADTO(0,AU_QNA_TITLE, AU_QNA_CONTENT, USER_ID, null, null, null,null);
		System.out.println("QNA작성중");
		sqlSession.insert("QNAWrite",dto);		
	}
	
	//QNA 문의글 삭제
	public void delete(String AU_QNA_NUM) {
		System.out.println("QNA삭제 완료");
		sqlSession.selectOne("QNADelete", Integer.parseInt(AU_QNA_NUM));	
	}
	
	//QNA 상세보기 
	public UQNADTO QNADetail(String AU_QNA_NUM) {
		System.out.println("출력: " + AU_QNA_NUM);
		return sqlSession.selectOne("QNADetail",Integer.parseInt(AU_QNA_NUM));
	}
	
	//QNA 수정페이지 
	@Override
	public UQNADTO QNAModify(String AU_QNA_NUM) {
		System.out.println("출력: " + AU_QNA_NUM);
		return sqlSession.selectOne("QNAModify",Integer.parseInt(AU_QNA_NUM));
	}
	
	//QNA 수정 완료 
	public void QNAModifyOK(String AU_QNA_NUM, String AU_QNA_TITLE, String AU_QNA_CONTENT) {
		System.out.println("수정 : " +  AU_QNA_NUM);
		System.out.println("수정 : " +  AU_QNA_TITLE);
		System.out.println("수정 : " +  AU_QNA_CONTENT);
		UQNADTO dto = new UQNADTO(Integer.parseInt(AU_QNA_NUM),AU_QNA_TITLE,AU_QNA_CONTENT,null,null,null,null,null);
		sqlSession.update("QNAModifyOK", dto);
		
		
		
	}
	
	//----------------------------------여기까지 일반 U 회원 DAO 영역----------------------------------//
	
	
	
	//----------------------------------여기서 부터는 판매자 S  DAO 영역-------------------------------//
		
	
		//SQNA  메인 리스트
		public ArrayList<SQNADTO> SQNAList(String USER_ID,PagingVO vo) {
			Map<String , Object> map = new HashMap<String, Object>();
			
			
			map.put("USER_ID", USER_ID);
			map.put("start", vo.getStart());
			map.put("end", vo.getEnd());
			
			ArrayList<SQNADTO> result = (ArrayList) sqlSession.selectList("SQNAIDAO.list",map);
			System.out.println("S리스트 출력");
			return result;
		}
		
		//SQNA 문의글 작성
		public void SQNAWrite(String USER_ID, String AS_QNA_TITLE, String AS_QNA_CONTENT) {
			SQNADTO dto = new SQNADTO(0 ,AS_QNA_CONTENT, AS_QNA_TITLE,USER_ID, null, null, null,null);
			System.out.println("SQNA작성중");
			sqlSession.insert("SQNAWrite",dto);		
		}
		
		//QNA 문의글 삭제
		public void SDelete(String AS_QNA_NUM) {
			System.out.println("SQNA삭제 완료");
			sqlSession.selectOne("SQNADelete", Integer.parseInt(AS_QNA_NUM));	
			
		}
		
		//QNA 상세보기 
		public SQNADTO SQNADetail(String AS_QNA_NUM) {
			System.out.println("출력: " + AS_QNA_NUM);
			return sqlSession.selectOne("SQNADetail",Integer.parseInt(AS_QNA_NUM));
		}
		//QNA 수정페이지 
		public SQNADTO SQNAModify(String AS_QNA_NUM) {
			System.out.println("출력: " + AS_QNA_NUM);
			return sqlSession.selectOne("SQNAModify",Integer.parseInt(AS_QNA_NUM));
		}
		
		//QNA 수정 완료 
		public void SQNAModifyOK(String AS_QNA_NUM, String AS_QNA_TITLE, String AS_QNA_CONTENT) {
			System.out.println("수정 : " +  AS_QNA_NUM);
			System.out.println("수정 : " +  AS_QNA_TITLE);
			System.out.println("수정 : " +  AS_QNA_CONTENT);
			SQNADTO dto = new SQNADTO(Integer.parseInt(AS_QNA_NUM),AS_QNA_TITLE,AS_QNA_CONTENT,null,null,null,null,null);
			sqlSession.update("SQNAModifyOK", dto);
			
		}
		
		//----------------------------------여기 까지 판매자 S  DAO 영역----------------------------------//
		
		//--------------------여기서 부터  관리자 Admin S QNA 관리 ------------------------------------------//
		//SQNA 리스트 페이지 출력
		public ArrayList<SQNADTO> SAdminQNAList() {
			ArrayList<SQNADTO> result = (ArrayList) sqlSession.selectList("SAdminQNAIDAO.list");
			System.out.println("Admin S QNA 리스트 출력");
			return result;
		}
		
		//SQNA 답변 페이지 출력
		public SQNADTO SAdminQNAWrite(String AS_QNA_NUM) {
			System.out.println("Admin답변페이지출력: " + AS_QNA_NUM);
			return sqlSession.selectOne("SAdminQNAWrite",Integer.parseInt(AS_QNA_NUM));
		}
		
		//SQNA 답변 입력
		public void SAdminQNAWriteOK(String AS_QNA_NUM, String AS_QNA_READ, String AS_QNA_ANSWER) {
			System.out.println("수정 : " +  AS_QNA_NUM);
			System.out.println("수정 : " +  AS_QNA_ANSWER);
			System.out.println("수정 : " +  AS_QNA_READ);
			SQNADTO dto = new SQNADTO(Integer.parseInt(AS_QNA_NUM),null,null,null,AS_QNA_ANSWER,null,AS_QNA_READ,null);
			sqlSession.update("SAdminQNAWriteOK", dto);
		}
		
		//---------------------------------여기까지 관리자 Admin S QNA 관리-------------------------------------------------//
		
		
		
		
		//--------------------여기서 부터  관리자 Admin U QNA 관리 -----------------------------------------------------------//
		
		//UQNA 리스트 페이지 출력
		public ArrayList<UQNADTO> UAdminQNAList() {
			ArrayList<UQNADTO> result = (ArrayList) sqlSession.selectList("UAdminQNAIDAO.list");
			System.out.println("Admin U QNA 리스트 출력");
			return result;
		}
		public UQNADTO UAdminQNAWrite(String AU_QNA_NUM) {
			System.out.println("Admin답변페이지출력: " + AU_QNA_NUM);
			return sqlSession.selectOne("UAdminQNAWrite",Integer.parseInt(AU_QNA_NUM));
		}
		
		//답변완료
		public void UAdminQNAWriteOK(String AU_QNA_NUM, String AU_QNA_READ, String AU_QNA_ANSWER) {
			System.out.println("AU_QNA_NUM수정 : " +  AU_QNA_NUM);
			System.out.println("AU_QNA_ANSWER수정 : " +  AU_QNA_ANSWER);
			System.out.println("AU_QNA_READ수정 : " +  AU_QNA_READ);
			UQNADTO dto = new UQNADTO(Integer.parseInt(AU_QNA_NUM),null,null,null,AU_QNA_ANSWER,null,AU_QNA_READ,null);
			sqlSession.update("UAdminQNAWriteOK", dto);
			
		}
		//'답변완료'일치 체크
		public int SOKCheck(String AS_QNA_READ) {
			int result = sqlSession.selectOne("SAdminOK", AS_QNA_READ);
			return result;
			
		}
		
		
		//--------------------여기 까지 관리자 Admin U QNA 관리 -------------------------------------------//
		
		//--------------------여기서 부터 관리자 Admin 공지사항 Noitce 관리 -------------------------------------------//
		
		//Admin Notice 리스트 출력
		public ArrayList<NoticeDTO> AdminNoticeList() {
			ArrayList<NoticeDTO> result = (ArrayList) sqlSession.selectList("AdminNotice.list");
			System.out.println("Admin Notice 리스트 출력");
			return result;
		}
		
		
		//답변완료 비교 
		public int UOKCheck(String AU_QNA_READ) {
			int result = sqlSession.selectOne("UAdminOK", AU_QNA_READ);
			return result;
		}
		
		
	

	

}
