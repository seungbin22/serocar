package com.kosta.serocar.service;

import java.util.List;

import com.kosta.serocar.bean.Comment;

public interface CommentService {

   void CommentRegist(Comment comment); //댓글 등록
   List<Comment> getList(int comNum); //커뮤니티 목록 요청
   List<Comment> myRecord(String writer);
   void commentDelete(Comment comment);
   
   List<Comment> getComList(String membernickname); //어드민용 회원 댓글 불러오긔
   
   int getTotal(int comNum); //커뮤니티 댓글 개수
   int getTotal2(int notice_num); //커뮤니티 댓글 개수
   
   List<Comment> getList_ad(int ad_num); //홍보글 목록 요청
   int getTotal_ad(int ad_num); //홍보글 댓글 개수
   
   List<Comment> getList_notice(int notice_num); //공지사항 목록 요청
   int getTotal_notice(int notice_num); //공지사항 댓글 개수
}