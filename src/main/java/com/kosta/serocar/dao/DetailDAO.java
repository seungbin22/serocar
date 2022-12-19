package com.kosta.serocar.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.Detail;

@Mapper
@Repository
public interface DetailDAO {
	List<Detail> selectCarList(HashMap<String, String> map) ;
	Integer selectCarCount() ;
	
	List<Detail> selectCarList2(HashMap<String, String> map) ;
	Integer selectCarKeywordCount(String keyword) ;
	
	List<Detail> selectCarBrandList(HashMap<String, String> map) ;
	Integer selectCarBrandCount(String carBrand) ;
	
	List<Detail> selectCarTypeList(HashMap<String, String> map) ;
	Integer selectCarTypeCount(String carType) ;
	
	List<Detail> selectCarMoneyList(HashMap<String, String> map1) ;
	Integer selectCarMoneyCount(HashMap<String, String> map2) ;
	
	int findLike(Map<String, Object> data);
	   void likeUp(Map<String, Object> data);
	   void likeDown(Map<String, Object> data);
	   int getLike(Map<String, Object> data);
	   /* void hit(int carNum); */

}
