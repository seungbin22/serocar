<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" type="text/css" href="../resources/css/community/comDetail.css" />
   
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<body>
   <!-- board -->
    
   <section class="blogspad">
      <div class="container">
         <div class="row">
            <div class="col-lg-8 col-md-7">
               <div class="row">
                  <div class="mainBoard">
                     <div class="detailHead">
                        <input type="hidden" value="${article.notice_num }"/>
                           <div class="detailTitle">
                              <div class="boardList">
                                 <a href="./noticeList">현재게시판 목록으로 ></a>
                                 <c:if test="${ memberEmail != null && memberEmail == article.memberEmail }">
                                       <a href="/modifyform_notice?notice_num=${article.notice_num }">수정</a>
                                       <a href="/delete_notice?notice_num=${article.notice_num }">삭제</a>
                                    </c:if>
                              </div>
                              <div style="height: 30px;">
                                 <h3>${article.notice_title}</h3>
                              </div>
                              <div class="userInfo">
                                 <img
                                    src="/profile/${profile}"
                                    width="36" height="36" alt="프로필사진" class="profileImg">
                                 <div class="userNickname">
                                    <div class="nick">
                                       <button>${article.memberNickname }</button>
                                    </div>
                                    <div class="create">
                                       <span class="date">${article.notice_date }</span> <span class="count">${notice_views }</span>
                                       <a href="" class="boardReport"><span>신고</span></a>
                                    </div>
                                 </div>
                              </div>

                              <div class="detailbody">
                                 <div class="imgBox">
                                    <div>${article.notice_content }</div>
                                 </div>
                              </div>
                           </div>
                     </div>
                  </div>
                  
                  <div class="boardTag">
                        <div class="likeComment">
                           <button class="fa fa-2x CancleBtn LikeBtn"
                              id="iconH" ><img style="width: 45px; height: 45px;" id="iconH" class="iconH" src="../resources/images/heart.png"/></button>
                           <span class="heart"><input type="text"
                              class="" id="exampleFormControlInput1"
                              value="${getLike}" readonly></span> <i
                              class="fa fa-comment-o fa-2x" id="iconC"></i> <span>${getCommentNotice}</span>
                        </div>
                     </div>
                     <!-- 댓글 구현 -->
                     <div class="detailComment">

                        <ul>
                           <li>
                              <h5 class="daegel" style="margin-left: 25px;">
                                 댓글
                                 </h5>
                                 
                                 <div class="commentList">
                                     <img
                                       src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png"
                                       width="36" height="36" alt="프로필사진" class="profileImg2"> 
                                     <div class="userNickname">
                                       <div class="nick2">
                                          <button>${memberNickname }</button> 
                                          <!-- 내가 쓴글 x 보여줌 -->
                                          <span>신고</span>
                                          <!-- 내가 쓴글 o 보여줌 -->
                                          <span>수정</span> <span>삭제</span> 
                                       </div>
                                       <div style="height: 40px;">
                                          <span class="date">2022.12.19</span> 
                                       </div>
                                       <div class="comment">
                                          <span>${article.memberNickname }</span>
                                       </div>
                                    </div> 
                                 </div> 
                           </li>
                        </ul>
                     </div>
                     <div class="comment-area">
                        <div class="writeComment">
                           
                               <input class="commentWriter" id="commentWriter"
                                 name="memberNickname" value="${memberNickname }"
                                 readonly="readonly" /> 
                           <div class="dae">
                              <textarea style="    width: 100%; height: 6.25em; border: none; resize: none;"rows="1" id="com_content" name="com_content"
                                 placeholder="댓글을 남겨보세요"></textarea>
                        <button style="background-color:transparent; border:none; float:right; font-size: 18px; margin-right: -350px; margin-bottom: 10px"id="Comment_regist">등록</button>      
                           </div>
                        </div>
                        
                     </div>
                  </div>
               </div>
            </div>
         </div>
   </section>

   <script>
