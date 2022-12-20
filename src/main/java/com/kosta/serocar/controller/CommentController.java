package com.kosta.serocar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.serocar.bean.Comment;
import com.kosta.serocar.service.CommentService;

@RestController
@RequestMapping("/Comment")
public class CommentController {
   
   @Autowired
   private CommentService commentService;
   
   //커뮤니티 게시글 댓글
   @PostMapping("/InsertComment")
   public String InsertComment(@RequestBody Comment comment,HttpSession session) {
      System.out.println("댓글 등록 통신 성공");
      System.out.println("닉네임코멘드넘버: "+comment);
      
      if(session.getAttribute("memberNickname") == null) {
         return "fail";
      } else {
         System.out.println("로긘함. 스크랩 진행");
         
         commentService.CommentRegist(comment);
         System.out.println("댓글 등록 서비스 성공");
         return "InsertSuccess";
      }
   }

   @GetMapping("/CommentList/{comNum}")
   public Map<String, Object> getList(@PathVariable int comNum, Model model) {
      System.out.println("댓글 목록 컨트롤러 동작");
      List<Comment> list = commentService.getList(comNum);
      int total = commentService.getTotal(comNum);
      
      //ModelAndView view = new ModelAndView();
      System.out.println("댓글 갯수 " + commentService.getTotal(comNum));
      //view.setViewName("/board/JBoardList");
      Map<String, Object> map = new HashMap<>();
      map.put("list", list);
      map.put("total", total);
      
      return map;
   }
   
   //커뮤니티 게시글 댓글
   @PostMapping("/InsertComment_ad")
   public String InsertComment_ad(@RequestBody Comment comment,HttpSession session) {
      System.out.println("댓글 등록 통신 성공");
      System.out.println("닉네임코멘드넘버: "+comment);
      
      if(session.getAttribute("memberNickname") == null) {
         return "fail";
      } else {
         System.out.println("로긘함. 스크랩 진행");
         
         commentService.CommentRegist(comment);
         System.out.println("댓글 등록 서비스 성공");
         return "InsertSuccess";
      }
   }

   @GetMapping("/CommentList_ad/{ad_num}")
   public Map<String, Object> getList_ad(@PathVariable int ad_num, Model model) {
      System.out.println("댓글 목록 컨트롤러 동작");
      System.out.println(ad_num);
      List<Comment> list = commentService.getList_ad(ad_num);
      int total = commentService.getTotal_ad(ad_num);
      System.out.println(list);
      System.out.println(total);
      //ModelAndView view = new ModelAndView();
      System.out.println("댓글 갯수 " + commentService.getTotal_ad(ad_num));
      //view.setViewName("/board/JBoardList");
      Map<String, Object> map = new HashMap<>();
      map.put("list", list);
      map.put("total", total);
      
      return map;
   }
}