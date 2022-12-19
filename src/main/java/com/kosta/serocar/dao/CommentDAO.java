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
	public int getTotal(int comNum);
	public List<Comment> myRecord(String writer) ;
	public void commentDelete(Comment comment) ;
	public List<Comment> getComList(String membernickname) ;
}
