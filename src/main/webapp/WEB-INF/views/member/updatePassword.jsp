<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="/resources/css/member/changePassword.css" />
<body>
   <form action="./updatepassword" method="post">
      <div class="center">
         <div class="container">
            <div class="text">비밀번호 변경</div>
            <br>

            <div>
               <div label class="label-text" for="findUserPwdEmail">이메일</div>
               <div class="uk-form-controls">
                  <input class="uk-input" type="email" name="memberEmail"
                     id="memberEmail" readonly="readonly" value="${memberEmail}" />
               </div>
            </div>

            <div>
               <label class="label-text" id="memberPasswordTxt">비밀번호</label>
               <div class="uk-form-controls">
                  <input class="uk-input" type="password" id="memberPassword" name="memberPassword" required="required"
                     onkeyup="passwordStrength()" placeholder="비밀번호(문자, 숫자, 특수문자 포함 10~20자)" /> 
               </div>
               <span style="font-size: 13px;" id="strengthPassword"></span>
            </div>

            <div>
               <label class="label-text" id="passwordcheckTxt">비밀번호확인</label>
               <div class="uk-form-controls">
                  <input class="uk-input" type="password" id="passwordCheck"
                     name="passwordCheck" placeholder="비밀번호 재입력" onkeyup="checkPassword()" required="required" /> 
               </div>
               <span id="checkPassword" style="font-size: 13px"></span>

               <div class="small-text">* 형식에 맞는 새로운 비밀번호를 설정해주세요.</div>

               <!-- 임시 버튼 -->
               <div>
                  <button type="submit" class="sero-btn-next" id="complete">확인</button>
                  <span style="font-size: 13px;" id="completeResult"></span>
               </div>
               <div>
                  <button class="sero-btn-back" id="backPage">뒤로가기</button>
               </div>
               <!-- 임시 버튼 끝 -->
            </div>
   </form>

   <script type="text/javascript">
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

      $(function() {
         $("#complete").click(function() {
            var customerPassword = $("#memberPassword").val();
            var customerPwck = $("#passwordCheck").val();
            if (customerPassword != customerPwck) {
               alert("비밀번호를 확인하세요.");
               return false;
            }
         });//click
      });//ready
   </script>
</body>
</html>