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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.serocar.bean.Community;
import com.kosta.serocar.bean.Like;
import com.kosta.serocar.bean.Notice;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.dao.MemberDAO;
import com.kosta.serocar.dao.NoticeDAO;
import com.kosta.serocar.service.CommentService;
import com.kosta.serocar.service.CommunityService;
import com.kosta.serocar.service.MemberService;

@Controller
public class CommunityController {

	@Autowired
	CommunityService communityService;

	@Autowired
	MemberService memberService;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	NoticeDAO noticeDAO;

	@Autowired
	HttpSession session;

	@Autowired
	CommentService commentService;

	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = "/comwriteform", method = RequestMethod.GET)
	public String writeform() {
		return "community/comwriteform.tiles";
	}

	@RequestMapping(value = "/communitywrite", method = RequestMethod.POST)
	public ModelAndView communitywrite(@ModelAttribute Community community) {
		String comTitle = community.getComTitle();
		ModelAndView mav = new ModelAndView();

		try {
			System.out.println("?????? : " + comTitle);
			System.out.println("?????? : " + community.getComNum());
			communityService.registCommunity(community);
			mav.setViewName("redirect:/communityList");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("community/err.tiles");
		}
		return mav;
	}

	// ?????????
	@ResponseBody
	@PostMapping("/upload")
	public Map<String, Object> fileupload(@RequestParam(value = "upload") MultipartFile file) {
		String path = servletContext.getRealPath("/upload/");
		String filename = file.getOriginalFilename();
		File destfile = new File(path + filename);
		Map<String, Object> json = new HashMap<>();
		try {
			file.transferTo(destfile);
			json.put("uploaded", 1);
			json.put("filename", filename);
			json.put("url", "/fileview/" + filename);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return json;
	}

	// ????????? ????????? ????????? ??????
	@GetMapping("/fileview/{filename}")
	public void fileview(@PathVariable String filename, HttpServletResponse response) {
		String path = servletContext.getRealPath("/upload/");
		File file = new File(path + filename);
		FileInputStream fis = null;
		try {
			OutputStream out = response.getOutputStream();
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ????????? ??????
	@RequestMapping(value = "/communityList", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView communityList(
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, @RequestParam(value="keyword", required = false) String keyword, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			List<Community> articleList = communityService.getCommunityList(page, keyword, pageInfo);
			System.out.println("????????? ?????????: "+ articleList);
			mav.addObject("articleList", articleList);
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("searchKeyword", keyword);
			
			System.out.println("???????????? ?????????: "+keyword);
			System.out.println("???????????????:" + request.getParameter("memberEmail"));
			System.out.println("???????????????:" + request.getParameter("article.memberEmail"));
			mav.setViewName("community/comlistform.tiles");
			List<Notice> noticeList = noticeDAO.getNotice();
			mav.addObject("noticeList",noticeList);
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("community/err.tiles");
		}
		return mav;
	}
	
		// ????????? ??????
	@RequestMapping(value = "/comDetail", method = RequestMethod.GET)
	public ModelAndView comDetail(@RequestParam("comNum") Integer comNum,
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam(value = "page", required = false) Integer page, Model model) {
		ModelAndView mav = new ModelAndView();
		System.out.println("??????1= " + comNum);
		model.addAttribute("comtotal", commentService.getTotal(comNum));
		try {
			
	        model.addAttribute("profile", memberDAO.getprofile(comNum));
			Like like = new Like();

			like.setComNum(comNum);
			like.setMemberEmail(memberEmail);
			like.setLikeN(1);
			model.addAttribute("like", communityService.findLike(comNum, memberEmail));
			model.addAttribute("getLike", communityService.getLike(comNum, 1));
			System.out.println("???????????? : "+communityService.getLike(comNum, 1));
			communityService.hit(comNum);
			communityService.updateComment(comNum);
			communityService.updateLike(comNum);
			model.addAttribute("getComment", commentService.getTotal(comNum));
			Community community = communityService.getCommunity(comNum);
			mav.addObject("article", community);
			mav.addObject("page", page);
			mav.setViewName("community/comDetail.tiles");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("community/err.tiles");
		}
		return mav;
	}

	// ????????? ??????
	@RequestMapping(value = "/delete", method = { RequestMethod.POST, RequestMethod.GET })
	String delete(@RequestParam("comNum") Integer comNum) throws Exception {

		communityService.deleteCommunity(comNum);
System.out.println("???????????? ?????? : "+comNum);
		return "redirect:/communityList";
	}

	// ????????? ????????? ????????????
	@RequestMapping(value = "/modifyform", method = RequestMethod.GET)
	public ModelAndView modify(@RequestParam("comNum") Integer comNum) {
		ModelAndView mav = new ModelAndView();
		try {
			Community community = communityService.getCommunity(comNum);
			mav.addObject("comNum", community.getComNum());
			mav.addObject("comTitle", community.getComTitle());
			mav.addObject("comContent", community.getComContent());
			mav.setViewName("community/comModifyWriteForm.tiles");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", "?????? ??????");
			mav.setViewName("community/err.tiles");
		}
		return mav;
	}

	// ????????? ????????????
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modify(@ModelAttribute Community community) {
		ModelAndView mav = new ModelAndView();
		try {
			communityService.modifyCommunity(community);
			mav.addObject("comNum", community.getComNum());
			mav.setViewName("redirect:/comDetail");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("community/err.tiles");
		}
		return mav;
	}
	
	@ResponseBody 
	   @PostMapping("/likeUp")
	   public void likeup(@RequestBody Like vo) {
	      System.out.println("???????????? ?????? ??????");
	      System.out.println(vo.getComNum());
	      System.out.println(vo.getMemberEmail());
	      System.out.println(vo.getLikeN());
	      communityService.likeUp(vo.getComNum(), vo.getMemberEmail(),vo.getLikeN());
	   
	   }
	   
	   @ResponseBody
	   @PostMapping("/likeDown")
	   public void likeDown(@RequestBody Like vo) {
	      System.out.println("???????????? ?????? ??????");
	      System.out.println(vo.getComNum());
	      System.out.println(vo.getMemberEmail());
	      System.out.println(vo.getLikeN());
	      communityService.likeDown(vo.getComNum(), vo.getMemberEmail(),vo.getLikeN());
	   }
	   
}