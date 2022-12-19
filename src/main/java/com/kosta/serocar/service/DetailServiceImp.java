package com.kosta.serocar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.serocar.bean.Detail;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.dao.DetailDAO;

@Service
public class DetailServiceImp implements DetailService {

	@Autowired
	DetailDAO detailDAO;

	@Override
	public List<Detail> getCarList(int page, String keyword, String carBrand,String carType,Integer minMoney,Integer maxMoney, PageInfo pageInfo) {
		if (keyword!=null) {
			int listCount = detailDAO.selectCarKeywordCount(keyword);
			int maxPage = (int) Math.ceil((double) listCount / 10.0); // 전체 페이지 수, 올림처리
			int startPage = page / 10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
			int endPage = startPage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
			if (endPage > maxPage)endPage = maxPage;
			System.out.println("키워드 널 값" + listCount);
			pageInfo.setPage(page);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);

			int row = (page - 1) * 10 + 1;
			String row1 = Integer.toString(row);
			System.out.println("row : " + row);
			System.out.println("key23 : " + keyword);

			HashMap<String, String> map = new HashMap<String, String>();
			map.put("row", row1);
			map.put("keyword", keyword);

			return detailDAO.selectCarList2(map);
		}else if(carBrand!=null){
			int listCount = detailDAO.selectCarBrandCount(carBrand);
			int maxPage = (int) Math.ceil((double) listCount / 10.0); // 전체 페이지 수, 올림처리
			int startPage = page / 10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
			int endPage = startPage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
			if (endPage > maxPage)endPage = maxPage;
			System.out.println("키워드 널 값123" + listCount);
			pageInfo.setPage(page);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);

			int row = (page - 1) * 10 + 1;
			String row1 = Integer.toString(row);
			System.out.println("row : " + row);
			System.out.println("carBrand23 : " + carBrand);

			HashMap<String, String> map = new HashMap<String, String>();
			map.put("row", row1);
			map.put("carBrand", carBrand);

			return detailDAO.selectCarBrandList(map);
		} else if(carType!=null){
			int listCount = detailDAO.selectCarTypeCount(carType);
			int maxPage = (int) Math.ceil((double) listCount / 10.0); // 전체 페이지 수, 올림처리
			int startPage = page / 10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
			int endPage = startPage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
			if (endPage > maxPage)endPage = maxPage;
			System.out.println("키워드 널 값123" + listCount);
			pageInfo.setPage(page);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);

			int row = (page - 1) * 10 + 1;
			String row1 = Integer.toString(row);
			System.out.println("row : " + row);
			System.out.println("type : " + carType);

			HashMap<String, String> map = new HashMap<String, String>();
			map.put("row", row1);
			map.put("carType", carType);

			return detailDAO.selectCarTypeList(map);
		}else if(minMoney!=null){
			String min = Integer.toString(minMoney);
			String max = Integer.toString(maxMoney);
			System.out.println("minMoney1 : " + minMoney);
			System.out.println("maxMoney1 : " + maxMoney);
			HashMap<String, String> map1 = new HashMap<String, String>();
			map1.put("minMoney", min);
			map1.put("maxMoney", max);

			int listCount = detailDAO.selectCarMoneyCount(map1);
			int maxPage = (int) Math.ceil((double) listCount / 10.0); // 전체 페이지 수, 올림처리
			int startPage = page / 10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
			int endPage = startPage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
			if (endPage > maxPage)endPage = maxPage;
			System.out.println("키워드 널 값123" + listCount);
			pageInfo.setPage(page);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);

			int row = (page - 1) * 10 + 1;
			String row1 = Integer.toString(row);
			
			System.out.println("row : " + row);
			System.out.println("minMoney : " + minMoney);
			System.out.println("maxMoney : " + maxMoney);

			HashMap<String, String> map2 = new HashMap<String, String>();
			map2.put("row", row1);
			map2.put("minMoney", min);
			map2.put("maxMoney", max);

			return detailDAO.selectCarMoneyList(map2);
		}else {
			int listCount = detailDAO.selectCarCount();
			int maxPage = (int) Math.ceil((double) listCount / 10.0); // 전체 페이지 수, 올림처리
			int startPage = page / 10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
			int endPage = startPage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
			if (endPage > maxPage)endPage = maxPage;
			System.out.println("else 카운트 값abc" + listCount);
			pageInfo.setPage(page);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);

			int row = (page - 1) * 10 + 1;
			String row1 = Integer.toString(row);
			System.out.println("row : " + row);
			System.out.println("key : " + keyword);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("row", row1);
			map.put("keyword", keyword);
			return detailDAO.selectCarList(map);
		}
	}

	@Override
    public int findLike(int carNum, String memberEmail) {
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("carNum", carNum);
       map.put("memberEmail", memberEmail);
       return detailDAO.findLike(map);
    }
    
    @Override
    public void likeUp(int carNum, String memberEmail , int carLikeN) {
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("carNum", carNum);
       map.put("memberEmail", memberEmail);
       map.put("carLikeN", carLikeN);
       detailDAO.likeUp(map);
    }
    @Override
    public void likeDown(int carNum, String memberEmail, int carLikeN) {
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("carNum", carNum);
       map.put("memberEmail", memberEmail);
       map.put("carLikeN", carLikeN);
       detailDAO.likeDown(map);
    }
    @Override
    public int getLike(int carNum,int carLikeN) {
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("carNum", carNum);
       map.put("carLikeN", carLikeN);
       return detailDAO.getLike(map);   
    }

    /*
     * @Override public void hit(int carNum) { detailDAO.hit(carNum); }
     */
}
