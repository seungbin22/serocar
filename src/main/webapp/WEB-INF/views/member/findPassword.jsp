<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>SEROCAR-FINDPASSWORD</title>
</head>
<link rel="stylesheet" href="/resources/css/member/findPassword.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
   var emConfirmchk = true;//이메일 인증
   $(function() {
      var $passwordCheck = $("#passwordCheck"); // 인증번호 발송 버튼
      var $memailConfirm = $("#memailConfirm"); // 인증번호 확인input
      var $memailConfirmTxt = $("#memailConfirmTxt"); // 인증번호 확인 txt
      var $memberEmailTxt = $("#memberEmailTxt");

      $('#passwordCheck').click(function() {
         $.ajax({
            type : "POST",
            url : "/mailConfirm",
            data : {
               "memberEmail" : $("#memberEmail").val()
            },
            success : function(code) {
               alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
               chkEmailConfirm(code, $memailConfirm, $memailConfirmTxt);
               $('#code').attr("value", code);
               console.log("code : " + code);
            }
         });
      });

      $(function() {
         $("#completeFind").click(function() {
            var memailConfirm = $("#memailConfirm").val();
            var code = $("#code").val();
            var memberEmail= $("#memberEmail").val();
            
            console.log("memberEmail1 값: " +memberEmail);            
            console.log("code : " + code);
            console.log("입력값1 : " + memailConfirm);
            if (memailConfirm != code) {
               $("#result").text("인증코드가 일치하지 않습니다.");
               return false;
            } else {
               
               $(location).attr('href', '/updatePassword?memberEmail='+memberEmail);
               
               
            }
         });
      });
   });

   function chkEmailConfirm(data, $memailConfirm, $memailConfirmTxt) {
      $memailConfirm.on("keyup", function() {
         if (data != $memailConfirm.val()) { //
            emConfirmchk = false;
            $memailConfirmTxt
                  .html("<span id='emConfirmchk'>인증번호가 잘못되었습니다</span>")
            $("#emConfirmchk").css({
               "color" : "#FA3E3E",
               "font-weight" : "bold",
               "font-size" : "13px"
            })
            //console.log("중복아이디");
         } else { // 아니면 중복아님
            emConfirmchk = true;
            $memailConfirmTxt
                  .html("<span id='emConfirmchk'>인증번호가 일치합니다.</span>")
            $("#emConfirmchk").css({
               "color" : "#0D6EFD",
               "font-weight" : "bold",
               "font-size" : "13px"
            })
         }
      })
   }
</script>
<body>
   <form action="./findPassword" class="form" id="form" method="post">
      <div class="center">
         <div class="container">
            <div class="text">비밀번호 찾기</div>
            <br>
            <div>
               <label class="label-text" for="memberEmail" id="memberEmailTxt">이메일</label>
               <div class="uk-form-controls">
                  <input class="form-control" type="email" id="memberEmail" name="memberEmail"
                     placeholder="" />
                  <button type="button" class="sero-btn" id="passwordCheck">인증</button>
               </div>
            </div>

            <div class="label-text">
               <label for="memailConfirm" id="memailConfirmTxt"></label> <input
                  type="text" class="form-control" id="memailConfirm"
                  name="memailConfirm" placeholder="인증번호를 입력해주세요"> <input
                  type="hidden" id="code" name="code" value="" />
            </div>

            <div class="small-text">회원가입시 등록하셨던 이메일 주소를 입력해주시면 임시 비밀번호를
               발급해드립니다.</div>
            <span id="result"></span>
            <div>
               <button type="button" class="sero-btn" id="completeFind"
                  name="completeFind" onclick="checkCompletion">확인</button>
            </div>

            <div class="small-text">* 메일이 도착하기까지 몇 분 정도 소요될 수 있습니다.</div>
            <div class="small-text">* 스팸 메일함으로 발송될 수 있으니 체크바랍니다.</div>
            <!-- 임시 버튼 -->
            <div>
               <button type="button" class="sero-btn-back" id="backPage">뒤로가기</button>
            </div>
            <!-- 임시 버튼 끝 -->
         </div>
      </div>
   </form>
</body>

</html>