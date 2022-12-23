<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="../resources/css/mypage/profile.css" />
<link rel="stylesheet" href="/resources/css/uikit.min.css">

<body>

<form action="./profile" method="POST" enctype="multipart/form-data">
	<div class="wrapper">
		<div class="container">
			<div class="top-background-div"></div>
			<div class="top-container">
				<div class="profilePhotoContainer">
					  <img style="border-radius: 50%; width:200px; height: 200px; max-width:100%; overflow: hidden; object-fit: cover; " src="profile/${memberProfile}"/>
				</div>
				<div>
					&emsp; &emsp; &emsp; &emsp;<input type="file" id="profile" name="imageFile">
				</div>
			</div>
			<div class="profilePhoto-text" id="profilePhote"></div>
			<div class="text">
				<span id="userNickNameTop"></span>
			</div>
			<div class="small-text">${memberNickname }님의프로필</div>
		</div>
		<div class="flex-container">
			<div class="form-container">
				<div class="py-4">
					<div class="section-title-container">
						<h5 style="margin-bottom: 8px">
							<b>기본정보</b>
						</h5>
					</div>
					<div class="data">
						<label>이메일</label> <input type="text" id="memberEmail" name="memberEmail" readonly="readonly" value="${memberEmail}"/>
					</div>
					<div class="data">
						<label>닉네임</label> <input type="text" id="nickname" name="memberNickname"/>
						<button type="button"class="uk-button email-btn" id="checkNickname" style="font-size:12px">확인</button>
						<span style="font-size:13px;"id="checkNicknameResult"></span>
					</div>
				</div>
				<span id="resultAreaForPwd"></span>
			</div>
		</div>

		<div class="flex-container p-2">
			<a class="btn-quit-2" id="deleteUserBtn">회원탈퇴</a>
		</div>
		<div class="flex-container p-5">
			<button class="btn-normal-2" onclick="history.back(-1)">취소하기</button>
			<button type="submit" class="btn-normal-2" id="saveUserInfo" >저장하기</button>
		</div>

	</div>
	</form>
	<script>
	$(function(){
		$("#checkNickname").click(function(){
			var memberNickname = $("#nickname").val();
			
			$.ajax({
				type:"get",
				url:"/checkNickname",
				data:{"memberNickname" : memberNickname},
				success:function(result){
					$("#checkNicknameResult").text(result);
				}
			});//ajax
		});//click
	});
	</script>
</body>
</html>