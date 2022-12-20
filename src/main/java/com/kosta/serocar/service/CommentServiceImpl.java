package com.kosta.serocar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.serocar.bean.Comment;
import com.kosta.serocar.dao.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService {

   @Autowired
   private CommentDAO commentDAO;
   
   @Override
   public void CommentRegist(Comment comment)  {
      commentDAO.CommentRegist(comment);
   }

   @Override
   public List<Comment> getList(int comNum) {
      return commentDAO.getList(comNum);
   }

   @Override
   public int getTotal(int comNum){
      return commentDAO.getTotal(comNum);
   }

   @Override
   public List<Comment> myRecord(String writer) {
      return commentDAO.myRecord(writer);
   }

   @Override
   public void commentDelete(Comment comment){
      commentDAO.commentDelete(comment);
      
   }

   @Override
   public List<Comment> getComList(String membernickname) {
      return commentDAO.getComList(membernickname);
   }

   @Override
   public int getTotal_ad(int ad_num) {
      return commentDAO.getTotal_ad(ad_num);
   }

   @Override
   public List<Comment> getList_ad(int ad_num) {
      return commentDAO.getList_ad(ad_num);
   }

}