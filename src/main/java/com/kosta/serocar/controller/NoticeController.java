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

import com.kosta.serocar.bean.Like;
import com.kosta.serocar.bean.Notice;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.dao.MemberDAO;
import com.kosta.serocar.service.CommentService;
import com.kosta.serocar.service.NoticeService;

@Controller
public class NoticeController {

   @Autowired
   HttpSession session;

   @Autowired
   ServletContext servletContext;
   
   @Autowired
   NoticeService noticeService;
   
   @Autowired
   CommentService commentService;
   
   @Autowired
   MemberDAO memberDAO;
   
   // 공지사항 호출
   @RequestMapping(value = "/noticeList", method = { RequestMethod.POST, RequestMethod.GET })
   public ModelAndView noticeList(
         @RequestParam(value = "page", required = false, defaultValue = "1") Integer page, @RequestParam(value="keyword", required = false) String keyword, HttpServletRequest request, HttpSession session) {
      ModelAndView mav = new ModelAndView();
      PageInfo pageInfo = new PageInfo();
      try {
         List<Notice> noticeList = noticeService.getNoticeList(page, keyword, pageInfo);
         mav.addObject("noticeList", noticeList);
         mav.addObject("pageInfo2", pageInfo);
         mav.setViewName("community/comlistform_notice.tiles");
         session.setAttribute("searchKeyword", keyword);
         System.out.println("멤버이메일:" + request.getParameter("memberEmail"));
         System.out.println("홍보글 리스트: "+noticeList);
      } catch (Exception e) {
         e.printStackTrace();
         mav.addObject("err", e.getMessage());
         mav.setViewName("community/err.tiles");
      }
      return mav;
   }
   
   // 홍보글 보기
   @RequestMapping(value = "/comDetail_notice", method = RequestMethod.GET)
   public ModelAndView comDetail(@RequestParam("notice_num") Integer notice_num,
         @RequestParam("memberEmail") String memberEmail,
         @RequestParam(value = "page", required = false) Integer page, Model model) {
      ModelAndView mav = new ModelAndView();
      System.out.println("컴넘1= " + notice_num);
      model.addAttribute("comtotal", commentService.getTotal(notice_num));
      try {
    	 model.addAttribute("profile", memberDAO.getprofile_notice(notice_num));
         Like like = new Like();

         like.setComNum(notice_num);
         like.setMemberEmail(memberEmail);
         like.setLikeN(1);
         model.addAttribute("like", noticeService.findLike_notice(notice_num, memberEmail));
         model.addAttribute("getLike", noticeService.getLike_notice(notice_num, 1));
         System.out.println("갯라이크 : "+noticeService.getLike_notice(notice_num, 1));
         model.addAttribute("getComment", commentService.getTotal(notice_num));
         noticeService.hit_notice(notice_num);

         Notice notice = noticeService.getNotice(notice_num);
         mav.addObject("article", notice);
         mav.addObject("page", page);
         mav.setViewName("community/comDetail_notice.tiles");
      } catch (Exception e) {
         e.printStackTrace();
         mav.setViewName("community/err.tiles");
      }
      return mav;
   }
   
   // 홍보글 삭제
   @RequestMapping(value = "/delete_notice", method = { RequestMethod.POST, RequestMethod.GET })
   String delete(@RequestParam("notice_num") Integer notice_num) throws Exception {
	   
	   System.out.println("컨트롤러 컴넘 : "+notice_num);
      noticeService.deleteNotice(notice_num);
      
      return "redirect:/noticeList";
   }
   
   // 홍보글 수정폼 불러오기
   @RequestMapping(value = "/modifyform_notice", method = RequestMethod.GET)
   public ModelAndView modify(@RequestParam("notice_num") Integer notice_num) {
      ModelAndView mav = new ModelAndView();
      try {
    	 Notice notice= noticeService.getNotice(notice_num);
         mav.addObject("notice_num", notice.getNotice_num());
         mav.addObject("notice_title", notice.getNotice_title());
         mav.addObject("notice_content", notice.getNotice_content());
         mav.setViewName("community/ModifyWriteForm_notice.tiles");
      } catch (Exception e) {
         e.printStackTrace();
         mav.addObject("err", "조회 실패");
         mav.setViewName("community/err.tiles");
      }
      return mav;
   }

   // 홍보글 수정하기
   @RequestMapping(value = "/modify_notice", method = RequestMethod.POST)
   public ModelAndView modify(@ModelAttribute Notice notice, @RequestParam("memberEmail")String memberEmail) {
      ModelAndView mav = new ModelAndView();
      try {
    	  noticeService.modifyNotice(notice);
         mav.addObject("notice_num", notice.getNotice_num());
         mav.addObject("memberEmail", notice.getMemberEmail());
         mav.setViewName("redirect:/comDetail_notice");
      } catch (Exception e) {
         e.printStackTrace();
         mav.addObject("err", e.getMessage());
         mav.setViewName("community/err.tiles");
      }
      return mav;
   }
   
   @RequestMapping(value = "/comwriteform_notice", method = RequestMethod.GET)
   public String writeform() {
      return "community/comwriteform_notice.tiles";
   }
   
   @RequestMapping(value = "/noticeWrite", method = RequestMethod.POST)
   public ModelAndView communitywrite_notice(@ModelAttribute Notice notice) {
      String comTitle = notice.getNotice_title();
      ModelAndView mav = new ModelAndView();

      try {
         System.out.println("제목 : " + comTitle);
         System.out.println("넘버 : " + notice.getNotice_num());
         noticeService.registNotice(notice);
         mav.setViewName("redirect:/noticeList");
      } catch (Exception e) {
         e.printStackTrace();
         mav.setViewName("community/err.tiles");
      }
      return mav;
   }
   
      @ResponseBody 
         @PostMapping("/likeUp_notice")
         public void likeup(@RequestBody Like vo) {
            System.out.println("컨트롤러 연결 성공");
            System.out.println(vo.getNotice_num());
            System.out.println(vo.getMemberEmail());
            System.out.println(vo.getLikeN());
            noticeService.likeUp_notice(vo.getNotice_num(), vo.getMemberEmail(),vo.getLikeN());
         
         }
         
         @ResponseBody
         @PostMapping("/likeDown_notice")
         public void likeDown(@RequestBody Like vo) {
            System.out.println("컨트롤러 연결 성공");
            System.out.println(vo.getNotice_num());
            System.out.println(vo.getMemberEmail());
            System.out.println(vo.getLikeN());
            noticeService.likeDown_notice(vo.getNotice_num(), vo.getMemberEmail(),vo.getLikeN());
         }
}