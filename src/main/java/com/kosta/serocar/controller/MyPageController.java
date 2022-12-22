package com.kosta.serocar.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.serocar.bean.Advertisement;
import com.kosta.serocar.bean.CarLike;
import com.kosta.serocar.bean.Community;
import com.kosta.serocar.bean.Detail;
import com.kosta.serocar.bean.Member;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.dao.DetailDAO;
import com.kosta.serocar.dao.MyPageDAO;
import com.kosta.serocar.dao.NoteDAO;
import com.kosta.serocar.service.DetailService;
import com.kosta.serocar.service.MemberService;
import com.kosta.serocar.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	MyPageService myPageService;
	
	@Autowired
	DetailService detailService;
	
	@Autowired
	DetailDAO detailDAO;
	
	@Autowired
	MyPageDAO myPageDAO;
	
	@Autowired
	NoteDAO noteDAO;

	@RequestMapping(value = "/myPage", method=RequestMethod.GET)
	public ModelAndView myPage(@RequestParam(value="memberEmail") String memberEmail,@RequestParam(value="memberNickname") String memberNickname, Model model, Member member) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println(memberEmail);
		String businessNum = member.getBusinessNum();
		System.out.println(businessNum);
		int myRecordCount = noteDAO.myRecordCount(memberNickname);
		mav.addObject("chatCount", myRecordCount);
		
		if(businessNum=="") {
			businessNum=null;
		}
		
		if(businessNum == null) {
			int listCount = myPageDAO.selectCommunityCount2(memberEmail);
			mav.addObject("count2",listCount);	
			System.out.println("비지니스 넘 null:"+listCount);
			mav.setViewName("myPage/myPage.tiles");
		}else {
			int listCount_ad = myPageDAO.selectAdvertisementCount2(memberEmail);
			mav.addObject("count_ad",listCount_ad);
			System.out.println("비지니스 넘:"+listCount_ad);
			mav.setViewName("myPage/myPage.tiles");
		}
		
		List<Detail> carList = detailDAO.selectCarLike(memberEmail);
		mav.addObject("carList", carList);
		mav.addObject("carCount", detailDAO.selectCarNum(memberEmail));
//		 Integer carNum = detailDAO.selectCarNum(memberEmail);
//		 CarLike carlike = new CarLike();
//         carlike.setCarNum(carNum);
//         carlike.setMemberEmail(memberEmail);
//         carlike.setCarLikeN(1);
//         mav.addObject("carNum", carNum);
//         mav.addObject("carLike", detailService.findLike(carNum, memberEmail));
//         mav.addObject("getCarLike", detailService.getLike(carNum, 1));
		return mav;
	}
	
	@RequestMapping(value = "/profile", method=RequestMethod.GET)
	String profile(@ModelAttribute Member member) {
		System.out.println(member.getMemberEmail());
		return "myPage/profile.tiles";
	}
	
	
	@RequestMapping(value = "/profile", method=RequestMethod.POST)
	public String profile(@RequestParam(value="memberEmail", required = false) String memberEmail,@RequestParam(value="memberNickname") String memberNickname, @ModelAttribute Member member, HttpSession session){
		try {
			MultipartFile file = member.getImageFile();
			
			System.out.println("이미지1 : "+file);
			
			if(!file.isEmpty()) {
				String path = servletContext.getRealPath("./profile/");
				File destFile = new File(path + file.getOriginalFilename());
				file.transferTo(destFile);
				member.setProfile(file.getOriginalFilename());
			}
		
		memberService.changeProFile(member);
		
		session.setAttribute("memberNickname", member.getMemberNickname());
		session.setAttribute("memberProfile", member.getProfile());
		session.setAttribute("memberEmail", member.getMemberEmail());
		
		System.out.println("멤버 이베일= "+member.getMemberEmail());
		System.out.println("멤버 닉네임= "+member.getMemberNickname());
		System.out.println("멤버 프로필= "+member.getProfile());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/myPage?memberEmail="+memberEmail+"&memberNickname="+memberNickname;
	}

	@RequestMapping(value = "/myPageList", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView communityList(
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, @RequestParam(value="memberEmail") String memberEmail, @RequestParam(value="memberNickname") String memberNickname,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			List<Community> articleList = myPageService.getCommunityList(page, memberEmail, pageInfo);
			mav.addObject("articleList", articleList);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName("myPage/myPageWrite.tiles");
			System.out.println("멤버이메일:" + request.getParameter("memberEmail"));
			int listCount = myPageDAO.selectCommunityCount2(memberEmail);
			mav.addObject("count2",listCount);
			
			int listCount_ad = myPageDAO.selectAdvertisementCount2(memberEmail);
			mav.addObject("count_ad",listCount_ad);
			int myRecordCount = noteDAO.myRecordCount(memberNickname);
			mav.addObject("chatCount", myRecordCount);
			mav.addObject("carCount", detailDAO.selectCarNum(memberEmail));
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("community/err.tiles");
		}
		return mav;
	}
	
	@RequestMapping(value = "/myPageList_ad", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView advertisementList(
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, @RequestParam(value="memberEmail") String memberEmail, @RequestParam(value="memberNickname") String memberNickname,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			List<Advertisement> articleList = myPageService.getAdvertisementList(page, memberEmail, pageInfo);
			mav.addObject("articleList2", articleList);
			mav.addObject("pageInfo2", pageInfo);
			mav.setViewName("myPage/myPageWrite.tiles");
			System.out.println("멤버이메일:" + request.getParameter("memberEmail"));
			System.out.println("홍보글 리스트: "+articleList);
			int listCount = myPageDAO.selectCommunityCount2(memberEmail);
			mav.addObject("count2",listCount);
			
			int listCount_ad = myPageDAO.selectAdvertisementCount2(memberEmail);
			mav.addObject("count_ad",listCount_ad);
			int myRecordCount = noteDAO.myRecordCount(memberNickname);
			mav.addObject("chatCount", myRecordCount);
			mav.addObject("carCount", detailDAO.selectCarNum(memberEmail));
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("community/err.tiles");
		}
		return mav;
	}
	
	
	
	
}
