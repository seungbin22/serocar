package com.kosta.serocar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.serocar.bean.News;
import com.kosta.serocar.dao.NewsDAO;

@Service
public class NewsServiceImpl implements NewsService {
		@Autowired
		NewsDAO newsDAO;

		@Override
		public void resistNews(News news) throws Exception {
			newsDAO.insertNews(news);	
		}
		@Override
		public List<News> getNewsList() throws Exception {
			return newsDAO.selectNewsList();
		}
		@Override
		public News selectNews(Integer newnum) throws Exception {
			return newsDAO.selectNews(newnum);
		}

		
}
