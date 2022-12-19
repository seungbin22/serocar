package com.kosta.serocar.service;

import java.util.List;

import com.kosta.serocar.bean.Note;
import com.kosta.serocar.bean.PageInfo;

public interface NoteService {
		//쪽지 보내기
		void insertNote(Note note);
		//받은 쪽지 불러오기
		List<Note> myRecord(int page, String memberEmail, PageInfo pageInfo);
		
}
