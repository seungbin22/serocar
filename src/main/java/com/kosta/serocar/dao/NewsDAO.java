package com.kosta.serocar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.News;


@Mapper
@Repository
public interface NewsDAO {
	void insertNews(News news) throws Exception;
	List<News> selectNewsList() throws Exception;
	News selectNews(Integer newnum) throws Exception;
}
