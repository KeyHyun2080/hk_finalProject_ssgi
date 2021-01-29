package com.woo.ssgi.dto;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserDto implements UserDetails{
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_addr;
	private String user_addr2;
	private String user_ph;
	private Timestamp user_regist;
	private String user_agree;
	private String user_gender;
	private String user_email;
	private String user_role;
	private String user_key;
	private List<String> roles;
	

	
	

	
	public List<String> getRoles() {
		return roles;
	}




	public void setRoles(List<String> roles) {
		this.roles = roles;
	}




	public UserDto() {
		super();
	}


	
	


	public UserDto(String user_id, String user_pw, String user_name, String user_addr, String user_addr2,
			String user_ph, Timestamp user_regist, String user_agree, String user_gender, String user_email,
			String user_role, String user_key) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_addr = user_addr;
		this.user_addr2 = user_addr2;
		this.user_ph = user_ph;
		this.user_regist = user_regist;
		this.user_agree = user_agree;
		this.user_gender = user_gender;
		this.user_email = user_email;
		this.user_role = user_role;
		this.user_key = user_key;
	}




	public UserDto(String user_id, String user_pw, String user_name, String user_addr, String user_addr2,
			String user_ph, Timestamp user_regist, String user_agree, String user_gender, String user_email,
			String user_role, String user_key, List<String> roles) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_addr = user_addr;
		this.user_addr2 = user_addr2;
		this.user_ph = user_ph;
		this.user_regist = user_regist;
		this.user_agree = user_agree;
		this.user_gender = user_gender;
		this.user_email = user_email;
		this.user_role = user_role;
		this.user_key = user_key;
		this.roles = roles;
	}



	
	public UserDto(String user_id, String user_key) {
		super();
		this.user_id = user_id;
		this.user_key = user_key;
	}




	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getUser_pw() {
		return user_pw;
	}



	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}



	public String getUser_name() {
		return user_name;
	}



	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}



	public String getUser_addr() {
		return user_addr;
	}



	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}



	public String getUser_addr2() {
		return user_addr2;
	}



	public void setUser_addr2(String user_addr2) {
		this.user_addr2 = user_addr2;
	}



	public String getUser_ph() {
		return user_ph;
	}



	public void setUser_ph(String user_ph) {
		this.user_ph = user_ph;
	}



	public Timestamp getUser_regist() {
		return user_regist;
	}



	public void setUser_regist(Timestamp user_regist) {
		this.user_regist = user_regist;
	}



	public String getUser_agree() {
		return user_agree;
	}



	public void setUser_agree(String user_agree) {
		this.user_agree = user_agree;
	}



	public String getUser_gender() {
		return user_gender;
	}



	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}



	public String getUser_email() {
		return user_email;
	}



	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}



	public String getUser_role() {
		return user_role;
	}



	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}



	public String getUser_key() {
		return user_key;
	}



	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}


///-------------------------------------------------------------------------

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<SimpleGrantedAuthority> grants = new ArrayList<SimpleGrantedAuthority>();
        
        for(String role : roles) {
            grants.add(new SimpleGrantedAuthority(role));
        }    
        
        return grants;
	}  



	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}




	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}




	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}




	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

	



	

	
	
	
	
	
	
	
}
