<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/uikit@3.7.0/dist/css/uikit.min.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../resources/css/member/join.css" />



</head>


<body>
	<form action="./join" class="form" method="post">
		<div class="center">
			<div class="container">
				<div class="text">회원가입</div>
				<div class="small-text">SEROCAR SIGN UP</div>


					<div>
						<label class="label-text" for="memberEmailTxt" id="memberEmailTxt">이메일</label>
						<div class="uk-form-controls input-button-flex">
							<input class="uk-input" type="text" id="email" required="required"
								name="memberEmail" placeholder=""/>
							<button type="button"class="uk-button email-btn" id="checkEmail" style="font-size:12px">확인</button>
						</div>
						<span style="font-size:13px;"id="checkIdResult"></span>
					</div>
					<input type="hidden" name="businessNum" id="businessNum"/>
				<div>
					<label class="label-text" for="membernickname">닉네임</label>
					<div class="uk-form-controls">
						<input class="uk-input" type="text" id="memberNickname" required="required"
							name="memberNickname" placeholder="" />
					</div>
				</div>
				<div>
					<label class="label-text" for="memberpassword">비밀번호</label>
					<div class="uk-form-controls">
						<input class="uk-input" type="password" id="memberPassword" required="required"
							name="memberPassword" placeholder="비밀번호(문자, 숫자, 특수문자 포함 10~20자)"
							onchange="check_pw()" required="required" onkeyup="passwordStrength()" />
					</div>
					<span style="font-size:13px;"id="strengthPassword"></span>
				</div>
				<div>
					<label class="label-text" for="checkSignInPwd">비밀번호확인</label>
					<div class="uk-form-controls">
						<input class="uk-input" type="password" id="passwordCheck" name="passwordCheck" required="required"
							placeholder="비밀번호 재입력" onchange="check_pw()" onkeyup="checkPassword()"/>
							<span id="checkPassword" style="font-size:13px"></span>
					</div>

					<label class="label-text">생년월일</label>
					<div class="uk-form-controls input-button-flex">
						<input type="text" name="memberBirth" id="memberBirth" required="required"
							placeholder="yymmdd" aria-label="birth"
							class="uk-input" maxlength="6" />
					</div>

					<label class="label-text">성별</label>
					<div>
						<input type="checkbox" value="male" onclick="NoMultiChk(this)" 
							id="memberGender" name="memberGender" checked />남성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" value="female" onclick="NoMultiChk(this)"
							id="memberGender" name="memberGender" />여성
					</div>
				</div>
				
				<div class="agree-container">
					<span class="agree-link-container"> <label><input
							type="checkbox" id="userAgeChecked" name="color" value="blue"
							style="margin-right: 4px; font-size: 10px" /> 본인은 만 14세 이상입니다.<span
							style="color: #1e87f0; font-size: 8px">(필수)</span></label> <!-- <a
                        onclick="window.open('/userAgeCheck')"
                        class="agree-link-text"
                        >보기</a
                    > -->
					</span> <span class="agree-link-container"> <label><input
							type="checkbox" id="userPolicyChecked" name="color" value="blue"
							style="margin-right: 4px; font-size: 10px" /> 개인정보수집에 동의합니다. <span
							style="color: #1e87f0; font-size: 8px">(필수)</span></label> <a
						onclick="window.open('/userPolicy')" class="agree-link-text">보기</a>
					</span>
					<table>
						<tr>
							<td colspan="2">개인정보수집</td>
						</tr>
						<tr>
							<td>목적</td>
							<td class="second-td">개인식별, 회원자격 유지・관리</td>
						</tr>
						<tr>
							<td>항목</td>
							<td class="second-td">이름,아이디,이메일,닉네임,비밀번호</td>
						</tr>
						<tr>
							<td>보유기간</td>
							<td class="second-td">회원탈퇴 시 즉시 파기</td>
						</tr>
					</table>
					<span class="agree-link-container"> <label><input
							type="checkbox" id="userAgreementsChecked" name="color"
							value="blue" style="margin-right: 4px" /> 이용약관에 동의합니다. <span
							style="color: #1e87f0; font-size: 8px">(필수)</span></label> <a
						onclick="window.open('/userAgreements')" class="agree-link-text">보기</a>
					</span>
				</div>
				<div>
					<button class="myro-btn" id="completeJoin"
						type="submit">회원가입</button>
				</div>
				<div>
					<button class="myro-btn-back" id="backPage">뒤로가기</button>
				</div>

			</div>
		</div>
	</form>
	
<script type="text/javascript">
	
$(function() {
	
	$("#checkEmail").click(function(){
		var memberEmail = $("#email").val();
		console.log("memberEmail1: "+email);
		
		console.log("memberEmail2: "+memberEmail);
		$.ajax({
			type:"get",
			url:"/checkEmail",
			data:{"memberEmail" : memberEmail},
			success:function(result){
				console.log("memberEmail3: "+memberEmail);
				$("#checkIdResult").text(result);
			}
		});//ajax
	});//click
/* 아이디 중복확인 */
	$("#completeJoin").click(function(){
		var memberPassword = $("#memberPassword").val();
		var passwordCheck = $("#passwordCheck").val();
		var memberEmail = $("#email").val();		
		
		console.log("memberPasword : " + memberPassword);
		console.log("memberPasword : " + passwordCheck);
			if($("#checkIdResult").text() != "사용가능한 아이디입니다."){
				alert("아이디 중복확인 하세요.");
				return false;
			}
			if(memberPassword != passwordCheck){
				alert("비밀번호를 확인하세요.");
				return false;
			}
		});//click
});//ready
/* 비밀번호 일치, 불일치 */
function checkPassword() {
	var memberPw = document.getElementById("memberPassword").value;
	var passwordCheck = document.getElementById("passwordCheck").value;
	if (memberPw == passwordCheck) {
		document.getElementById("checkPassword").innerHTML = "비밀번호 일치"
		document.getElementById('checkPassword').style.color='blue';
		return true;
	} else {
		document.getElementById("checkPassword").innerHTML = "비밀번호 불일치"
		document.getElementById('checkPassword').style.color='red'; 
		return false;
	}
}
/* 성별 하나만 필수 체크 */
function NoMultiChk(chk) {
    var obj = document.getElementsByName("memberGender");
    for(var i=0; i<obj.length; i++){
       if(obj[i] != chk){
          obj[i].checked = false;
       }
    }
 }
/* 비밀번호 강도확인 */
	function passwordStrength() {
		var strength = document.getElementById('strengthPassword');
		var strongRegex = new RegExp(
				"^(?=.{8,})(?=.*[a-zA-Z])(?=.*[0-9])(?=.*\\W).*$", "g");
		var mediumRegex = new RegExp(
				"^(?=.{8,})(((?=.*[a-zA-Z])(?=.*[0-9]))|((?=.*[a-zA-Z])(?=.*[0-9]))).*$",
				"g");
		var enoughRegex = new RegExp("(?=.{6,}).*", "g");
		var pwd = document.getElementById("memberPassword");
		if (pwd.value.length == 0) {
			strength.innerHTML = '비밀번호 강도체크';
		} else if (false == enoughRegex.test(pwd.value)) {
			strength.innerHTML = '비밀번호가 짧습니다.';
		} else if (strongRegex.test(pwd.value)) {
			strength.innerHTML = '<span style="color:green">강력</span>';
		} else if (mediumRegex.test(pwd.value)) {
			strength.innerHTML = '<span style="color:orange">중간</span>';
		} else {
			strength.innerHTML = '<span style="color:red">위험</span>';
		}
	}
	</script>
</body>
</html>