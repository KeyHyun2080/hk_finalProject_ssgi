package com.woo.ssgi.sec;


import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.woo.ssgi.dao.UserDao;
import com.woo.ssgi.dto.UserDto;
import com.woo.ssgi.util.UConstant;



//사용자정의 데이터를 정의하는 인터페이스를 구현한 클래스로 사용자가 입력한 username을 받아서 인증을 처리
public class CustomUserDetailsService implements UserDetailsService{
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
		UserDao dao = UConstant.dao;
		UserDto dto = dao.login(username);
		
		if(dto == null) {
			System.out.println("dto is null");
			throw new UsernameNotFoundException("no user found with username");
		}
		System.out.println("dao is null");
		String pw = dto.getUser_pw();
		
		
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		//회원등급을 저장할 List 객체를 만듬, 회원디비에 등급을 추가하여 그값을 사용.
		
		roles.add(new SimpleGrantedAuthority("ROLE_"+dto.getUser_role()));

		
		UserDetails user = new User(username,pw,roles);
		//입력한 username 과 디비에서 얻은 패스워드 등급을 이용한 사용자 정보 객체(UserDetails user객체)를 만듬
		
		
		
		return user;
		//등급은 ROLE_SUPERVISOR ,ROLE_USER, ROLE_TELLER, ROLE_ADMIN 
		
	}

}