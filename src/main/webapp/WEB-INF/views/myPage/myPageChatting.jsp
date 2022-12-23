<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
</head>

<link rel="stylesheet" href="../resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="/resources/css/uikit.min.css">

<link rel="stylesheet" href="/resources/css/community/sub.css" />
<link rel="stylesheet" href="/resources/css/community/base.css" />
<link rel="stylesheet" href="/resources/css/community/contents.css" />

<body>
   <form action="./myPageChatting" name="search-form" autocomplete="off">
      <input type="hidden" id="memberEmail" name="memberEmail" value="" />
      <input type="hidden" id="businessNum" name="businessNum" value="" />
      <div class="wrapper">
         <div class="container">
            <div class="top-background-div"></div>
            <div class="top-container">
               <div class="profilePhotoContainer">
                  <div class="profilePhoto-text" id="profile">
                     <img
                        style="border-radius: 50%; width: 180px; height: 180px; max-width: fit-content; hidden; object-fit: cover;"
                        src="profile/${memberProfile}" />
                  </div>
               </div>
               <br> <br> 
               <div class="text" value="memberNickname">${memberNickname}</div>
               <button type="button" class="btn-normal"
                  onclick="location.href='/profile'">프로필 수정</button>
            </div>
            <div>
                  <div class="row">
                        <div class="index-section">
                           <div class="index-circle" onclick="location.href='./myPage?memberEmail=${memberEmail}&businessNum=${businessNum}&memberNickname=${memberNickname }'">
                              <h5 style="font-family: 'Montserrat' !important">
                                 <b>즐겨찾기</b>
                              </h5>
                              <div>
                                 <h2 style="line-height: 1; font-weight: 700" id="mypick">${carCount}</h2>
                              </div>
                           </div>

                     <c:choose>
                        <c:when test="${sessionScope.businessNum == null}">
                           <div class="index-circle"
                              onclick="location.href='./myPageList?memberEmail=${memberEmail}&businessNum=${businessNum}&memberNickname=${memberNickname }'">
                              <h5 style="font-family: 'Montserrat' !important">
                                 <b>내가 쓴 글</b>
                              </h5>
                              <div>
                                 <h2 style="line-height: 1; font-weight: 700" id="myReview">${count2}</h2>
                              </div>
                           </div>
                        </c:when>

                        <c:when test="${sessionScope.businessNum != null}">
                           <div class="index-circle"
                              onclick="location.href='./myPageList_ad?memberEmail=${memberEmail}&businessNum=${businessNum}&memberNickname=${memberNickname }'">
                              <h5 style="font-family: 'Montserrat' !important">
                                 <b>내가 쓴 글</b>
                              </h5>
                              <div>
                                 <h2 style="line-height: 1; font-weight: 700" id="myReview">${count_ad}</h2>
                              </div>
                           </div>
                        </c:when>
                     </c:choose>

                     <div class="index-circle" onclick="myChattingData()">
                        <h5 style="font-family: 'Montserrat' !important">
                           <b>쪽지함</b>
                        </h5>
                        <div>
                           <h2 style="line-height: 1; font-weight: 700" id="myChatting">${chatCount }</h2>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- <div class="section-divider"></div> -->
         <div class="container uk-container-large" id="mypageData">
            <!-- 쪽지함 div -->
            <div class="uk-padding-small">
               <div class="section-title-container">
                  <h3 class="section-title">
                     <b>쪽지함</b>
                  </h3>
               </div>
               <div class="drop_menu mouse_click">
                  <div class="board">
                     <table class="list type1">
                        <colgroup>
                           <col class="width_300 display_md_none" />
                           <col class="width_900 display_lg_none" />
                           <col class="width_30 dispaly_sm_none" />
                           <col class="width_30 dispaly_sm_none" />

                        </colgroup>
                        <thead>
                           <tr style="text-align: center;">
                              <th scope="col" class="display_md_none">보낸 사람</th>
                              <th scope="col" class="display_lg_none">내용</th>
                              <th scope="col" class="display_sm_none">보낸 날짜</th>
                              <th scope="col" class="display_sm_none">삭제</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:choose>
                              <c:when test="${noteList!=null && pageInfo.listCount>0 }">
                                 <c:forEach var="note" items="${noteList}">
                                    <input type="hidden"
                                       href="./comDetail?memberEmail=${memberEmail }"/>
                                       <input type="hidden" value=${note.note_no }/>
                                    <tr>
                                        <td class="display_md_none" style="text-align: center;"><a href="#"
                                                   class="modal-writer1" data-com-id = "${note.note_from}">${note.note_from}</a></td>
                                       <td class="display_lg_none">
                                          ${note.note_content}</td>
                                       <td class="display_sm_none" style="text-align: center;">${note.note_date}</td>
                                       <td class="display_sm_none" style="text-align: center;"><a href="./myPage_delete_notice?note_no=${note.note_no}&memberEmail=${memberEmail}&businessNum=${businessNum}&memberNickname=${memberNickname}" ><img src="./resources/images/delete.png" style="width: 40px; height: 30px;"/></a></td>

                                    </tr>
                                 </c:forEach>
                              </c:when>
                           </c:choose>
                        </tbody>
                     </table>
                  </div>
               </div>

               <div class="paging-in" style="text-align: center;">
                  <c:choose>
                     <c:when test="${pageInfo.page<=1}">
                        <img src="/resources/images/community/prev.png">&nbsp;
                              </c:when>
                     <c:otherwise>
                        <a
                           href="myPageList?memberEmail=${memberEmail }&page=${pageInfo.page-1}"><img
                           src="/resources/images/community/prev.png"></a>&nbsp;
                              </c:otherwise>
                  </c:choose>
                  <c:forEach var="i" begin="${pageInfo.startPage }"
                     end="${pageInfo.endPage }">
                     <c:choose>
                        <c:when test="${pageInfo.page==i }">[${i }]</c:when>
                        <c:otherwise>
                           <a href="myPageList?memberEmail=${memberEmail }&page=${i}">[${i }]</a>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>


                  <c:choose>
                     <c:when test="${pageInfo.page>=pageInfo.maxPage }">
                     </c:when>
                     <c:otherwise>
                        <a
                           href="myPageList?memberEmail=${memberEmail }&page=${pageInfo.page+1}">&nbsp;<img
                           src="/resources/images/community/next.png"></a>
                     </c:otherwise>
                  </c:choose>
               </div>
            </div>
         </div>
      </div>
   </form>
    <div class="modal_wrap" id = "chatting-modal">
         <div class="modal-contnet">
               <div class = chatting-title><center> 쪽지 보내기 </center></div>
            <%-- <form action="<c:url value='/note/insertNote' />"> --%>
            <div class="mini-title"><input name="note_to" id="note_to" ></div>
            <textarea class="modal-txtcontent" id="note_content" rows="4" cols="25" name="note_content"></textarea>
            <div>
            <button type="button" class="searchButton" id="note" value='보내기'>
               보내기
            </button>
            <button class="close-modalBtn">
               <a href="#">닫기</a>
            </button>
            </div>
         </div>
      </div>
      
   <script>
   console.log(${count})
   //삭제 메시지
   const msg = '${msg}';
   if(msg !== '') {
      alert(msg);
   }
   
   $(function() {
      
      //쪽지모달
      $(".modal-writer1").on('click', function() {
         var modal1 = $(this).data("comId");
         console.log(modal1);
         $('#note_to').val(modal1);
         $(".modal_wrap").fadeIn();
      })// end 쪽지 open
      
      $("#note").on('click', function(){
         console.log('쪽지 보내기 클릭');
         //보낼 데이터
           const note_to = $('#note_to').val();
           const note_content = $("#note_content").val();
           
           console.log(note_to);
           console.log(note_content);
           
           //쪽지 내용이 없으면 반환
           if(note_content == ''){
              alert('내용을 입력하세요');
              return;
           }
           
           //쪽지 보내기 비동기
           $.ajax({
              type:'post',
              url:'<c:url value="/insertNote" />',
              data: JSON.stringify({
                 "note_to":note_to,
                 "note_content":note_content
              }),
              contentType:'application/json',
              success:function(data){
                 console.log('통신성공' + data);
                 alert('쪽지를 보냈습니다');
                 $("#note_content").val('');
                 $(".modal_wrap").fadeOut();
              },
              error:function(){
                 alert('통신실패');
              }
           })//쪽지 보내기 비동기 끝
      })//보내기 버튼 클릭시
      
      
      //쪽지 모달 끄기
      $(".close-modalBtn").on('click', function(){
         $(".modal_wrap").fadeOut();
      })
      
   });
</script>
</body>
</html>