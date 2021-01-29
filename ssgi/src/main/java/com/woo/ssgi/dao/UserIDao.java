package com.woo.ssgi.dao;

import java.util.ArrayList;

import com.woo.ssgi.dto.UserDto;

public interface UserIDao {
	//회원가입
	public void join(String user_id,String user_pw, String user_name, String user_addr,String user_addr2, String user_ph,String user_email);
	//사업자 회원가입
	public void Sjoin(String user_id,String user_pw, String user_name, String user_addr,String user_addr2, String user_ph,String user_email);
	//로그인
	public UserDto login(String user_id);
	//아이디 중복체크
	public int idChk(String user_id);
	//이메일 중복체크
	public int emailChk(String user_email);
	//메일 키 값
	public int GetKey(String user_id, String user_key);
	//키 변경값
	public int alter_userKey(String user_id, String Key);
	//유저정보
	public UserDto detail(String user_id); 
	//회원정보변경view
	public UserDto modify(String user_id);
	//회원정보변경OK
	public void modifyOk(String user_id,String user_pw,String user_addr,String user_addr2,String user_ph );
	
	//회원리스트
	public ArrayList<UserDto> UserList();
	//회원강퇴 
	public void UserListDelete(String user_id);
	//회원상태변경
	public void UserListUpdate(String user_id,String user_key);
}
