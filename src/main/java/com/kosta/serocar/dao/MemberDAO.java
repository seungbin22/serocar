package com.kosta.serocar.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.Member;

@Mapper
@Repository
public interface MemberDAO {
   //회원가입
   void insertMember(Member member) throws Exception;
   //로그인
   Member selectMember(Member member) throws Exception;
   //이메일 중복확인
   Member findMemberEmail(String memberEmail) throws Exception;
   
   Member checkNickname(String memberNickname) throws Exception;
   //비밀번호 변경
   void updatePassword(Member member) throws Exception;
   //프로필 변경
   void updateProFile(Member member) throws Exception;
   //계정 삭제
   void deleteMember(Integer memberNum) throws Exception;
   
   //관리자 페이지 회원불러오기
   List<Member> selectMemberList(Integer row) throws Exception;
   List<Member> selectMemberList2(HashMap<String, String> map) throws Exception;
   Integer selectMemberCount() throws Exception;
   Integer selectMemberCount2(String keyword) throws Exception;
   //변외
   Member check(Member member) throws Exception;
   //사업자 등록증 중복확인
   Member findMemberBusiness(String businessNum) throws Exception;
   
   //커뮤니티 프로필 불러오기
   String getprofile(Integer comNum) throws Exception;
   //홍보글 프로필 불러오기
   String getprofile_ad(Integer ad_num) throws Exception;
   //공지사항 프로필 불러오기
   String getprofile_notice(Integer notice_num) throws Exception;
}