package com.kosta.serocar.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.serocar.bean.Community;
import com.kosta.serocar.bean.Note;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.dao.NoteDAO;

@Service
public class NoteServiceImp implements NoteService{
	
	@Autowired 
	private NoteDAO noteDAO;
	
	@Override
	public void insertNote(Note note) {
		noteDAO.insertNote(note);

	}
	
	@Override
	public List<Note> myRecord(int page, String memberNickname, PageInfo pageInfo) {
		int listCount = noteDAO.myRecordCount(memberNickname); // 전체 게시글 수
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
		pageInfo.setKeyword(memberNickname);
		System.out.println("커뮤니티서비스 키워드: " + memberNickname);
		int row1 = (page - 1) * 10 + 1;
		String row = Integer.toString(row1);
		System.out.println("row : " + row);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberNickname", memberNickname);
		map.put("row1", row);

		return noteDAO.myRecord(map);
	}
	

}
