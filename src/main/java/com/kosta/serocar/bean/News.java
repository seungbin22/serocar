package com.kosta.serocar.bean;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class News {
	private int newsNum;
	private String newsTitle;
	private String newsImage;
	private String newsContent;
	private int newsReco;
	private Date newsDate;
	private MultipartFile imageFile;
	
}
