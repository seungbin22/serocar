package com.kosta.serocar.bean;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Community {
	private int comNum;
	private String memberNickname;
	private String comTitle;
	private String comContent;
	private Date comDate;
	private int comViews;
	private int comReco;
	private MultipartFile file;
	private int com_re_ref;
	private int com_re_lev;
	private int com_re_seq;
	private String memberEmail;
	private int comment;
}