$('#Comment_regist').click(function() {
   
      //Json으로 전달할 파라미터 변수선언
      const notice_num = ${article.notice_num};
      const memberNickname = $('#commentWriter').val();
      const com_content = $('#com_content').val();
      
      console.log(notice_num);
      console.log(memberNickname);
      console.log(com_content);
   
      if(memberNickname == ''){
         alert('로그인 후 이용해주세요');
         return;
      }else if(com_content == '') {
         alert('내용을 입력하세요');
      }
      
      $.ajax({
         type:'post',
         url:"<c:url value='/Comment/InsertComment_notice'/>",
         data: JSON.stringify(
            {
               "notice_num":notice_num,
               "memberNickname":memberNickname,
               "com_content":com_content
            }      
         ),
         contentType: 'application/json',
         success:function(data){
            console.log('통신성공' + data);
            if(data === 'InsertSuccess') {
               alert('댓글 등록이 완료되었습니다.');
               console.log('댓글 등록 완료');
               $('#commentWriter').val(memberNickname);
                 $('#com_content').val('');
                 getList();
            } else {
               alert('로그인 이후 이용해주시기 바랍니다.');
               console.log('댓글 등록 실패');
            }
         },
         error:function(){
            alert('통신실패');
         }
      });// 댓글 비동기 끝
      
});// 댓글등록 이벤트 끝

getList();
function getList() {
   
   const notice_num = ${article.notice_num};
   const memberNickname = $('#commentWriter').val();
      const com_content = $('#com_content').val();
      /* const com_no = ${com}; */
   $.getJSON(
      "<c:url value='/Comment/CommentList_notice/'/>"+notice_num,
      function(data) {
         if(data.total > 0){
            var list = data.list;
            
            var comment_html = "<div>";
            
            $('#count').html(data.total);
            for(i = 0;i < list.length;i++){
               var content = list[i].com_content;
               var writer = list[i].memberNickname;
               comment_html += "<div><span id='memberNickname'><strong>" + writer + "</strong></span><br/>";
               comment_html += "<span id='com-content'>" + content + "</span><br>";
               if(writer === $("#memberNickname").val()){
                   comment_html += "<span id='delete' style='cursor:pointer;' data-id ="+content+">[삭제]</span><br></div><hr>";
                   
               }
               else{
                  comment_html += "</div><hr>";
               }
            }
            
            $(".commentList").html(comment_html);
            
            
         }
         else{
            var comment_html = "<div>등록된 댓글이 없습니다.</div>";
            $(".commentList").html(comment_html);
         }
      }
   );//getJson
}

//좋아요


var likeval = ${like};

let notice_num = ${article.notice_num};
let memberEmail = "${memberEmail}";
let likeN = 1;

if(likeval > 0){
   console.log(likeval + "좋아요 누름");

   $('.iconH').attr("src", "../resources/images/heartcolor.png");
      $('.LikeBtn').click(function() {
      
      $.ajax({
         type :'post',
         url : '<c:url value ="/likeDown_notice"/>',
         contentType: 'application/json',
         data : JSON.stringify(
               {
                  "notice_num" : notice_num,
                  "memberEmail" : memberEmail,
                  "likeN" : likeN
               }      
            ),
         success : function(data) {
            alert('취소 성공');
         }
      });// 아작스 끝
   });
   
}else{
   console.log(likeval + "좋아요 안누름")
   console.log(memberEmail);
   $('.LikeBtn').click(function() {
      $.ajax({
         type :'post',
         url : '<c:url value ="/likeUp_notice"/>',
         contentType: 'application/json',
         data : JSON.stringify(
               {
                  "notice_num" : notice_num,
                  "memberEmail" : memberEmail,
                  "likeN" : likeN
               }      
            ),
         success : function(data) {
            alert('성공염');
         }
      });// 아작스 끝
      $('.iconH').attr("src", "../resources/images/heartcolor.png");
   });

}
</script>
</body>
</html>