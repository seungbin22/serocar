package com.kosta.serocar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.serocar.bean.Note;
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
	public List<Note> myRecord(String note_to) {
		return noteDAO.myRecord(note_to);
	}

}
