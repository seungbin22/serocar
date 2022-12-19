package com.kosta.serocar.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.serocar.bean.Member;
import com.kosta.serocar.bean.NaverLogin;
import com.kosta.serocar.dao.NaverLoginDAO;

@Service
public class NaverServiceImpl implements NaverService{

	@Autowired
	NaverLoginDAO naverLoginDAO;

	@Override
	public void joinNaver(String memberEmail, String memberNickname){
		naverLoginDAO.insertNaver(memberEmail, memberNickname);
		
	}

	@Override
	public NaverLogin selectNaverEmail(String memberEmail) {
		return naverLoginDAO.findNaverEmail(memberEmail);
	}

	@Override
	public void naverJoinMember(Member member) {
		naverLoginDAO.naverJoinMember(member);
		
	}

}