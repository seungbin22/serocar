package com.kosta.serocar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.Comment;

@Mapper
@Repository
public interface CommentDAO {
   void CommentRegist(Comment commet) ;
   public List<Comment> getList(int comNum) ;
   public List<Comment> myRecord(String writer) ;
   public void commentDelete(Comment comment) ;
   public List<Comment> getComList(String membernickname) ;
   
   public int getTotal(int comNum); //커뮤니티 댓글 갯수
   public int getTotal2(int notice_num); //커뮤니티 댓글 갯수
   
   public int getTotal_ad(int ad_num); //홍보글 댓글 갯수
   public List<Comment> getList_ad(int ad_num) ;
   
   public int getTotal_notice(int notice_num); //공지사항 댓글 갯수
   public List<Comment> getList_notice(int notice_num) ;
}