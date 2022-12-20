package com.kosta.serocar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.serocar.bean.Advertisement;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.dao.AdvertisementDAO;

@Service
public class AdvertisementServiceImpl implements AdvertisementService {

   @Autowired
   AdvertisementDAO advertisementDAO;

   @Override
   public void registAdvertisement(Advertisement advertisement) throws Exception {
      Integer ad_num = advertisementDAO.selectMaxAdvertisementNum();
      if (ad_num == null)
         ad_num = 1;
      else
         ad_num = ad_num + 1;
      advertisement.setAd_num(ad_num);
      advertisement.setAd_re_ref(ad_num);
      advertisement.setAd_re_lev(0);
      advertisement.setAd_re_seq(0);
      advertisement.setAd_views(0);
      advertisementDAO.insertAdvertisement(advertisement);

   }

   @Override
   public List<Advertisement> getAdvertisementList(int page, String keyword, PageInfo pageInfo) throws Exception {
      if (keyword == null) {
         int listCount = advertisementDAO.selectAdvertisementCount();
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

         return advertisementDAO.selectAdvertisementList(row);
      } else {
         int listCount = advertisementDAO.selectAdvertisementCount2(keyword); // 전체 게시글 수
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

         return advertisementDAO.selectAdvertisementList2(map);
      }

   }

   @Override
   public Advertisement getAdvertisement(Integer ad_num) throws Exception {
      return advertisementDAO.selectAdvertisement(ad_num);
   }

   @Override
   public void modifyAdvertisement(Advertisement advertisement) throws Exception {
      advertisementDAO.updateAdvertisement(advertisement);
   }

   @Override // 커뮤니티 글 삭제
   public void deleteAdvertisement(Integer ad_num) throws Exception {
      advertisementDAO.deleteAdvertisement(ad_num);
   }

   @Override
   public void hit_ad(int ad_num) {
      advertisementDAO.hit_ad(ad_num);
   }

   @Override
   public int findLike_ad(int ad_num, String memberEmail) {
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("ad_num", ad_num);
         map.put("memberEmail", memberEmail);
         return advertisementDAO.findLike_ad(map);
      }

   @Override
   public void likeUp_ad(int ad_num, String memberEmail, int likeN) {
        Map<String, Object> map = new HashMap<String, Object>();
         map.put("ad_num", ad_num);
         map.put("memberEmail", memberEmail);
         map.put("likeN", likeN);
         advertisementDAO.likeUp_ad(map);
      }

   @Override
   public void likeDown_ad(int ad_num, String memberEmail, int likeN) {
        Map<String, Object> map = new HashMap<String, Object>();
         map.put("ad_num", ad_num);
         map.put("memberEmail", memberEmail);
         map.put("likeN", likeN);
         advertisementDAO.likeDown_ad(map);
      }

   @Override
   public int getLike_ad(int ad_num, int likeN) {
      Map<String, Object> map = new HashMap<String, Object>();
         map.put("ad_num", ad_num);
         map.put("likeN", likeN);
         return advertisementDAO.getLike_ad(map);   
      }

}