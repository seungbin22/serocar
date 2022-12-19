package com.kosta.serocar.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.serocar.bean.Note;
import com.kosta.serocar.service.NoteService;


@Controller
@RequestMapping("/note")
public class NoteController {
	@Autowired 
	private NoteService noteService;

	@ResponseBody
	@PostMapping("/insertNote")
	public String insertNote(@RequestBody Note note, HttpSession session) {
		System.out.println("쪽지 보내기 요청");
		
		String note_from =(String) session.getAttribute("memberNickname");
		String note_memberemail =(String) session.getAttribute("memberEmail");
		System.out.println("보낸이: " + note_from);
		note.setNote_from(note_from);
		note.setMemberEmail(note_memberemail);
		System.out.println("들어온 객체: " + note);
		
		noteService.insertNote(note);
		System.out.println("쪽지 보내기 완료");
		
		return "쪽지 보내기 성공";
	}
	
	//받은 쪽지 불러오기
	@GetMapping("/myRecord")
	public void myRecord(String note_to, Model model) {
		System.out.println("받은 쪽지 불러오기");
		System.out.println("userId:" + note_to);
		
		model.addAttribute("userId",note_to);
		model.addAttribute("note", noteService.myRecord(note_to));
		System.out.println(noteService.myRecord(note_to));
	}

}
