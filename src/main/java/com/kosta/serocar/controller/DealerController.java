package com.kosta.serocar.controller;

import java.security.MessageDigest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.serocar.bean.Member;
import com.kosta.serocar.service.MemberService;

@Controller
public class DealerController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	HttpSession session;
	
	//딜러 회원가입 창
	@RequestMapping(value = "/joinDealer", method = RequestMethod.GET)
	String joinDealer(Model model) {
		return "dealer/joinDealer.tiles";
	}
	
	//딜러 회원가입 페이지
	@RequestMapping(value = "/joinDealer", method = RequestMethod.POST)
	String joinDealer(@ModelAttribute Member member, Model model, HttpSession session) {
		String memberNickname = member.getMemberNickname();
		try {
			String hasPass = getEncrypt(member.getMemberPassword());
			member.setMemberPassword(hasPass);
			memberService.joinMember(member);
			session.setAttribute("memberNickname", memberNickname);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "회원가입 실패");
			model.addAttribute("page", "err");

		}
		return "dealer/successDealerJoin.tiles";
	}
	
	//딜러 사업자 등록증 중복체크 확인
	@RequestMapping("/checkBusiness")
	@ResponseBody
	public String ckBusiness(String businessNum) throws Exception {
		Member member = memberService.checkBusiness(businessNum);
		if (member == null) {
			return "사용가능한 사업자 등록증입니다.";
		} else {
			return "중복된 사업자 등록증 입니다.";
		}
	}
	
	// 암호화에 필요한 솔트값을 가져와야 하지만 난수 생성으로 인한 하드코딩 값 가져오기
		public String getSalt() {
			String getSalt = "01022658323";
			return getSalt.toString();
		}

		// 암호화(+솔트)처리하기
		public String getEncrypt(String memberPassword) {
			StringBuffer sb = new StringBuffer();
			String getSalt = "01022658323";
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update((memberPassword).getBytes());
				byte pwd[] = md.digest();

				for (int i = 0; i < pwd.length; i++) {
					sb.append(Integer.toString((pwd[i] & 0xff) + 0x100, 16).substring(1));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("sb값 : " + sb);
			String sb2 = sb + "01022658323";
			System.out.println("암호화 처리후 : " + sb + getSalt);
			return sb2.toString();
		}
}
