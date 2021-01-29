package com.woo.ssgi.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.woo.ssgi.dto.StoreDto;
import com.woo.ssgi.dto.StoreImgDto;

public class StDao implements IStDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<StoreDto> storeList() {
		List<StoreDto> result = sqlSession.selectList("ssdm.storeList");
		System.out.println("storeList:)");
		return result;
	}
	
	public int addStorePro(String user_id,  String store_name, String store_owner, String store_intro, String store_ph, String store_addr, String store_addr2, String store_open, String store_close, String store_state, String t24h
			, String store_category, String store_bank, String store_account, String s_license_b_img, String s_license_s_img, String s_license_num, String s_admin_state, String s_agreement) {
		StoreDto stDto = new StoreDto(user_id, 0, store_name, store_owner, store_intro, store_ph, store_addr,store_addr2, store_open, store_close, store_state, t24h
				, store_category, store_bank, store_account, s_license_b_img, s_license_s_img, s_license_num, s_admin_state, s_agreement);
			
		System.out.println("user_id"+ user_id);
		sqlSession.insert("ssdm.addStorePro", stDto);
		return stDto.getStore_seq();
	}
	
	public void addStoreImage(int store_seq, int store_img_seq, String store_image) {
		StoreImgDto stIDto = new StoreImgDto(store_seq, store_img_seq, store_image);
		sqlSession.insert("ssdm.addStoreImage", stIDto);
	}
	
	public List<StoreDto> storeDetail(String store_seq) {
		//return sqlSession.selectOne("ssdm.storeDetail", Integer.parseInt(store_seq));
		
		List<StoreDto> result =  sqlSession.selectList("ssdm.storeDetail", store_seq);
		return result;
		
	}

	public ArrayList<StoreDto> AdminStoreList() {
		ArrayList<StoreDto> result =  (ArrayList) sqlSession.selectList("ssdm.AdminStoreList");
		System.out.println("어드민용 상점 리스트 출력");
		return result;
	}

	public void AdminStoreDelete(String store_seq) {
		System.out.println("유저삭제 삭제");
		sqlSession.selectOne("AdminStoreDelete", store_seq);
		
	}

	public void AdminStoreUpdate(String store_seq, String s_admin_state) {
		Map<String , String> map = new HashMap<String, String>();
		map.put("store_seq", store_seq);
		map.put("s_admin_state", s_admin_state);
		
		System.out.println("user_id : " +  store_seq);
		System.out.println("s_admin_state : " +  s_admin_state);
		
		System.out.println("유저상태  변경");
		sqlSession.selectOne("AdminStoreUpdate", map);
		
	}
}
