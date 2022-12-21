package com.kosta.serocar.service;

import java.util.List;

import com.kosta.serocar.bean.Member;
import com.kosta.serocar.bean.PageInfo;

public interface MemberService {
   
   //회원가입처리
   void joinMember(Member member) throws Exception ;
   //로그인
   boolean login(Member member) throws Exception ;
   //이메일 중복확인
   Member checkEmail(String memberEmail) throws Exception;
   //비밀번호 변경
   void changePassword(Member member) throws Exception;
   //프로필 변경
   void changeProFile(Member member) throws Exception;
   //계정 삭제
   void deleteMember(Integer memberNum) throws Exception;
   
   //관리자 페이지 회원정보 불러오기
   List<Member> getMemberList(int page, String keyword, PageInfo pageInfo) throws Exception;
   //변외
   Member nickCheck(Member member) throws Exception ;
   //사업자 등록증 중복체크
   Member checkBusiness(String businessNum) throws Exception;
}