package com.kosta.serocar.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.KakaoLogin;
import com.kosta.serocar.bean.Member;

@Mapper
@Repository
public interface KakaoLoginDAO {
	//회원가입
	void insertKakaoEmail(@Param("memberNickname") String memberNickname, @Param("memberEmail") String memberEmail);
	//이메일 찾기
	KakaoLogin findKakaoEmail(String kakaoEmail);
	
	void kakaoJoinMember(Member member);
}
