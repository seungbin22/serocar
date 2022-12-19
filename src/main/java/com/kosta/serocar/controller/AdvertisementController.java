package com.kosta.serocar.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.serocar.bean.Advertisement;
import com.kosta.serocar.bean.Community;
import com.kosta.serocar.bean.Like;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.service.AdvertisementService;

@Controller
public class AdvertisementController {

	@Autowired
	AdvertisementService advertisementService;

	@Autowired
	HttpSession session;

	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = "/comwriteform_ad", method = RequestMethod.GET)
	public String writeform() {
		return "community/comwriteform_ad.tiles";
	}
	
	@RequestMapping(value = "/advertisementWrite", method = RequestMethod.POST)
	public ModelAndView communitywrite_ad(@ModelAttribute Advertisement advertisement) {
		String comTitle = advertisement.getAd_title();
		ModelAndView mav = new ModelAndView();

		try {
			System.out.println("제목 : " + comTitle);
			System.out.println("넘버 : " + advertisement.getAd_num());
			advertisementService.registAdvertisement(advertisement);
			mav.setViewName("redirect:/advertisementList");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("community/err.tiles");
		}
		return mav;
	}
	
	// 홍보글 호출
		@RequestMapping(value = "/advertisementList", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView advertisementList(
				@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, @RequestParam(value="keyword", required = false) String keyword, HttpServletRequest request, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			PageInfo pageInfo = new PageInfo();
			try {
				List<Advertisement> articleList = advertisementService.getAdvertisementList(page, keyword, pageInfo);
				mav.addObject("articleList2", articleList);
				mav.addObject("pageInfo2", pageInfo);
				mav.setViewName("community/comlistform_ad.tiles");
				session.setAttribute("searchKeyword", keyword);
				System.out.println("멤버이메일:" + request.getParameter("memberEmail"));
				System.out.println("홍보글 리스트: "+articleList);
			} catch (Exception e) {
				e.printStackTrace();
				mav.addObject("err", e.getMessage());
				mav.setViewName("community/err.tiles");
			}
			return mav;
		}
		
		// 게시글 보기
//		@RequestMapping(value = "/comDetail", method = RequestMethod.GET)
//		public ModelAndView comDetail(@RequestParam("comNum") Integer comNum,
//				@RequestParam("memberEmail") String memberEmail,
//				@RequestParam(value = "page", required = false) Integer page, Model model) {
//			ModelAndView mav = new ModelAndView();
//			System.out.println("컴넘1= " + comNum);
//			model.addAttribute("comtotal", commentService.getTotal(comNum));
//			try {
//				Like like = new Like();
//
//				like.setComNum(comNum);
//				like.setMemberEmail(memberEmail);
//				like.setLikeN(1);
//				model.addAttribute("like", communityService.findLike(comNum, memberEmail));
//				model.addAttribute("getLike", communityService.getLike(comNum, 1));
//				System.out.println("갯라이크 : "+communityService.getLike(comNum, 1));
//				communityService.hit(comNum);
//
//				Community community = communityService.getCommunity(comNum);
//				mav.addObject("article", community);
//				mav.addObject("page", page);
//				mav.setViewName("community/comDetail.tiles");
//			} catch (Exception e) {
//				e.printStackTrace();
//				mav.setViewName("community/err.tiles");
//			}
//			return mav;
//		}
}