package com.kosta.serocar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.serocar.bean.Message;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//메세지 리스트
	public ArrayList<Message> messageList(Message message) {
		String nick = message.getNick();
		ArrayList<Message> list = (ArrayList) sqlSession.selectList("message_list", message);
		
		for(Message mto : list) {
			mto.setNick(nick);
			int unread = sqlSession.selectOne("count_unread", mto);
			String profile = sqlSession.selectOne("get_other_profile",mto);
			mto.setUnread(unread);
			mto.setProfile(profile);
			if (nick.equals(mto.getSender())) {
				mto.setOther_nick(mto.getTagetNick());
			}else {
				mto.setOther_nick(mto.getSender());
			}
		}
		return list;
	}
	
	//room 별 메세지 내용을 가져온다
	public ArrayList<Message> roomcontentList(Message message){
		System.out.println("room: " + message.getRoom());
		System.out.println("받는이: "+ message.getTagetNick());
		System.out.println("nickL "+ message.getNick());
		
		ArrayList<Message> clist = (ArrayList) sqlSession.selectList("room_content_list", message);
		sqlSession.update("message_read_chk", message);
		
		return clist;
	}
	
	public int messageSendInlist(Message message) {
		
		if(message.getRoom() == 0) {
			int exist_chat = sqlSession.selectOne("exist_chat", message);
			if(exist_chat==0) {
				int max_room = sqlSession.selectOne("max_room", message);
				message.setRoom(max_room+1);
			}else {
				int room = Integer.parseInt(sqlSession.selectOne("select_room", message));
				message.setRoom(room);
			}
		}
		int flag = sqlSession.insert("messageSendInlist",message);
		return flag;
	}
}
