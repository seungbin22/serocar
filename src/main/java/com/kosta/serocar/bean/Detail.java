package com.kosta.serocar.bean;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Detail {
	
	private int carNum;
	private String carName;
	private String carType;
	private String carBrand;
	private String carImage;
	private String carLike;
	private MultipartFile file;
	private String carComment;
	private int carMoney;
	private int minMoney;
	private int maxMoney;
	private String carLink;
}
