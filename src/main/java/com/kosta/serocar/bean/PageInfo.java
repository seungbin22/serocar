package com.kosta.serocar.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageInfo {
   private int page;
   private int maxPage;
   private int startPage;
   private int endPage;
   private int listCount;
   private String keyword;
   private String type;
}