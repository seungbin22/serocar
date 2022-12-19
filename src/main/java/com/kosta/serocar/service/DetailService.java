package com.kosta.serocar.service;

import java.util.List;

import com.kosta.serocar.bean.Detail;
import com.kosta.serocar.bean.PageInfo;

public interface DetailService {
	List<Detail> getCarList(int page,String keyword, String carBrand,String carType,Integer minMoney,Integer maxMoney,PageInfo pageInfo) ;
	
	int findLike(int carNum , String memberEmail);
	   void likeUp(int carNum , String memberEmail , int carLikeN);
	   void likeDown(int carNum , String memberEmail, int carLikeN);

	   /* void hit(int carNum); */
	   int getLike(int carNum,int carLikeN);
	}