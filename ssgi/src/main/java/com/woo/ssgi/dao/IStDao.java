package com.woo.ssgi.dao;

import java.util.ArrayList;
import java.util.List;

import com.woo.ssgi.dto.StoreDto;

public interface IStDao {
	public List<StoreDto> storeList();
	
	public int addStorePro(String user_id, String store_name, String store_owner, String store_intro, String store_ph, String store_addr, String store_addr2, String store_open, String store_close, String store_state, String t24h
			, String store_category, String store_bank, String store_account, String s_license_b_img, String s_license_s_img, String s_license_num, String s_admin_state, String s_agreement);
	
	public void addStoreImage(int store_seq, int store_img_seq, String store_image);
	
	public List<StoreDto> storeDetail(String store_seq);
	//어드민이 리스트 보기
	public ArrayList<StoreDto> AdminStoreList();
	//어드민이 상점 삭제
	public void AdminStoreDelete(String store_seq);
	//어드민이 상점상태 변경시키김
	public void AdminStoreUpdate(String store_seq, String s_admin_state);
}
