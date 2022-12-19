package com.kosta.serocar.service;

import org.apache.ibatis.annotations.Param;

import com.kosta.serocar.bean.Member;
import com.kosta.serocar.bean.NaverLogin;

public interface NaverService {
	
	//회원가입처리
	void joinNaver(@Param("memberNickname") String memberNickname, @Param("memberEmail") String memberEmail);
	//카카오 아이디 찾기
	NaverLogin selectNaverEmail(String naverEmail);
	
	void naverJoinMember(Member member);
}
