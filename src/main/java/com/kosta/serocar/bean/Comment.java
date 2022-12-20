package com.kosta.serocar.bean;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Comment {
	private int com_no;
	private String memberNickname;
	private String com_content;
	private int com_like;
	private int com_hate;
	private String re_com;
	private int com_type;
	private Timestamp com_regdate;
	private int comNum;
	private int ad_num;
	private int notice_num;
}
