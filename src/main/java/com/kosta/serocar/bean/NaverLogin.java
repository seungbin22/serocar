package com.kosta.serocar.bean;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NaverLogin {
	private String memberEmail;
	private String memberNickname;
	private Date memberDate;
	
}
