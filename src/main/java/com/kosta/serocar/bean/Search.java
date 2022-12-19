package com.kosta.serocar.bean;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Search {
	private int carNum;
	private String carName;
	private int carMoney;
	private String carType;
	private String carBrand;
	private String carImage;
	private String carLink;
	private MultipartFile file;
	
}
