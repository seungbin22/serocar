package com.kosta.serocar.service;

import java.util.List;

import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.bean.Search;

public interface SearchService  {
	void registSearch(Search Search) throws Exception;
	List<Search> getSearchList(int page, PageInfo pageInfo) throws Exception;	
	List<Search> getSearchCombi(int page, PageInfo pageInfo) throws Exception;
	List<Search> getSearchMoney(int page, PageInfo pageInfo) throws Exception;
	List<Search> getSearchBrand(int page, PageInfo pageInfo) throws Exception;
	Search getSearch(Integer carNum) throws Exception;
	void deleteSearch(Integer carNum) throws Exception;
}
