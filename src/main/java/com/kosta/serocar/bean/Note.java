package com.kosta.serocar.bean;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Note {
	private String note_to;
	private String note_from;
	private int note_no;
	private String note_content;
	private String memberEmail;
	private Date note_date;
}
