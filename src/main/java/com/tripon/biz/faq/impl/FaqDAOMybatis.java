package com.tripon.biz.faq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripon.biz.faq.FaqVO;

@Repository
public class FaqDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertFaq(FaqVO vo) {
		System.out.println("===> Mybatis로 insertFaq() 기능 처리");
		mybatis.insert("FaqDAO.insertFaq", vo);
	}
	
	public void updateFaq(FaqVO vo) {
		System.out.println("===> Mybatis로 updateFaq() 기능 처리");
		mybatis.update("FaqDAO.updateFaq", vo);
	}
	
	public void deleteFaq(FaqVO vo) {
		System.out.println("===> Mybatis로 deleteFaq() 기능 처리");
		mybatis.delete("FaqDAO.deleteFaq", vo);
	}
	
	public FaqVO getFaqTotal(FaqVO vo) {
		System.out.println("===> Mybatis로 getFaqTotal() 기능 처리");
		return (FaqVO) mybatis.selectOne("FaqDAO.getFaqTotal", vo);
	}
	
	public FaqVO getFaq(FaqVO vo) {
		System.out.println("===> Mybatis로 getFaq() 기능 처리");
		return (FaqVO) mybatis.selectOne("FaqDAO.getFaq", vo);
	}
	
	public List<FaqVO> getFaqList(FaqVO vo) {
		System.out.println("===> Mybatis로 getFaqList() 기능 처리");
		return mybatis.selectList("FaqDAO.getFaqList", vo);
	}
	
}
