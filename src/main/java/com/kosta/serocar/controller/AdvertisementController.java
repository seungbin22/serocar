package com.kosta.serocar.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.serocar.bean.Advertisement;
import com.kosta.serocar.bean.Community;
import com.kosta.serocar.bean.Like;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.service.AdvertisementService;
import com.kosta.serocar.service.CommentService;

@Controller
public class AdvertisementController {

   @Autowired
   AdvertisementService advertisementService;

   @Autowired
   HttpSession session;

   @Autowired
   ServletContext servletContext;
   
   @Autowired
   CommentService commentService;
   
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
      
      // 홍보글 보기
      @RequestMapping(value = "/comDetail_ad", method = RequestMethod.GET)
      public ModelAndView comDetail(@RequestParam("ad_num") Integer ad_num,
            @RequestParam("memberEmail") String memberEmail,
            @RequestParam(value = "page", required = false) Integer page, Model model) {
         ModelAndView mav = new ModelAndView();
         System.out.println("컴넘1= " + ad_num);
         model.addAttribute("comtotal", commentService.getTotal(ad_num));
         try {
            Like like = new Like();

            like.setComNum(ad_num);
            like.setMemberEmail(memberEmail);
            like.setLikeN(1);
            model.addAttribute("like", advertisementService.findLike_ad(ad_num, memberEmail));
            model.addAttribute("getLike", advertisementService.getLike_ad(ad_num, 1));
            System.out.println("갯라이크 : "+advertisementService.getLike_ad(ad_num, 1));
            advertisementService.hit_ad(ad_num);

            Advertisement advertisement = advertisementService.getAdvertisement(ad_num);
            mav.addObject("article", advertisement);
            mav.addObject("page", page);
            mav.setViewName("community/comDetail_ad.tiles");
         } catch (Exception e) {
            e.printStackTrace();
            mav.setViewName("community/err.tiles");
         }
         return mav;
      }
      
      // 홍보글 삭제
      @RequestMapping(value = "/delete_ad", method = { RequestMethod.POST, RequestMethod.GET })
      String delete(@RequestParam("ad_num") Integer ad_num) throws Exception {

         advertisementService.deleteAdvertisement(ad_num);
         System.out.println("컨트롤러 컴넘 : "+ad_num);
         return "redirect:/advertisementList";
      }
      
      // 홍보글 수정폼 불러오기
      @RequestMapping(value = "/modifyform_ad", method = RequestMethod.GET)
      public ModelAndView modify(@RequestParam("ad_num") Integer ad_num) {
         ModelAndView mav = new ModelAndView();
         try {
            Advertisement advertisement= advertisementService.getAdvertisement(ad_num);
            mav.addObject("ad_num", advertisement.getAd_num());
            mav.addObject("ad_title", advertisement.getAd_title());
            mav.addObject("ad_content", advertisement.getAd_content());
            mav.setViewName("community/adModifyWriteForm.tiles");
         } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("err", "조회 실패");
            mav.setViewName("community/err.tiles");
         }
         return mav;
      }

      // 홍보글 수정하기
      @RequestMapping(value = "/modify_ad", method = RequestMethod.POST)
      public ModelAndView modify(@ModelAttribute Advertisement advertisement, @RequestParam("memberEmail")String memberEmail) {
         ModelAndView mav = new ModelAndView();
         try {
            advertisementService.modifyAdvertisement(advertisement);
            mav.addObject("ad_num", advertisement.getAd_num());
            mav.addObject("memberEmail", advertisement.getMemberEmail());
            mav.setViewName("redirect:/comDetail_ad");
         } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("err", e.getMessage());
            mav.setViewName("community/err.tiles");
         }
         return mav;
      }
      
      @ResponseBody 
         @PostMapping("/likeUp_ad")
         public void likeup(@RequestBody Like vo) {
            System.out.println("컨트롤러 연결 성공");
            System.out.println(vo.getAd_num());
            System.out.println(vo.getMemberEmail());
            System.out.println(vo.getLikeN());
            advertisementService.likeUp_ad(vo.getAd_num(), vo.getMemberEmail(),vo.getLikeN());
         
         }
         
         @ResponseBody
         @PostMapping("/likeDown_ad")
         public void likeDown(@RequestBody Like vo) {
            System.out.println("컨트롤러 연결 성공");
            System.out.println(vo.getAd_num());
            System.out.println(vo.getMemberEmail());
            System.out.println(vo.getLikeN());
            advertisementService.likeDown_ad(vo.getAd_num(), vo.getMemberEmail(),vo.getLikeN());
         }
}