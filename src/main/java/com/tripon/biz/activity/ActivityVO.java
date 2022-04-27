package com.tripon.biz.activity;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ActivityVO {
	private int act_num;		// 상품번호
	private String act_maintitle;		// 상품명1
	private String act_subtitle;		// 상품명2
	private String act_writer;		// 작성자
	private Date act_regdate;		// 작성일

	private int start;
	private int listcnt;

	private String searchcondition;
	private String searchkeyword;

	private String act_optnum1;		// 상품옵션1
	private String act_optnum2;		// 상품옵션2
	private String act_optnum3;		// 상품옵션3
	private String act_optnum4;		// 상품옵션4

	private String act_optprice1;		// 상품가격1
	private String act_optprice2;		// 상품가격2
	private String act_optprice3;		// 상품가격3
	private String act_optprice4;		// 상품가격4
	private MultipartFile act_mainimg;		// 상품이미지
	private String act_mainpicture;		// 상품이미지
	private String act_content;		// 상품설명
	private String act_announcement;		// 공지사항
	private int category_num;
	
	
	
	public int getAct_num() {
		return act_num;
	}
	public void setAct_num(int act_num) {
		this.act_num = act_num;
	}
	public String getAct_maintitle() {
		return act_maintitle;
	}
	public void setAct_maintitle(String act_maintitle) {
		this.act_maintitle = act_maintitle;
	}
	public String getAct_subtitle() {
		return act_subtitle;
	}
	public void setAct_subtitle(String act_subtitle) {
		this.act_subtitle = act_subtitle;
	}
	public String getAct_writer() {
		return act_writer;
	}
	public void setAct_writer(String act_writer) {
		this.act_writer = act_writer;
	}
	public Date getAct_regdate() {
		return act_regdate;
	}
	public void setAct_regdate(Date act_regdate) {
		this.act_regdate = act_regdate;
	}

	public String getAct_optnum1() {
		return act_optnum1;
	}
	public void setAct_optnum1(String act_optnum1) {
		this.act_optnum1 = act_optnum1;
	}
	public String getAct_optnum2() {
		return act_optnum2;
	}
	public void setAct_optnum2(String act_optnum2) {
		this.act_optnum2 = act_optnum2;
	}
	public String getAct_optnum3() {
		return act_optnum3;
	}
	public void setAct_optnum3(String act_optnum3) {
		this.act_optnum3 = act_optnum3;
	}
	public String getAct_optnum4() {
		return act_optnum4;
	}
	public void setAct_optnum4(String act_optnum4) {
		this.act_optnum4 = act_optnum4;
	}
	
	public String getAct_optprice1() {
		return act_optprice1;
	}
	public void setAct_optprice1(String act_optprice1) {
		this.act_optprice1 = act_optprice1;
	}
	public String getAct_optprice2() {
		return act_optprice2;
	}
	public void setAct_optprice2(String act_optprice2) {
		this.act_optprice2 = act_optprice2;
	}
	public String getAct_optprice3() {
		return act_optprice3;
	}
	public void setAct_optprice3(String act_optprice3) {
		this.act_optprice3 = act_optprice3;
	}
	public String getAct_optprice4() {
		return act_optprice4;
	}
	public void setAct_optprice4(String act_optprice4) {
		this.act_optprice4 = act_optprice4;
	}
	public MultipartFile getAct_mainimg() {
		return act_mainimg;
	}
	public void setAct_mainimg(MultipartFile act_mainimg) {
		this.act_mainimg = act_mainimg;
	}
	public String getAct_content() {
		return act_content;
	}
	public void setAct_content(String act_content) {
		this.act_content = act_content;
	}
	public String getAct_announcement() {
		return act_announcement;
	}
	public void setAct_announcement(String act_announcement) {
		this.act_announcement = act_announcement;
	}

	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getListcnt() {
		return listcnt;
	}
	public void setListcnt(int listcnt) {
		this.listcnt = listcnt;
	}
	public String getAct_mainpicture() {
		return act_mainpicture;
	}
	public void setAct_mainpicture(String act_mainpicture) {
		this.act_mainpicture = act_mainpicture;
	}
	public String getSearchcondition() {
		return searchcondition;
	}
	public void setSearchcondition(String searchcondition) {
		this.searchcondition = searchcondition;
	}
	public String getSearchkeyword() {
		return searchkeyword;
	}
	public void setSearchkeyword(String searchkeyword) {
		this.searchkeyword = searchkeyword;
	}
	
	

}
