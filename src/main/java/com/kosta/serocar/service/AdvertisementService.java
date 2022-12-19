package com.kosta.serocar.service;

import java.util.List;

import com.kosta.serocar.bean.Advertisement;
import com.kosta.serocar.bean.PageInfo;

public interface AdvertisementService  {
	void registAdvertisement(Advertisement advertisement) throws Exception;
	//커뮤니티 페이징 및 서칭
	List<Advertisement> getAdvertisementList(int page, String keyword, PageInfo pageInfo) throws Exception;
	//상세 게시물
	Advertisement getAdvertisement(Integer ad_num)throws Exception;
	//게시글 수정
	void modifyAdvertisement(Advertisement advertisement) throws Exception;
	//게시글 삭제
	void deleteAdvertisement(Integer ad_num)throws Exception;
	
	void hit(int ad_num);
}
