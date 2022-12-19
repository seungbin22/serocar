package com.kosta.serocar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.serocar.dao.ManagerDAO;

@Service
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	ManagerDAO managerDAO;


	@Override//커뮤니티 글 삭제
	public void deleteCommunity(int comNum) throws Exception {
		managerDAO.deleteManagerCom(comNum);
	}}
