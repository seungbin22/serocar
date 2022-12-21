package com.kosta.serocar.bean;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Notice {
	private int notice_num;
	private String notice_title;
	private String notice_content;
	private int notice_views;
	private int notice_reco;
	private Date notice_date;
	private String memberEmail;
	private String memberNickname;
}
