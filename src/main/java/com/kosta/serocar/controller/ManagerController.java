package com.kosta.serocar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.serocar.bean.Advertisement;
import com.kosta.serocar.bean.Community;
import com.kosta.serocar.bean.Member;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.service.AdvertisementService;
import com.kosta.serocar.service.CommunityService;
import com.kosta.serocar.service.ManagerService;
import com.kosta.serocar.service.MemberService;

@Controller
public class ManagerController {
	
	@Autowired
	CommunityService communityService;
	
	@Autowired
	AdvertisementService advertisementService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ManagerService managerService;
	
	//커뮤니티 게시물 관리
	@RequestMapping(value = "/managerCom", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView communityList(
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, @RequestParam(value="keyword", required = false) String keyword, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			List<Community> articleList = communityService.getCommunityList(page, keyword, pageInfo);
			mav.addObject("articleList", articleList);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName("manager/managerCom.tiles");
			session.setAttribute("searchKeyword", keyword);
			System.out.println("멤버이메일:" + request.getParameter("memberEmail"));
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("community/err.tiles");
		}
		return mav;
	}
	
	@RequestMapping(value = "/managerAd", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView advertisementList(
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, @RequestParam(value="keyword", required = false) String keyword, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			List<Advertisement> articleList = advertisementService.getAdvertisementList(page, keyword, pageInfo);
			mav.addObject("articleList2", articleList);
			mav.addObject("pageInfo2", pageInfo);
			mav.setViewName("manager/managerAd.tiles");
			session.setAttribute("searchKeyword", keyword);
			System.out.println("멤버이메일:" + request.getParameter("memberEmail"));
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("community/err.tiles");
		}
		return mav;
	}
	
	@RequestMapping(value = "/managerMember", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView managerMember(
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, @RequestParam(value="keyword", required = false) String keyword, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			List<Member> articleList = memberService.getMemberList(page, keyword, pageInfo);
			mav.addObject("articleList3", articleList);
			mav.addObject("pageInfo3", pageInfo);
			mav.setViewName("manager/managerMember.tiles");
			session.setAttribute("searchKeyword", keyword);
			System.out.println("멤버이메일:" + request.getParameter("memberEmail"));
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("community/err.tiles");
		}
		return mav;
	}
	
	@RequestMapping(value = "/managerDeleteCom", method = { RequestMethod.POST, RequestMethod.GET })
	String managerDeleteCom(@RequestParam("comNum") Integer comNum) throws Exception {

		communityService.deleteCommunity(comNum);
System.out.println("컨트롤러 컴넘 : "+comNum);
		return "redirect:/managerCom";
	}

}
