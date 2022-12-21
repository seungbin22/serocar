package com.kosta.serocar.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.Notice;

@Mapper
@Repository
public interface NoticeDAO {
	
	//공지사항 페이징 및 서칭
	List<Notice> selectNoticeList(Integer row) throws Exception;
	List<Notice> selectNoticeList2(HashMap<String, String> map) throws Exception;
	Integer selectNoticeCount() throws Exception;
	Integer selectNoticeCount2(String keyword) throws Exception;
	
   void insertNotice(Notice notice) throws Exception;
   Integer selectMaxNoticeNum() throws Exception;
   
   //상세 게시물
   Notice selectNotice(Integer notice_num) throws Exception;
   //게시글 수정
   void updateNotice(Notice notice) throws Exception;
   //게시글 삭제
   void deleteNotice(Integer notice_num) throws Exception;
   
   int findLike_notice(Map<String, Object> data);
   void likeUp_notice(Map<String, Object> data);
   void likeDown_notice(Map<String, Object> data);
   int getLike_notice(Map<String, Object> data);
   void hit_notice(int notice_num);
}