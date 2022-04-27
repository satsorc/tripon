package com.tripon.biz.purchaseManager;

import java.util.Date;

public class PurchaseManagerVO {
	private int pur_num; 			//정렬 분류 번호
	private int pur_statenum;		//0=결제 취소, 1=결제 완료, (그 외)=이용 완료
	private String pur_impid;		//결제 고유ID
	private String pur_merchantid;	//결제 거래ID (결제 취소에 이용)
	private String pur_user_id;		//유저 아이디
	private String pur_user_name; 	//유저 이름
	private Date pur_purchasedate;	//결제 날짜
	private Date pur_bookingdate;	//예약 날짜
	private String pur_act_title; 	//상품 이름
	private String pur_opt_name_1; 	//패키지 옵션 1
	private String pur_opt_name_2; 	//패키지 옵션 2
	private String pur_opt_name_3; 	//패키지 옵션 3
	private String pur_opt_name_4; 	//패키지 옵션 4
	private int pur_opt_count_1; 	//패키지 옵션 수량 1
	private int pur_opt_count_2; 	//패키지 옵션 수량 2
	private int pur_opt_count_3; 	//패키지 옵션 수량 3
	private int pur_opt_count_4; 	//패키지 옵션 수량 4
	private int pur_price; 			//가격
	
	private int start;
	private int endPage;
	private int Listcnt;
	
	public int getPur_num() {
		return pur_num;
	}
	public void setPur_num(int pur_num) {
		this.pur_num = pur_num;
	}
	public int getPur_statenum() {
		return pur_statenum;
	}
	public void setPur_statenum(int pur_statenum) {
		this.pur_statenum = pur_statenum;
	}
	public String getPur_impid() {
		return pur_impid;
	}
	public void setPur_impid(String pur_impid) {
		this.pur_impid = pur_impid;
	}
	public String getPur_merchantid() {
		return pur_merchantid;
	}
	public void setPur_merchantid(String pur_merchantid) {
		this.pur_merchantid = pur_merchantid;
	}
	public String getPur_user_id() {
		return pur_user_id;
	}
	public void setPur_user_id(String pur_user_id) {
		this.pur_user_id = pur_user_id;
	}
	public String getPur_user_name() {
		return pur_user_name;
	}
	public void setPur_user_name(String pur_user_name) {
		this.pur_user_name = pur_user_name;
	}
	public Date getPur_purchasedate() {
		return pur_purchasedate;
	}
	public void setPur_purchasedate(Date pur_purchasedate) {
		this.pur_purchasedate = pur_purchasedate;
	}
	public Date getPur_bookingdate() {
		return pur_bookingdate;
	}
	public void setPur_bookingdate(Date pur_bookingdate) {
		this.pur_bookingdate = pur_bookingdate;
	}
	public String getPur_act_title() {
		return pur_act_title;
	}
	public void setPur_act_title(String pur_act_title) {
		this.pur_act_title = pur_act_title;
	}
	public String getPur_opt_name_1() {
		return pur_opt_name_1;
	}
	public void setPur_opt_name_1(String pur_opt_name_1) {
		this.pur_opt_name_1 = pur_opt_name_1;
	}
	public String getPur_opt_name_2() {
		return pur_opt_name_2;
	}
	public void setPur_opt_name_2(String pur_opt_name_2) {
		this.pur_opt_name_2 = pur_opt_name_2;
	}
	public String getPur_opt_name_3() {
		return pur_opt_name_3;
	}
	public void setPur_opt_name_3(String pur_opt_name_3) {
		this.pur_opt_name_3 = pur_opt_name_3;
	}
	public String getPur_opt_name_4() {
		return pur_opt_name_4;
	}
	public void setPur_opt_name_4(String pur_opt_name_4) {
		this.pur_opt_name_4 = pur_opt_name_4;
	}
	public int getPur_opt_count_1() {
		return pur_opt_count_1;
	}
	public void setPur_opt_count_1(int pur_opt_count_1) {
		this.pur_opt_count_1 = pur_opt_count_1;
	}
	public int getPur_opt_count_2() {
		return pur_opt_count_2;
	}
	public void setPur_opt_count_2(int pur_opt_count_2) {
		this.pur_opt_count_2 = pur_opt_count_2;
	}
	public int getPur_opt_count_3() {
		return pur_opt_count_3;
	}
	public void setPur_opt_count_3(int pur_opt_count_3) {
		this.pur_opt_count_3 = pur_opt_count_3;
	}
	public int getPur_opt_count_4() {
		return pur_opt_count_4;
	}
	public void setPur_opt_count_4(int pur_opt_count_4) {
		this.pur_opt_count_4 = pur_opt_count_4;
	}
	public int getPur_price() {
		return pur_price;
	}
	public void setPur_price(int pur_price) {
		this.pur_price = pur_price;
	}
	@Override
	public String toString() {
		return "PurchaseManagerVO [pur_num=" + pur_num + ", pur_statenum=" + pur_statenum + ", pur_impid=" + pur_impid
				+ ", pur_merchantid=" + pur_merchantid + ", pur_user_id=" + pur_user_id + ", pur_user_name="
				+ pur_user_name + ", pur_purchasedate=" + pur_purchasedate + ", pur_bookingdate=" + pur_bookingdate
				+ ", pur_act_title=" + pur_act_title + ", pur_opt_name_1=" + pur_opt_name_1 + ", pur_opt_name_2="
				+ pur_opt_name_2 + ", pur_opt_name_3=" + pur_opt_name_3 + ", pur_opt_name_4=" + pur_opt_name_4
				+ ", pur_opt_count_1=" + pur_opt_count_1 + ", pur_opt_count_2=" + pur_opt_count_2 + ", pur_opt_count_3="
				+ pur_opt_count_3 + ", pur_opt_count_4=" + pur_opt_count_4 + ", pur_price=" + pur_price + "]";
	}
	
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getListcnt() {
		return Listcnt;
	}
	public void setListcnt(int listcnt) {
		Listcnt = listcnt;
	}
}
