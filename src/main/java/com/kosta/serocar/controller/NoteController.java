package com.kosta.serocar.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.serocar.bean.Note;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.dao.DetailDAO;
import com.kosta.serocar.dao.MyPageDAO;
import com.kosta.serocar.dao.NoteDAO;
import com.kosta.serocar.service.NoteService;


@Controller
public class NoteController {
   @Autowired 
   private NoteService noteService;
   
   @Autowired 
   NoteDAO noteDAO;
   
   @Autowired
   MyPageDAO myPageDAO;
   
   @Autowired
   DetailDAO detailDAO;
   

   @ResponseBody
   @PostMapping("/insertNote")
   public String insertNote(@RequestBody Note note, HttpSession session) {
      System.out.println("쪽지 보내기 요청");
      
      String note_from =(String) session.getAttribute("memberNickname");
      String note_memberemail =(String) session.getAttribute("memberEmail");
      System.out.println("보낸이: " + note_from);
      note.setNote_from(note_from);
      note.setMemberEmail(note_memberemail);
      System.out.println("들어온 객체: " + note);
      
      noteService.insertNote(note);
      System.out.println("쪽지 보내기 완료");
      
      return "쪽지 보내기 성공";
   }
   
   //받은 쪽지 불러오기
   @GetMapping("/myRecord")
   public ModelAndView myRecord(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,@RequestParam(value = "memberNickname", required = false) String memberNickname,@RequestParam(value = "memberEmail", required = false) String memberEmail
      ,Note note, Model model, HttpSession session) throws Exception {
      ModelAndView mav = new ModelAndView();
      PageInfo pageInfo = new PageInfo();
      
      System.out.println("받은 쪽지 불러오기");
      //String memberEmail =(String) session.getAttribute("memberEmail");
      note.setMemberEmail(memberNickname);
      
      List<Note> noteList = noteService.myRecord(page, memberNickname, pageInfo);
      System.out.println(noteList);
      mav.addObject("noteList",noteList);
      mav.addObject("pageInfo", pageInfo);
      mav.setViewName("myPage/myPageChatting.tiles");
      int listCount = myPageDAO.selectCommunityCount2(memberEmail);
      mav.addObject("count2",listCount);
      mav.addObject("carCount", detailDAO.selectCarNum(memberEmail));
      int listCount_ad = myPageDAO.selectAdvertisementCount2(memberEmail);
      mav.addObject("count_ad",listCount_ad);
      int myRecordCount = noteDAO.myRecordCount(memberNickname);
      mav.addObject("chatCount", myRecordCount);
      return mav;
   }
   
   // 마이페이지 쪽지함 삭제
   @RequestMapping(value = "/myPage_delete_notice", method = { RequestMethod.POST, RequestMethod.GET })
   String delete_notice(@RequestParam("note_no") Integer note_no, @RequestParam(value="memberEmail") String memberEmail,
         @RequestParam(value="businessNum") String businessNum, @RequestParam(value="memberNickname") String memberNickname) throws Exception {
	  String memberNickname1 = URLEncoder.encode(memberNickname,"UTF-8");
	  
      noteDAO.deleteMyPage_note(note_no);
      System.out.println("컨트롤러 컴넘 : "+note_no);
      return "redirect:/myRecord?note_no="+note_no+"&memberEmail="+memberEmail+"&memberNickname="+memberNickname1+"&businessNum="+businessNum;
   }
}