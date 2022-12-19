package com.kosta.serocar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.serocar.bean.Community;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.dao.CommunityDAO;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	CommunityDAO communityDAO;

	@Override
	public void registCommunity(Community community) throws Exception {
		Integer comNum =  communityDAO.selectMaxCommunityNum();
		if(comNum==null) comNum = 1;
		else comNum = comNum+1;
		community.setComNum(comNum);
		community.setCom_re_ref(comNum);
		community.setCom_re_lev(0);
		community.setCom_re_seq(0);
		community.setComViews(0);
		communityDAO.insertCommunity(community);
		
	}

	@Override
	   public List<Community> getCommunityList(int page, String keyword,PageInfo pageInfo) throws Exception {
	      if(keyword == null) {
	         int listCount = communityDAO.selectCommunityCount();
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
	         
	         return communityDAO.selectCommunityList(row);
	      }else{
	         int listCount = communityDAO.selectCommunityCount2(keyword); //전체 게시글 수
	         int maxPage = (int)Math.ceil((double)listCount/10.0); //전체 페이지 수, 올림처리
	         int startPage = page/10 * 10 + 1; // 현재 페이지에 보여줄 시작페이지 버튼 (1,11,21 등...)
	         int endPage = startPage + 10 -1; //현재 페이지에 보여줄 마지막 페이지 버튼 (10,20,30 등 ...)
	         if(endPage>maxPage) endPage = maxPage;
	         System.out.println("서치 리스트 갯수: "+listCount);
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
	         
	         return communityDAO.selectCommunityList2(map);
	      }
	      
	   }

	@Override
	public Community getCommunity(Integer comNum) throws Exception {
		return communityDAO.selectCommunity(comNum);
	}

	@Override
	public void modifyCommunity(Community community) throws Exception {
		communityDAO.updateCommunity(community);
	}

	@Override//커뮤니티 글 삭제
	public void deleteCommunity(Integer comNum) throws Exception {
		communityDAO.deleteCommunity(comNum);
	}
	
	@Override
	   public int findLike(int comNum, String memberEmail) {
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("comNum", comNum);
	      map.put("memberEmail", memberEmail);
	      return communityDAO.findLike(map);
	   }
	   
	   @Override
	   public void likeUp(int comNum, String memberEmail , int likeN) {
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("comNum", comNum);
	      map.put("memberEmail", memberEmail);
	      map.put("likeN", likeN);
	      communityDAO.likeUp(map);
	   }
	   @Override
	   public void likeDown(int comNum, String memberEmail, int likeN) {
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("comNum", comNum);
	      map.put("memberEmail", memberEmail);
	      map.put("likeN", likeN);
	      communityDAO.likeDown(map);
	   }
	   @Override
	   public int getLike(int comNum,int likeN) {
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("comNum", comNum);
	      map.put("likeN", likeN);
	      return communityDAO.getLike(map);   
	   }

	   @Override
	   public void hit(int comNum) {
	      communityDAO.hit(comNum);
	   }

}
