package com.kosta.serocar.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.Community;

@Mapper
@Repository
public interface ManagerDAO {
	//게시글 삭제
	void deleteManagerCom(int comNum) throws Exception;
}
