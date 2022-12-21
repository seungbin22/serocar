package com.kosta.serocar.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.serocar.bean.CarLike;
import com.kosta.serocar.bean.Detail;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.service.DetailService;


@Controller
public class DetailController {

	@Autowired
	DetailService detailService;

	@Autowired
	HttpSession session;

	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = "/carList", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView carList(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, @RequestParam(value = "keyword", required = false) String keyword
			,@RequestParam(value = "carBrand", required = false) String carBrand,@RequestParam(value = "carType", required = false) String carType
			,@RequestParam(value = "minMoney", required = false) Integer minMoney,@RequestParam(value = "maxMoney", required = false) Integer maxMoney
			,@RequestParam(value = "carNum", required = false)Integer carNum, @RequestParam(value = "memberEmail", required = false)String memberEmail) {
		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		if(keyword=="") {
			keyword=null;
		}
		if(carBrand=="") {
			carBrand=null;
		}
		if(carType=="") {
			carType=null;
		}
		
		mav.addObject("searchKeyword", keyword);
		mav.addObject("searchCarBrand", carBrand);
		mav.addObject("carType", carType);
		mav.addObject("minMoney", minMoney);
		mav.addObject("maxMoney", maxMoney);
		System.out.println("keyword: "+keyword);
		System.out.println("carBrand: "+carBrand);
		System.out.println("carType: "+carType);
		System.out.println("minMoney: "+ minMoney);
		try {
			List<Detail> carList = detailService.getCarList(page, keyword, carBrand,carType,minMoney,maxMoney,pageInfo);
			System.out.println("carlist : "+carList);
			mav.addObject("carList", carList);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName("detail/detailList.tiles");
			
			System.out.println("멤버 이메일: "+memberEmail);

		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("detail/err.tiles");
		}
		return mav;
	}
	

	@GetMapping("/carDetail/{filename}")
	public void carfileview(@PathVariable String filename, HttpServletResponse response) {
		String path = servletContext.getRealPath("/carDetail/");
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
	
	@GetMapping("/carBrand/{filename}")
	   public void brandfileview(@PathVariable String filename, HttpServletResponse response) {
	      String path = servletContext.getRealPath("/carBrand/");
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
	      @ResponseBody 
	      @PostMapping("/carlikeUp")
	      public void likeup(@RequestBody CarLike vo) {
	         System.out.println("컨트롤러 연결 성공");
	         System.out.println(vo.getCarNum());
	         System.out.println(vo.getMemberEmail());
	         System.out.println(vo.getCarLikeN());
	         detailService.likeUp(vo.getCarNum(), vo.getMemberEmail(),vo.getCarLikeN());
	      
	      }
	      
	      @ResponseBody
	      @PostMapping("/carlikeDown")
	      public void likeDown(@RequestBody CarLike vo) {
	         System.out.println("컨트롤러 연결 성공");
	         System.out.println(vo.getCarNum());
	         System.out.println(vo.getMemberEmail());
	         System.out.println(vo.getCarLikeN());
	         detailService.likeDown(vo.getCarNum(), vo.getMemberEmail(),vo.getCarLikeN());
	      }
	      
	      @RequestMapping(value="/carLink" ,method = RequestMethod.GET)
	     public ModelAndView link(@RequestParam(value="carLink")String carLink, @RequestParam(value="carNum")Integer carNum, @RequestParam(value="memberEmail")String memberEmail) {
		      ModelAndView mav = new ModelAndView();   
	    	  CarLike carlike = new CarLike();
		         carlike.setCarNum(carNum);
		         carlike.setMemberEmail(memberEmail);
		         carlike.setCarLikeN(1);
		         mav.addObject("carNum", carNum);
		         mav.addObject("carLike", detailService.findLike(carNum, memberEmail));
		         mav.addObject("getCarLike", detailService.getLike(carNum, 1));
		         System.out.println("갯라이크 : "+detailService.getLike(carNum, 1));
		         System.out.println("갯라이크 : "+detailService.findLike(carNum, memberEmail));
		         System.out.println("카넘 :"+carNum);
		         mav.setViewName("detail/"+carLink+".tiles");
	    	  return mav;
	      }
}
