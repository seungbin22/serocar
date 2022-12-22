package com.kosta.serocar.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.Community;

@Mapper
@Repository
public interface CommunityDAO {
	void insertCommunity(Community community) throws Exception;
	Integer selectMaxCommunityNum() throws Exception;
	//커뮤니티 페이징 및 서칭
	List<Community> selectCommunityList(Integer row) throws Exception;
	List<Community> selectCommunityList2(HashMap<String, String> map) throws Exception;
	Integer selectCommunityCount() throws Exception;
	Integer selectCommunityCount2(String keyword) throws Exception;
	
	//상세 게시물
	Community selectCommunity(Integer comNum) throws Exception;
	//게시글 수정
	void updateCommunity(Community community) throws Exception;
	//게시글 삭제
	void deleteCommunity(Integer comNum) throws Exception;
	int findLike(Map<String, Object> data);
	void likeUp(Map<String, Object> data);
	void likeDown(Map<String, Object> data);
	int getLike(Map<String, Object> data);
	void hit(int comNum);
	
	public void updateComment(int comNum);
	public void updateLike(int comNum);
}
