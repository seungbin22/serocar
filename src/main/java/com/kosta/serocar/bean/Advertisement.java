package com.kosta.serocar.bean;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Advertisement {
	private int ad_num;
	private String memberNickname;
	private String memberEmail;
	private String businessNum;
	private String ad_title;
	private String ad_content;
	private Date ad_date;
	private int ad_views;
	private int ad_reco;
	private MultipartFile file;
	private int ad_re_ref;
	private int ad_re_lev;
	private int ad_re_seq;
}
