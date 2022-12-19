package com.kosta.serocar.service;

import java.util.List;

import com.kosta.serocar.bean.Community;
import com.kosta.serocar.bean.PageInfo;

public interface CommunityService  {
	void registCommunity(Community community) throws Exception;
	//커뮤니티 페이징 및 서칭
	List<Community> getCommunityList(int page, String keyword, PageInfo pageInfo) throws Exception;
	//상세 게시물
	Community getCommunity(Integer comNum)throws Exception;
	//게시글 수정
	void modifyCommunity(Community community) throws Exception;
	//게시글 삭제
	void deleteCommunity(Integer comNum)throws Exception;
	
	int findLike(int comNum , String memberEmail);
	void likeUp(int comNum , String memberEmail , int likeN);
	void likeDown(int comNum , String memberEmail,int likeN);
	void hit(int comNum);
	int getLike(int comNum,int likeN);
}
