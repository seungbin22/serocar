package com.kosta.serocar.service;

import java.util.List;

import com.kosta.serocar.bean.Advertisement;
import com.kosta.serocar.bean.Community;
import com.kosta.serocar.bean.PageInfo;

public interface MyPageService {
	// 커뮤니티 페이징 및 서칭
	List<Community> getCommunityList(int page, String memberEmail, PageInfo pageInfo) throws Exception;

	// 홍보글 페이징 및 서칭
	List<Advertisement> getAdvertisementList(int page, String memberEmail, PageInfo pageInfo) throws Exception;

	// 게시글 삭제
	void deleteMyPage(Integer comNum) throws Exception;
}
