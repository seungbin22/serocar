package com.kosta.serocar.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class EmailController {

	@Autowired
	RegisterMail registerMail;
	
	@RequestMapping(value="/mailConfirm")
	@ResponseBody
	String mailConfirm(@RequestParam(value="memberEmail", required=false) String memberEmail) throws Exception {
		System.out.println(memberEmail);
		String code = registerMail.sendSimpleMessage(memberEmail);
		System.out.println("인증코드 : " + code);
		return code;
	}
}
