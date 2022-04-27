package com.tripon.biz.review;

import java.util.Date;

public class ReviewVO {
	private int review_num;		
	private String review_content;
	private String review_writer;
	private Date review_date;
	private int activity_num;
	
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getActivity_num() {
		return activity_num;
	}
	public void setActivity_num(int activity_num) {
		this.activity_num = activity_num;
	}
	
	

	
	
}