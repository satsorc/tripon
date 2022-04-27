package com.tripon.biz.personalInformation.impl;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class PersonalInformationServiceimpl {
	@Autowired
	private PersonalInformationDAOMybatis personalInformationDAO;
	
	public int nicknameCheck(String nickname) {
		return personalInformationDAO.nicknameCheck(nickname);
	}

	public void updateMember() {
		
	}

	public void PhoneNumberAuthentication(int certificateNumber, String phoneNumber) {
		
        String api_key = "NCSMKF09KIUQMPYU";
        String api_secret = "ACGVMTUXUBMEIONJRBLPNMLNWPH1X3GM";
        Message coolsms = new Message(api_key, api_secret);
    
        /*
         * Parameters
         * 관련정보 : http://www.coolsms.co.kr/SDK_Java_API_Reference_ko#toc-0
         */
        HashMap<String, String> set = new HashMap<String, String>();
        set.put("to", phoneNumber); // 수신번호
        
        set.put("text", "본인확인 인증번호(" + certificateNumber + ") 입력 시 정상처리됩니다."); // 문자내용
        set.put("type", "sms"); // 문자 타입

        try {
        	JSONObject obj = coolsms.send(set);
        	System.out.println(obj.toString());
        } catch (CoolsmsException e) {
        	System.out.println(e.getMessage());
        	System.out.println(e.getCode());
        }

    }    
}
