package com.kosta.serocar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.serocar.bean.KakaoLogin;
import com.kosta.serocar.bean.Member;
import com.kosta.serocar.dao.KakaoLoginDAO;

@Service
public class KakaoLoginServiceImpl implements KakaoLoginService{

	@Autowired
	KakaoLoginDAO kakaoLoginDAO;

	@Override
	public void joinKakao(String memberNickname, String memberEmail) {
		kakaoLoginDAO.insertKakaoEmail(memberNickname, memberEmail);
		
	}

	@Override
	public KakaoLogin selectKakaoEmail(String memberEmail) {
		return kakaoLoginDAO.findKakaoEmail(memberEmail);
	}

	@Override
	public void kakaoJoinMember(Member member) {
		kakaoLoginDAO.kakaoJoinMember(member);
		
	}


}