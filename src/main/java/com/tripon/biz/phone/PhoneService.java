package com.tripon.biz.phone;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class PhoneService {
	
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		
		System.out.println("실제 전송로직 : " + userPhoneNumber);
		
		String api_key = "NCSEO8ZYO1AT1FQO";                    // "COOLSMS에서 발급받은 키"
		String api_secret = "GMW0K2BHHWGU3LSWG6KNVDCDVVDKUO3G"; // "COOLSMS에서 발급받은 값"
		
		Message coolsms = new Message(api_key, api_secret);
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		
		params.put("to", userPhoneNumber);
		params.put("from", "01071632261");
		
		// 발신 전화번호. 테스트시에는 발신, 수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text",  "[TEST] 인증번호는" + "[" + randomNumber + "]" + " 입니다.");
		
		// 문자 내용 입력
		try {
			Object obj = coolsms.send(params);
			Object obj1 = coolsms.sent(params);
			System.out.println(obj.toString());
			System.out.println(obj1.toString());
		} catch(CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
	}
	
}
