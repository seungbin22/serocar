<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SEROCAR-LOGIN</title>
<link rel="stylesheet" href="../resources/css/member/login.css">
</head>
<script>

</script>
<body>
	<form action="#" class="form" id="form" method="post">
	<input type="hidden" id="businessNum" name="businessNum" value="${businessNum }">
		<div class="center">
			<div class="container">

				<div class="text">로그인</div>
				<div class="small-text">SEROCAR LOG IN</div>
				<div class="form-container">
					<div class="data">
						<label>이메일</label> <input type="text" id="memberEmail" name="memberEmail" />
					</div>
					<div class="data">
						<label>비밀번호</label> <input type="password" id="memberPassword" name="memberPassword"
							onKeypress="javascript:if(event.keyCode==13) {seroLogin()}"
							required />
					</div>
					
					<div><input type="hidden" id="memberNickname" name="memberNickname"/></div>
					
					<div class="forgot-pass">
						<a href="./findPassword">비밀번호를 잊으셨나요?</a>
					</div>
					<span style="font-size:13px; color:red;">${err}</span>
					<div class="btn">
						<div class="inner"></div>
						<button type="submit" id="seroLoginBtn" onclick="seroLogin()">로그인</button>
					</div>
					
					<div class="signup-link">
						회원이 아니세요? <a href="./joinSelect">회원가입하기</a>
					</div>
				</div>
				<div class="divider-container">
					<div class="divider"></div>
					<span>or</span>
				</div>
				<div class="sns-text">SNS 간편 로그인</div>
				<div class="socialBtn-container">
					<div class="socialBtn">
						<div class="socialBtn-image-container"
							onclick="location.href =`oauth/kakao?params=${fromMobile},${savedRouteTokenKey}`">
							<a
								href="https://kauth.kakao.com/oauth/authorize?client_id=6bcdf312181b58c7780333a232a77486&redirect_uri=http://localhost:8088/oauth/kakao&response_type=code"><img
								src="/resources/images/btnK.png"></a>
						</div>
					</div>
					<div class="socialBtn">
						<div class="socialBtn-image-container"
							onclick="location.href=`auth/naver?params=${fromMobile},${savedRouteTokenKey}`">
							<a
								href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=t0WfS6GJylaWmUnYBOgh&state=STATE_STRING&redirect_uri=http://localhost:8088/callback"><img src="../resources/images/btnN.png" style="height: 52px;"></a>
						</div>
					</div>
				</div>
			</div>



		</div>
	</form>

</body>
</html>