package com.tripon.view.controller;

import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripon.biz.personalInformation.impl.PersonalInformationServiceimpl;

@Controller
public class PersonalInformationController {
	@Autowired
	private PersonalInformationServiceimpl personalInformationServiceimpl;
	
	@RequestMapping(value="/updateMember", method=RequestMethod.POST)
	public String updateMember() {
		personalInformationServiceimpl.updateMember();
		return "info_managementPage";
	}
	
	@RequestMapping(value="/nicknameCheck", method=RequestMethod.POST)
	@ResponseBody
	public int nicknameCheck(@RequestBody String nickname) {
		System.out.println("nicknameCheck() 호출");
		int count = 0;
		count = personalInformationServiceimpl.nicknameCheck(nickname);
		
		return count;
	}
	
	@RequestMapping(value="/AuthenticatePhoneNumber", method=RequestMethod.POST)
	@ResponseBody
	public String PhoneNumberAuthentication(@RequestBody String phoneNumber) {
		int phoneNumberAuthentication = ThreadLocalRandom.current().nextInt(100000, 1000000);
		System.out.println(phoneNumberAuthentication);
		
//		personalInformationServiceimpl.PhoneNumberAuthentication(phoneNumberAuthentication, phoneNumber);
		
		return "" + phoneNumberAuthentication;
	}

}
