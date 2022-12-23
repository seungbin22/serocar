package com.kosta.serocar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.serocar.bean.Notice;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.dao.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

   @Autowired
   NoticeDAO noticeDAO;

   @Override
   public void registNotice(Notice notice) throws Exception {
      Integer notice_num = noticeDAO.selectMaxNoticeNum();
      if (notice_num == null)
         notice_num = 1;
      else
         notice_num = notice_num + 1;
      notice.setNotice_num(notice_num);
      notice.setNotice_views(0);
      noticeDAO.insertNotice(notice);

   }

   @Override
   public List<Notice> getNoticeList(int page, String keyword, PageInfo pageInfo) throws Exception {
      if (keyword == null) {
         int listCount = noticeDAO.selectNoticeCount();
         int maxPage = (int) Math.ceil((double) listCount / 10.0); // 전체 페이지 수, 올림처리
         int startPage = page / 10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
         int endPage = startPage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
         if (endPage > maxPage)
            endPage = maxPage;
         System.out.println("키워드 널 값" + listCount);
         pageInfo.setPage(page);
         pageInfo.setListCount(listCount);
         pageInfo.setMaxPage(maxPage);
         pageInfo.setStartPage(startPage);
         pageInfo.setEndPage(endPage);
         pageInfo.setKeyword(keyword);

         int row = (page - 1) * 10 + 1;

         return noticeDAO.selectNoticeList(row);
      } else {
         int listCount = noticeDAO.selectNoticeCount2(keyword); // 전체 게시글 수
         int maxPage = (int) Math.ceil((double) listCount / 10.0); // 전체 페이지 수, 올림처리
         int startPage = page / 10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
         int endPage = startPage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
         if (endPage > maxPage)
            endPage = maxPage;
         System.out.println("키워드 널 값이 아닌" + listCount);
         pageInfo.setPage(page);
         pageInfo.setListCount(listCount);
         pageInfo.setMaxPage(maxPage);
         pageInfo.setStartPage(startPage);
         pageInfo.setEndPage(endPage);
         pageInfo.setKeyword(keyword);
         System.out.println("커뮤니티서비스 키워드: " + keyword);
         int row1 = (page - 1) * 10 + 1;
         String row = Integer.toString(row1);
         System.out.println("row : " + row);

         HashMap<String, String> map = new HashMap<String, String>();
         map.put("keyword", keyword);
         map.put("row1", row);

         return noticeDAO.selectNoticeList2(map);
      }

   }

   @Override
   public Notice getNotice(Integer notice_num) throws Exception {
      return noticeDAO.selectNotice(notice_num);
   }

   @Override
   public void modifyNotice(Notice Notice) throws Exception {
      noticeDAO.updateNotice(Notice);
   }

   @Override // 커뮤니티 글 삭제
   public void deleteNotice(Integer notice_num) throws Exception {
      noticeDAO.deleteNotice(notice_num);
   }

   @Override
   public void hit_notice(int notice_num) {
      noticeDAO.hit_notice(notice_num);
   }

   @Override
   public int findLike_notice(int notice_num, String memberEmail) {
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("notice_num", notice_num);
         map.put("memberEmail", memberEmail);
         return noticeDAO.findLike_notice(map);
      }

   @Override
   public void likeUp_notice(int notice_num, String memberEmail, int likeN) {
        Map<String, Object> map = new HashMap<String, Object>();
         map.put("notice_num", notice_num);
         map.put("memberEmail", memberEmail);
         map.put("likeN", likeN);
         noticeDAO.likeUp_notice(map);
      }

   @Override
   public void likeDown_notice(int notice_num, String memberEmail, int likeN) {
        Map<String, Object> map = new HashMap<String, Object>();
         map.put("notice_num", notice_num);
         map.put("memberEmail", memberEmail);
         map.put("likeN", likeN);
         noticeDAO.likeDown_notice(map);
      }

   @Override
   public int getLike_notice(int notice_num, int likeN) {
      Map<String, Object> map = new HashMap<String, Object>();
         map.put("notice_num", notice_num);
         map.put("likeN", likeN);
         return noticeDAO.getLike_notice(map);   
      }
   public void updateComment(int notice_num) {
	   noticeDAO.updateComment(notice_num);
	   }
	   public void updateLike(int notice_num) {
		   noticeDAO.updateLike(notice_num);
	   }
}