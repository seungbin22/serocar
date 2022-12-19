package com.kosta.serocar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.bean.Search;
import com.kosta.serocar.dao.SearchDAO;

public class SearchServiceImpl implements SearchService {
	
	@Autowired
	SearchDAO searchDAO;

	@Override
	public void registSearch(Search search) throws Exception {
		searchDAO.insertCar(search);	
	}

	@Override
	public List<Search> getSearchList(int page, PageInfo pageInfo) throws Exception {
		int listCount = searchDAO.selectSearchCount(); //전체 게시글 수
		int maxPage = (int)Math.ceil((double)listCount/10.0); //전체 페이지 수, 올림처리
		int startPage = page/10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
		int endPage = startPage + 10 -1; //현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
		if(endPage>maxPage) endPage = maxPage;
		System.out.println(listCount);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10+1;
		
		return searchDAO.selectSearchList(row);
	}

	@Override
	public List<Search> getSearchCombi(int page, PageInfo pageInfo) throws Exception {
		int listCount = searchDAO.selectSearchCount(); //전체 게시글 수
		int maxPage = (int)Math.ceil((double)listCount/10.0); //전체 페이지 수, 올림처리
		int startPage = page/10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
		int endPage = startPage + 10 -1; //현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
		if(endPage>maxPage) endPage = maxPage;
		System.out.println(listCount);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10+1;
		
		return searchDAO.selectSearchList(row);
	}

	@Override
	public List<Search> getSearchMoney(int page, PageInfo pageInfo) throws Exception {
		int listCount = searchDAO.selectSearchCount(); //전체 게시글 수
		int maxPage = (int)Math.ceil((double)listCount/10.0); //전체 페이지 수, 올림처리
		int startPage = page/10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
		int endPage = startPage + 10 -1; //현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
		if(endPage>maxPage) endPage = maxPage;
		System.out.println(listCount);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10+1;
		
		return searchDAO.selectSearchList(row);
	}

	@Override
	public List<Search> getSearchBrand(int page, PageInfo pageInfo) throws Exception {
		int listCount = searchDAO.selectSearchCount(); //전체 게시글 수
		int maxPage = (int)Math.ceil((double)listCount/10.0); //전체 페이지 수, 올림처리
		int startPage = page/10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
		int endPage = startPage + 10 -1; //현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
		if(endPage>maxPage) endPage = maxPage;
		System.out.println(listCount);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10+1;
		
		return searchDAO.selectSearchList(row);
	}

	@Override
	public Search getSearch(Integer carNum) throws Exception {
		return searchDAO.selectSearch(carNum);
	}

	@Override
	public void deleteSearch(Integer carNum) throws Exception {
		searchDAO.deleteSearch(carNum);
	}

}
