package com.kosta.serocar.controller;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.security.MessageDigest;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.serocar.bean.Member;
import com.kosta.serocar.dao.MemberDAO;
import com.kosta.serocar.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	MemberDAO memberDAO;

	// 회원가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	String join(Model model) {
		model.addAttribute("page", "join.tiles");
		return "member/join.tiles";
	}

	// 회원가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	String join(@ModelAttribute Member member
			, Model model, HttpSession session) {
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
		return "member/successJoin.tiles";
	}

	// 회원 아이디 중복체크 확인
	@RequestMapping("/checkEmail")
	@ResponseBody
	public String checkEmail(@RequestParam("memberEmail") String memberEmail) throws Exception {
		System.out.println("memberEmail: "+memberEmail);
		Member email = memberService.checkEmail(memberEmail);
		System.out.println("email: "+email);
		if (email == null) {
			return "사용가능한 아이디입니다.";
		} else {
			return "중복된 아이디 입니다.";
		}
	}

	@RequestMapping("/checkNickname")
	@ResponseBody
	public String checkNickname(@RequestParam("memberNickname") String memberNickname) throws Exception {
		Member nick = memberDAO.checkNickname(memberNickname);
		
		if (nick == null) {
			return "사용가능한 닉네임입니다.";
		} else {
			return "중복된 닉네임 입니다.";
		}
	}
	// 로그인페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	String login(Model model) {
		return "member/login.tiles";
	}

	// 로그인페이지
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	String login(@RequestParam("memberEmail") String memberEmail, @RequestParam("memberPassword") String memberPassword,@RequestParam("businessNum") String businessNum,
			Model model, ServletRequest request, HttpSession session) throws Exception {
		Member member = new Member();
		StringBuffer sb = new StringBuffer();

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
		member.setMemberEmail(memberEmail);
		member.setMemberPassword(sb + "01022658323");
		
		System.out.println("해쉬해서 더한값 = " + sb + "01022658323");
		System.out.println(memberService.login(member));
		System.out.println("이메일 =" + memberEmail);

		if (memberService.login(member)) {
			session.setAttribute("memberEmail", memberEmail);

			String businessNum1 = memberService.nickCheck(member).getBusinessNum();
			session.setAttribute("businessNum", businessNum1);
			System.out.println("비지니스 넘: "+businessNum1);
			
			String memberNickname1 = memberService.nickCheck(member).getMemberNickname();
			session.setAttribute("memberNickname", memberNickname1);

			String memberProfile = memberService.nickCheck(member).getProfile();
			session.setAttribute("memberProfile", memberProfile);

			System.out.println("닉네임" + memberNickname1);
			System.out.println("프로필사진= " + memberProfile);
			return "home.tiles";
		} else {
			model.addAttribute("err", "이메일 또는 패스워드가 틀렸습니다.");
			return "member/login.tiles";
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

	// 비밀번호 찾기 페이지
	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	String findPassword(@RequestParam(value = "memberEmail", required = false) String memberEmail, Model model) {
		model.addAttribute("page", "member/findPassword.tiles");
		return "member/findPassword.tiles";
	}

	// 비밀번호 변경 페이지
	@RequestMapping(value = "/updatePassword", method = RequestMethod.GET)
	String updatePassword(HttpServletRequest request, Model model) {
		String mbPw = request.getParameter("memberEmail");

		model.addAttribute("memberEmail", mbPw);

		System.out.println("모델 값: " + model);
		return "member/updatePassword.tiles";
	}

	// 비밀번호 변경 페이지
	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	String updatePassword(@ModelAttribute Member member, Model model) throws Exception {

		try {
			String hasPass = getEncrypt(member.getMemberPassword());
			member.setMemberPassword(hasPass);

			System.out.println("이메일: " + member.getMemberEmail());
			System.out.println("패스워드: " + hasPass);
			memberService.changePassword(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/successChange.tiles";
	}

	//프로필 사진 가져오기
	@GetMapping("/profile/{filename}")
	public void viewImage(@PathVariable String filename, HttpServletResponse response) {
		String path = servletContext.getRealPath("/profile/");
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(path + filename);
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception e) {
				}
			}
		}
	}
	 
}