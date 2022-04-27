package com.tripon.biz.faq;

import java.sql.Date;

public class FaqVO {
	private int faq_seq;
	private String faq_mem_id;
	private String faq_title;
	private String faq_content;
	private Date faq_regdate;
	private int faq_count;
	private String faq_category;
	
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}
	public int getFaq_seq() {
		return faq_seq;
	}
	public void setFaq_seq(int faq_seq) {
		this.faq_seq = faq_seq;
	}
	public String getFaq_mem_id() {
		return faq_mem_id;
	}
	public void setFaq_mem_id(String faq_mem_id) {
		this.faq_mem_id = faq_mem_id;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public Date getFaq_regdate() {
		return faq_regdate;
	}
	public void setFaq_regdate(Date faq_regdate) {
		this.faq_regdate = faq_regdate;
	}
	public int getFaq_count() {
		return faq_count;
	}
	public void setFaq_count(int faq_count) {
		this.faq_count = faq_count;
	}
	
}
