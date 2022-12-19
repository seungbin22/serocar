package com.kosta.serocar.bean;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Message {
	
	private int messagId;
	private String tagetNick;
	private String sender;
	private String content;
	private Date openDate;
	private Date sendDate;
	private int room;
	private int read_Chk;

	private String other_nick;
	private String profile;
	private String nick;
	private int unread;
}
