package com.kosta.serocar.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.Advertisement;

@Mapper
@Repository
public interface AdvertisementDAO {
	void insertAdvertisement(Advertisement advertisement) throws Exception;
	Integer selectMaxAdvertisementNum() throws Exception;
	//커뮤니티 페이징 및 서칭
	List<Advertisement> selectAdvertisementList(Integer row) throws Exception;
	List<Advertisement> selectAdvertisementList2(HashMap<String, String> map) throws Exception;
	Integer selectAdvertisementCount() throws Exception;
	Integer selectAdvertisementCount2(String keyword) throws Exception;
	
	//상세 게시물
	Advertisement selectAdvertisement(Integer ad_num) throws Exception;
	//게시글 수정
	void updateAdvertisement(Advertisement advertisement) throws Exception;
	//게시글 삭제
	void deleteAdvertisement(Integer ad_num) throws Exception;
	void hit(int ad_num);
}
