package com.kosta.serocar.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.Advertisement;
import com.kosta.serocar.bean.Community;
import com.kosta.serocar.bean.Detail;

@Mapper
@Repository
public interface MyPageDAO {
	//커뮤니티 페이징 및 서칭
	List<Community> selectCommunityList2(HashMap<String, String> map) throws Exception;
	Integer selectCommunityCount2(String memberEmail) throws Exception;
	
	List<Advertisement> selectAdvertisementList2(HashMap<String, String> map) throws Exception;
	Integer selectAdvertisementCount2(String memberEmail) throws Exception;
	
	
}
