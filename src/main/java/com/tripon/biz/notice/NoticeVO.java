package com.tripon.biz.notice;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int ntc_seq;
	private String ntc_mem_id;
	private String ntc_title;
	private String ntc_content;
	private Date ntc_regdate;
	private int ntc_count;
	private String searchCondition;
	private String searchKeyword;
	private MultipartFile uploadFile;
	private String ntc_filename;
	private String ntc_target;
	private int total;
	private int listCnt = 10;
	private int pageNum;
	private int rownum;
	private int[] deleteSeq;
	
	public int[] getDeleteSeq() {
		return deleteSeq;
	}
	public void setDeleteSeq(String[] deleteSeq) {
		int[] arr1 = new int[deleteSeq.length];
		for(int i = 0; i < deleteSeq.length; i++) {
			arr1[i] = Integer.parseInt(deleteSeq[i]);
		}
		this.deleteSeq = arr1;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getNtc_filename() {
		return ntc_filename;
	}
	public void setNtc_filename(String ntc_filename) {
		this.ntc_filename = ntc_filename;
	}
	public String getNtc_target() {
		return ntc_target;
	}
	public void setNtc_target(String ntc_target) {
		this.ntc_target = ntc_target;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		pageNum = ((pageNum - 1) * listCnt);
		this.pageNum = pageNum;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getNtc_seq() {
		return ntc_seq;
	}
	public void setNtc_seq(int ntc_seq) {
		this.ntc_seq = ntc_seq;
	}
	public String getNtc_mem_id() {
		return ntc_mem_id;
	}
	public void setNtc_mem_id(String ntc_mem_id) {
		this.ntc_mem_id = ntc_mem_id;
	}
	public String getNtc_title() {
		return ntc_title;
	}
	public void setNtc_title(String ntc_title) {
		this.ntc_title = ntc_title;
	}
	public String getNtc_content() {
		return ntc_content;
	}
	public void setNtc_content(String ntc_content) {
		ntc_content = ntc_content.replace("\n", "<br>");
		ntc_content = ntc_content.replace(" ", "&nbsp;");
		this.ntc_content = ntc_content;
	}
	public Date getNtc_regdate() {
		return ntc_regdate;
	}
	public void setNtc_regdate(Date ntc_regdate) {
		this.ntc_regdate = ntc_regdate;
	}
	public int getNtc_count() {
		return ntc_count;
	}
	public void setNtc_count(int ntc_count) {
		this.ntc_count = ntc_count;
	}
}
