package com.kosta.serocar.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.serocar.bean.Member;
import com.kosta.serocar.service.MemberService;

@Controller
public class HomeController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping("/")
	String home(Model model){
		
		return "index.tiles";
	}
	
	@RequestMapping("/logout")
	String logout(HttpSession session, Model model) {
		session.removeAttribute("memberEmail");
		return "redirect:/";
	}

	//일반회원, 딜러 회원가입 선택창
	@RequestMapping("/joinSelect")
	String joinSelect(Model model) {
		return "member/joinSelect.tiles";
	}
}
	
//	@RequestMapping("/resetPassword")
//	public String resetPassword(Model model) {
//		return "home.tiles"; // 수정필요
//	}

