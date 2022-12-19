package com.kosta.serocar.bean;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Member {
	private int memberNum;
	private String memberId;
	private String memberPassword;
	private String memberEmail;
	private String memberBirth;
	private String memberGender;
	private String memberNickname;
	private Date memberDate;
	private String profile;
	private String businessNum;
	private MultipartFile imageFile;
}
