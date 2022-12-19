package com.kosta.serocar.service;

import org.apache.ibatis.annotations.Param;

import com.kosta.serocar.bean.KakaoLogin;
import com.kosta.serocar.bean.Member;

public interface KakaoLoginService {
	
	//회원가입처리
	void joinKakao(@Param("memberNickname") String memberNickname, @Param("memberEmail") String memberEmail);
	//카카오 아이디 찾기
	KakaoLogin selectKakaoEmail(String kakaoEmail);
	
	void kakaoJoinMember(Member member);
}
