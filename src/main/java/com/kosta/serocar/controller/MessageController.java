package com.kosta.serocar.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.serocar.bean.Message;
import com.kosta.serocar.dao.MessageDAO;

@Controller
public class MessageController {
	
	@Autowired
	private MessageDAO messageDAO;
	// 메세지 목록
	@RequestMapping (value="/message_list.do")
	public String message_list(HttpServletRequest request, HttpSession session) {
	// System.out.println("현대사용자 nick: + session.getAttribute("nick"));
		String nick = (String) session.getAttribute("nick");
		
		Message message = new Message();
		message.setNick(nick);
		
		// 메세지 리스트
		ArrayList<Message> list= messageDAO.messageList(message);
		request.setAttribute("list", list);
		
		return "message/message_list";
	}
	
	@RequestMapping (value="/message_ajax_list.do")
	public String message_ajax_lst(HttpServletRequest request, HttpSession session) {
		String nick = (String) session.getAttribute("nick");
		Message message = new Message();
		message.setNick(nick);
		
		ArrayList<Message> list = messageDAO.messageList(message);
		request.setAttribute("list", list);
		
		return "message/message_ajax_list";
	}
	
	@RequestMapping (value="/message_content_list.do")
	public String message_content_lst(HttpServletRequest request, HttpSession session) {
		int room = Integer.parseInt(request.getParameter("room"));
		Message message = new Message();
		message.setRoom(room);
		message.setNick((String) session.getAttribute("nick"));
		
		ArrayList<Message> clist = messageDAO.roomcontentList(message);
		request.setAttribute("clist", clist);
		
		return "message/message_content_list";
	}
	
	@ResponseBody
	@RequestMapping(value="/message_send_inlist.do")
	public int message_send_inlist(@RequestParam int room, @RequestParam String other_nick,
							@RequestParam String content, HttpSession session) {
		Message message = new Message();
		message.setRoom(room);
		message.setSender((String) session.getAttribute("nick"));
		message.setTagetNick(other_nick);
		message.setContent(content);
		
		int flag = messageDAO.messageSendInlist(message);
		
		return flag;
	}
}
	
	
	
	
	
