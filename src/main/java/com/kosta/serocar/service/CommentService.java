package com.kosta.serocar.service;

import java.util.List;

import com.kosta.serocar.bean.Comment;

public interface CommentService {

	void CommentRegist(Comment comment); //댓글 등록
	List<Comment> getList(int comNum); //목록 요청
	int getTotal(int comNum); //댓글 개수
	List<Comment> myRecord(String writer);
	void commentDelete(Comment comment);
	
	List<Comment> getComList(String membernickname); //어드민용 회원 댓글 불러오긔
}
