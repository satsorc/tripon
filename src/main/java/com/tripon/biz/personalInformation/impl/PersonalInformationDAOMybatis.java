package com.tripon.biz.personalInformation.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PersonalInformationDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int nicknameCheck(String nickname) {
		System.out.println("===> Mybatis로 insertFaq() 기능 처리");
		return mybatis.selectOne("PersonalInformationDAO.checkNickname", nickname);
	}
}
