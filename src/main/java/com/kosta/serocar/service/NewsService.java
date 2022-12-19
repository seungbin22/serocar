package com.kosta.serocar.service;

import java.util.List;

import com.kosta.serocar.bean.News;

public interface NewsService {

	void resistNews(News news) throws Exception;
	List<News> getNewsList() throws Exception;
	News selectNews(Integer newnum) throws Exception;
	
}
