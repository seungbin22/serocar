package com.kosta.serocar.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.serocar.bean.Community;
import com.kosta.serocar.bean.Member;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

   @Autowired
   MemberDAO memberDAO;

   //회원가입처리
   public void joinMember(Member member) throws Exception {
      memberDAO.insertMember(member);
   }
   //로그인
   public boolean login(Member member) throws Exception {
      Member emember = memberDAO.selectMember(member);
      if(emember != null) {
         return true;
      }else {
         return false;
      }
   }
   //이메일 중복확인
   @Override
   public Member checkEmail(String memberEmail) throws Exception {
      return memberDAO.findMemberEmail(memberEmail);
   }
   @Override
   public void changePassword(Member member) throws Exception {
      memberDAO.updatePassword(member);
   }
   @Override
   public Member nickCheck(Member member) throws Exception {
      return memberDAO.check(member);
   }
   @Override
   public void changeProFile(Member member) throws Exception {
      memberDAO.updateProFile(member);
      
   }

   @Override
      public List<Member> getMemberList(int page, String keyword,PageInfo pageInfo) throws Exception {
         if(keyword == null) {
            int listCount = memberDAO.selectMemberCount(); 
            int maxPage = (int)Math.ceil((double)listCount/10.0); //전체 페이지 수, 올림처리
            int startPage = page/10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
            int endPage = startPage + 10 -1; //현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
            if(endPage>maxPage) endPage = maxPage;
            System.out.println("키워드 널 값"+listCount);
            pageInfo.setPage(page);
            pageInfo.setListCount(listCount);
            pageInfo.setMaxPage(maxPage);
            pageInfo.setStartPage(startPage);
            pageInfo.setEndPage(endPage);
            pageInfo.setKeyword(keyword);
            
            int row = (page-1)*10+1;
            
            return memberDAO.selectMemberList(row);
         }else{
            int listCount = memberDAO.selectMemberCount2(keyword); //전체 게시글 수
            int maxPage = (int)Math.ceil((double)listCount/10.0); //전체 페이지 수, 올림처리
            int startPage = page/10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
            int endPage = startPage + 10 -1; //현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
            if(endPage>maxPage) endPage = maxPage;
            System.out.println("키워드 널 값이 아닌"+listCount);
            pageInfo.setPage(page);
            pageInfo.setListCount(listCount);
            pageInfo.setMaxPage(maxPage);
            pageInfo.setStartPage(startPage);
            pageInfo.setEndPage(endPage);
            pageInfo.setKeyword(keyword);
            System.out.println("커뮤니티서비스 키워드: "+keyword);
            int row1 = (page-1)*10+1;
            String row = Integer.toString(row1);
            System.out.println("row : "+row);
            
            
            HashMap<String, String> map = new HashMap<String, String>();
            map.put("keyword", keyword);
            map.put("row1", row);
            
            return memberDAO.selectMemberList2(map);
         }
      }
   
   @Override
   public Member checkBusiness(String businessNum) throws Exception {
      return memberDAO.findMemberBusiness(businessNum);
   }
   @Override
   public void deleteMember(Integer memberNum) throws Exception {
      memberDAO.deleteMember(memberNum);
      
   }
   }