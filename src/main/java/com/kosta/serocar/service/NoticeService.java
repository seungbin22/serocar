package com.kosta.serocar.service;

import java.util.List;

import com.kosta.serocar.bean.Advertisement;
import com.kosta.serocar.bean.Notice;
import com.kosta.serocar.bean.PageInfo;

public interface NoticeService  {
	
	//공지사항 페이징 및 서칭
	List<Notice> getNoticeList(int page, String keyword, PageInfo pageInfo) throws Exception;

	void registNotice(Notice notice) throws Exception;
   
   //상세 게시물
   Notice getNotice(Integer notice_num)throws Exception;
   //게시글 수정
   void modifyNotice(Notice notice) throws Exception;
   //게시글 삭제
   void deleteNotice(Integer notice_num)throws Exception;
   
   int findLike_notice(int notice_num , String memberEmail);
   void likeUp_notice(int notice_num , String memberEmail , int likeN);
   void likeDown_notice(int notice_num , String memberEmail,int likeN);
   void hit_notice(int notice_num);
   int getLike_notice(int notice_num,int likeN);
   
   
}