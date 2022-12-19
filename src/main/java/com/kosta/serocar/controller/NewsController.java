package com.kosta.serocar.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.serocar.bean.News;
import com.kosta.serocar.service.NewsService;

@Controller
public class NewsController {

	@Autowired
	NewsService newsService;

	@Autowired
	ServletContext servletContext;

	// 뉴스 리스트 창
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	String joinDealer(Model model) {
		return "news/newsList.tiles";
	}

	@GetMapping("/newsList")
	public ModelAndView newsList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("newsList");
		try {
			mav.addObject("newsList", newsService.getNewsList());
			System.out.println("뉴스 리스트: "+newsService.getNewsList());
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				List<String> todayImageList = new ArrayList<>();
				for (Cookie c : cookies) {
					if (c.getName().startsWith("today")) {
						todayImageList.add(c.getValue());
					}
				}
				mav.addObject("todayImageList", todayImageList);
			}
			mav.setViewName("news/newsList.tiles");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@GetMapping("/newsRegistForm")
	public String newsRegistForm() {
		return "newsRegistForm";
	}

	@PostMapping("/newsRegist")
	public ModelAndView newsRegist(@ModelAttribute News news) {
		ModelAndView mav = new ModelAndView("redirect:/newsList");
		try {
			MultipartFile file = news.getImageFile();
			if (!file.isEmpty()) {

				String path = servletContext.getRealPath("/news");
				File destFile = new File(path + file.getOriginalFilename());
				file.transferTo(destFile);
				news.setNewsImage(file.getOriginalFilename());
			}
			newsService.resistNews(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@GetMapping("/news/{filename}")
	public void viewImage(@PathVariable String filename, HttpServletResponse response) {
		String path = servletContext.getRealPath("/news/");
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(path + filename);
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception e) {
				}
			}
		}
	}

	@GetMapping("/newsView")
	public ModelAndView newsView(@RequestParam("newnum") Integer newnum, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("newsView");
		try {
			News news = newsService.selectNews(newnum);
			Cookie today = new Cookie("today" + newnum, news.getNewsImage());
			today.setMaxAge(60 * 60 * 24);
			response.addCookie(today);
			mav.addObject("news", news);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

}
