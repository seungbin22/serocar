<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="/resources/css/community/sub.css" />
<link rel="stylesheet" href="/resources/css/community/base.css" />
<link rel="stylesheet" href="/resources/css/community/contents.css" />


<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
   <div class="wrap">
      <div class="container-1" id="sub_container">
         <div class="width_fixed">
         <input type="hidden" id="memberEmail" name="memberEmail" value="${memberEmail }">
         <input type="hidden" id="businessNum" name="businessNum" value="${businessNum }">
            <div id="sub_contents" class="sub_contents">
               <div id="sub_content_left" class="width_lg_100p">
                  <div id="sub_content_inner">
                     <h3 class="title">
                        <strong>커뮤니티</strong>
                     </h3>
                     <div class="tab not_use">
                        <ul class="tab_menu-1 row-1 type2-1">
                           <li ><a href="/communityList">게시글</a></li>
                           <li ><a href="/advertisementList">홍보글</a></li>
                           <li class="active"><a>공지사항</a></li>

                        </ul>
                     </div>
                     <div class="btn_area row">
                        <div class="drop_menu mouse_click">
                           <div class="board">
                              <table class="list type1">
                                 <caption>전체 게시물 : 번호, 제목, 글쓴이, 날짜, 조회수, 추천수로 구성됨</caption>
                                 <colgroup>
                                    <col class="width_60 display_sm_none" />
                                    <col />
                                    <col class="width_100 width_phone_80" />
                                    <col class="width_100 width_phone_80 display_sm_none" />
                                    <col class="width_80 display_md_none" />
                                    <col class="width_80 display_md_none" />
                                 </colgroup>
                                 <thead>
                                    <tr>
                                       <th scope="col" class="display_sm_none" style="text-align:center;">번호</th>
                                       <th scope="col" style="text-align:center;">제목</th>
                                       <th scope="col" style="text-align:center;">글쓴이</th>
                                       <th scope="col" class="display_sm_none" style="text-align:center;">날짜</th>
                                       <th scope="col" class="display_md_none" style="text-align:center;">조회 수</th>
                                       <th scope="col" class="display_md_none" style="text-align:center;">추천 수</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:choose>
                                       <c:when
                                          test="${noticeList!=null && pageInfo2.listCount>0 }">
                                          <c:forEach var="article" items="${noticeList }">
                                             <input type="hidden" href="./comDetail_notice?memberEmail=${memberEmail }">
                                             <tr>
                                                <td class="num display_sm_none" style="text-align:center;">${article.notice_num }</td>
                                                <td class=""><a href="./comDetail_notice?notice_num=${article.notice_num}&memberEmail=${memberEmail }"
                                                   class=""> ${article.notice_title}
                                                </a></td>
                                                <td class="text_left color_black"><a href="#"
                                                   class="modal-writer1" data-com-id = "${article.memberNickname}">${article.memberNickname}
                                                </a></td>
                                                <td class="display_sm_none">${article.notice_date}</td>
                                                <td class="display_md_none" style="text-align:center;">${article.notice_views}</td>
                                                <td class="display_md_none" style="text-align:center;">${article.notice_reco}</td>
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
                                    <c:when test="${pageInfo2.page<=1}">
                                 <img src="/resources/images/community/prev.png">&nbsp;
                              </c:when>
                                    <c:otherwise>
                                       <a href="noticeList?page=${pageInfo2.page-1}"><img src="/resources/images/community/prev.png"></a>&nbsp;
                              </c:otherwise>
                                 </c:choose>
                              <c:forEach var="i" begin="${pageInfo2.startPage }"
                                 end="${pageInfo2.endPage }">
                                 <c:choose>
                                    <c:when test="${pageInfo2.page==i }">[${i }]</c:when>
                                    <c:otherwise>
                                       <a href="noticeList?page=${i}">[${i }]</a>
                                    </c:otherwise>
                                 </c:choose> 
                              </c:forEach>

                                 <c:choose>
                                    <c:when test="${pageInfo2.page>=pageInfo2.maxPage }">
                              </c:when>
                                    <c:otherwise>
                                       <a href="noticeList?page=${pageInfo2.page+1}">&nbsp;<img src="/resources/images/community/next.png"></a>
                                    </c:otherwise>
                                 </c:choose>
                              </div>
                        <div class="btn_area">
                           <!-- [10주차] 백엔드 메뉴 별 테이블 생성 -->
                           <form action="./noticeList" name="search-form" autocomplete="off">
                              <input type="text" name="keyword" value="" />
                                <button type="submit" value="검색" class= "searchButton">검색</button>
                           </form>
                           <!-- [10주차] 게시판 글쓰기 → 쓰기 변경 -->
                           <c:if test="${ memberEmail eq '123'}">
                           <a href="./comwriteform_notice"
                              class="btn_board_write btn btn_navy btn_radius btn_regular float_right">쓰기</a>
                              </c:if>
                        </div>

                     </div>

                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
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
   
</body>

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

</html>