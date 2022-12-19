package com.kosta.serocar.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.serocar.bean.Member;
import com.kosta.serocar.bean.NaverLogin;
import com.kosta.serocar.service.MemberService;
import com.kosta.serocar.service.NaverService;

@Controller
public class NaverLoginController {
	
	@Autowired
	NaverService naverService;
	
	@Autowired
	MemberService memberService;
	
	//네이버 로그인
	@RequestMapping("/callback")
	@Transactional
	public String naverCallback(HttpSession session, HttpServletRequest request, Model model)
			throws Exception {

		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:8088/callback", "UTF-8");

		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + "t0WfS6GJylaWmUnYBOgh";
		apiURL += "&client_secret=" + "mhBBUN_eU0";
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;

		String res = requestToServer(apiURL);
		if (res != null && !res.equals("")) {
			
			model.addAttribute("res", res);
			Map<String, Object> parsedJson = new JSONParser(res).parseObject();
			if(parsedJson.get("access_token") != null) {
				String infoStr = getProfileFromNaver(parsedJson.get("access_token").toString());
				Map<String, Object> infoMap = new JSONParser(infoStr).parseObject();
				if(infoMap.get("message").equals("success")) {
					Map<String, Object> infoResp = (Map<String, Object>) infoMap.get("response");
					
					String memberNickname = infoResp.get("name").toString();
					String memberEmail = infoResp.get("email").toString();
					
					NaverLogin nvo = naverService.selectNaverEmail(memberEmail);
					
					if(nvo == null) {
						System.out.println("네이버 연동정보 없음");
						naverService.joinNaver(memberNickname, memberEmail);
						model.addAttribute("isConnectedToNaver", false);
						model.addAttribute("memberEmail", memberEmail);
						model.addAttribute("memberNickname", memberNickname);
						return "member/naverJoin.tiles";
					}else {
						System.out.println("이미 가입된 정보가 있습니다.");
						Member member = memberService.checkEmail(memberEmail.toString());
						System.out.println("이미 가입된 정보가 있습니다.22" + member);
						System.out.println("멤버 이메일= "+ member.getMemberEmail());
						
						String memberNickname1 = memberService.nickCheck(member).getMemberNickname();
						session.setAttribute("memberNickname", memberNickname1);
						System.out.println("닉네임 : "+memberNickname);
						
						String memberProfile = memberService.nickCheck(member).getProfile();
						session.setAttribute("memberProfile", memberProfile);
						System.out.println("프로파일 : "+memberProfile);
						
						session.setAttribute("memberEmail", member.getMemberEmail());
						
						session.setAttribute("naverLogin", nvo);
						return "redirect:/";
					}
				}
			}
			session.setAttribute("currentUser", res);
			model.addAttribute("currentAT", parsedJson.get("access_token"));
			model.addAttribute("currentRT", parsedJson.get("refresh_token"));
			return "home.tiles";
			
		} else {
			model.addAttribute("res", "Login failed!");
			return "home.tiles";
		}
	}
	//네이버 로그인 끝 지점
	private String requestToServer(String apiURL) throws IOException {
		return requestToServer(apiURL, "");
	}
	private String requestToServer(String apiURL, String headerStr) throws IOException {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");

		if (headerStr != null && !headerStr.equals("")) {
			con.setRequestProperty("Authorization", headerStr);
		}

		int responseCode = con.getResponseCode();
		BufferedReader br;

		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		if (responseCode == 200) {
			return res.toString();
		} else {
			return null;
		}
	}
	//네이버 토큰으로 정보 받아오기
	@RequestMapping("/naver/getProfile")
	public String getProfileFromNaver(String accessToken) throws IOException {
		// 네이버 로그인 접근 토큰;
		String apiURL = "https://openapi.naver.com/v1/nid/me";
		String headerStr = "Bearer " + accessToken; // Bearer 다음에 공백 추가
		String res = requestToServer(apiURL, headerStr);
		
		return res;
	}
	//네이버 회원가입
	@RequestMapping(value = "/naverRegisterCustomer", method=RequestMethod.POST)
	public String naverRegisterCustomer(Member member, HttpSession session) throws Exception {
		naverService.naverJoinMember(member);
		String memberNickname1 = memberService.nickCheck(member).getMemberNickname();
		session.setAttribute("memberNickname", memberNickname1);
		System.out.println("닉네임 : "+memberNickname1);
		return "member/successJoin.tiles";
	}
}