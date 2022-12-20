package com.kosta.serocar.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.Note;

@Mapper
@Repository
public interface NoteDAO {
	void insertNote(Note note);
	
	List<Note> myRecord(HashMap<String, String> map);
	
	Integer myRecordCount(String memberNickname);
	
}
