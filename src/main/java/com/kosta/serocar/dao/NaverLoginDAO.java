package com.kosta.serocar.dao;

import java.sql.Date;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.Member;
import com.kosta.serocar.bean.NaverLogin;

@Mapper
@Repository
public interface NaverLoginDAO {

	void insertNaver(@Param("memberNickname") String memberNickname, @Param("memberEmail") String memberEmail);
	//이메일 찾기
	NaverLogin findNaverEmail(String naverEmail);
	
	void naverJoinMember(Member member);
}
