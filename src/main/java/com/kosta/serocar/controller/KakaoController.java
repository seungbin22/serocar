package com.kosta.serocar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.serocar.bean.KakaoLogin;
import com.kosta.serocar.bean.Member;
import com.kosta.serocar.model.KakaoProfile;
import com.kosta.serocar.model.OAuthToken;
import com.kosta.serocar.service.KakaoLoginService;
import com.kosta.serocar.service.MemberService;

@Controller
public class KakaoController {

	@Autowired
	KakaoLoginService kakaoLoginServcie;
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/oauth/kakao")
	public String kakaoCallback(String code, HttpSession session, HttpServletRequest request, Model model) throws Exception { //Data를 리턴해주는 컨트롤러 함수
		
		//POST방식으로 key = value 데이터를 요청(카카오쪽으로)
		RestTemplate rt = new RestTemplate(); //HttpsURLConnection url 대신 사용(라이브러리)
		
		//HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "6bcdf312181b58c7780333a232a77486");
		params.add("redirect_uri", "http://localhost:8088/oauth/kakao"); //변수화?
		params.add("code", code);
		
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = 
				new HttpEntity<>(params,headers);
		
		//Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response = rt.exchange(
			"https://kauth.kakao.com/oauth/token",
			HttpMethod.POST,
			kakaoTokenRequest,
			String.class
		);
		
		//Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken =null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println("카카오 엑세스 토큰 : "+oauthToken.getAccess_token());
		
		RestTemplate rt2 = new RestTemplate(); //HttpsURLConnection url 대신 사용(라이브러리)
		
		//HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = 
				new HttpEntity<>(headers2);
		
		//Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response2 = rt2.exchange(
			"https://kapi.kakao.com/v2/user/me",
			HttpMethod.POST,
			kakaoProfileRequest2,
			String.class
		);
		
		System.out.println(response2.getBody());
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile =null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		String memberNickname = kakaoProfile.getProperties().getNickname();
		String memberEmail = kakaoProfile.getKakao_account().getEmail();
		
		KakaoLogin kvo = kakaoLoginServcie.selectKakaoEmail(memberEmail);
		if(kvo == null) {
			System.out.println("카카오와 연동된 정보가 없습니다.");
			kakaoLoginServcie.joinKakao(memberNickname, memberEmail);
			
			model.addAttribute("kakaoEmail", memberEmail);
			model.addAttribute("memberNickname", memberNickname);
			System.out.println("Email =" + memberEmail);
			System.out.println("Nickname =" + memberNickname);
			
			return "member/kakaoJoin.tiles";
		}else {
			System.out.println("이미 가입된 정보가 있습니다.");
			
			Member member = memberService.checkEmail(memberEmail.toString());
			System.out.println("멤버 이메일= "+ member.getMemberEmail());
			System.out.println(member);
			String memberNickname1 = memberService.nickCheck(member).getMemberNickname();
			session.setAttribute("memberNickname", memberNickname1);
			System.out.println("닉네임 : "+memberNickname);
			String memberProfile = memberService.nickCheck(member).getProfile();
			session.setAttribute("memberProfile", memberProfile);
			System.out.println("프로파일 : "+memberProfile);
			
			session.setAttribute("memberEmail", member.getMemberEmail());
			session.setAttribute("KakaoLogin", kvo);
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/oauth/kakaoJoinMember", method=RequestMethod.POST)
	public String kakaoJoinMember(Member member, HttpSession session) throws Exception {
		kakaoLoginServcie.kakaoJoinMember(member);
		String memberNickname1 = memberService.nickCheck(member).getMemberNickname();
		session.setAttribute("memberNickname", memberNickname1);
		System.out.println("닉네임 : "+memberNickname1);
		return "member/successJoin.tiles";
	}
}
