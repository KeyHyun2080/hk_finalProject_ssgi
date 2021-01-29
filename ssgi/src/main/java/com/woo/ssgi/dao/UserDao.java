package com.woo.ssgi.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;


import com.sun.org.apache.bcel.internal.generic.Select;
import com.woo.ssgi.dto.SQNADTO;
import com.woo.ssgi.dto.UQNADTO;
import com.woo.ssgi.dto.UserDto;


public class UserDao implements UserIDao{
	
	
	


	@Autowired
	private SqlSession sqlSession; //field autowired

	

	//일반회원 회원가입
	public void join(String user_id,String user_pw, String user_name, String user_addr,String user_addr2, String user_ph,String user_email) {
	
		UserDto dto = new UserDto(user_id,user_pw,user_name,user_addr,user_addr2,user_ph,null,null,null,user_email,null,null);
		sqlSession.insert("join",dto);
	}
	//사업자회원가입
	public void Sjoin(String user_id,String user_pw, String user_name, String user_addr,String user_addr2, String user_ph,String user_email) {
		
		UserDto dto = new UserDto(user_id,user_pw,user_name,user_addr,user_addr2,user_ph,null,null,null,user_email,null,null);
		sqlSession.insert("Sjoin",dto);
	}
	
	// 로그인
	public UserDto login(String user_id) {
		System.out.println("user_id"+user_id);
		UserDto ud = sqlSession.selectOne("login", user_id);
		System.out.println("ud : " + ud);
		
		//System.out.println(":dddd"+ SecurityContextHolder.getContext().getAuthentication().getCredentials());
		return ud;
	}	

	
	
	
	
	

	//아이디중복체크
	public int idChk(String user_id) {
		int result = sqlSession.selectOne("idChk", user_id);
		return result;
	}

	//인증키 보내기
	public int GetKey(String user_id, String user_key) {
		
		System.out.println("user_id : " +user_id);
		System.out.println("key : " +user_key);
		
		
		UserDto dto = new UserDto(user_id,user_key);
		return sqlSession.update("GetKey", dto);
		
		
	}

	//인증키 Y로 변경
	@Override
	public int alter_userKey(String user_id, String Key) {
	
		int resultCnt = 0;
		UserDto dto = new UserDto(user_id,Key);
		resultCnt = sqlSession.update("alter_userKey",dto );
		return resultCnt;
	}
	
	public int emailChk(String user_email) {
		int result = sqlSession.selectOne("emailChk", user_email);
		return result;
	}

	
	//회원정보보기
	public UserDto detail(String user_id) {

		
		return sqlSession.selectOne("userDetail",user_id);
	}
	
	//회원정보수정 View
	public UserDto modify(String user_id) {
	
		return sqlSession.selectOne("userModify",user_id);
	}
	//회원정보수정하기 
	public void modifyOk(String user_id,String user_pw,String user_addr,String user_addr2,String user_ph ) {
		UserDto dto = new UserDto(user_id,user_pw,null,user_addr,user_addr2,user_ph,null,null,null,null,null,null);
		sqlSession.update("modifyOk", dto);
	}
	
	//회원탈퇴
	public void delete(String user_id) {
		sqlSession.selectOne("delete",user_id);
	}
	public ArrayList<UserDto> UserList() {
		ArrayList<UserDto> result = (ArrayList) sqlSession.selectList("UserList");
		System.out.println("유저리스트 리스트 출력");
		return result;
	}
	public void UserListDelete(String user_id) {
		System.out.println("유저삭제 삭제");
		sqlSession.selectOne("UserListDelete", user_id);	
		
		
	}
	public void UserListUpdate(String user_id,String user_key) {
		
		
		
		Map<String , String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("user_key", user_key);
		
		System.out.println("user_id : " +  user_id);
		System.out.println("user_key : " +  user_key);
		
		System.out.println("유저상태  변경");
		sqlSession.selectOne("UserListUpdate", map);
		
	}




}
