package com.kosta.serocar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.Search;


@Mapper
@Repository
public interface SearchDAO {
	void insertCar(Search search) throws Exception;
	List<Search> selectSearchList(Integer row) throws Exception;
	List<Search> selectSearchcombi(Integer row) throws Exception;
	List<Search> selectSearchmoney(Integer row) throws Exception;
	List<Search> selectSearchbrand(Integer row) throws Exception;
	Search selectSearch(Integer carNum) throws Exception;
	void deleteSearch(Integer carNum) throws Exception;
	Integer selectSearchCount() throws Exception;
}
