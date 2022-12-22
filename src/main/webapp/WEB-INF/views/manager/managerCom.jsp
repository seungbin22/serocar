<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<link rel="stylesheet" href="../resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="/resources/css/uikit.min.css">

<link rel="stylesheet" href="/resources/css/community/sub.css" />
<link rel="stylesheet" href="/resources/css/community/base.css" />
<link rel="stylesheet" href="/resources/css/community/contents.css" />

<body>
      <div class="wrapper">
      <input type="hidden" id="memberEmail" name="memberEmail" value="${memberEmail }" />

         <ul class="tab_menu-1 row-1 type2-1">
                    <li class="active"><a href="">게시물</a></li>
                    <li><a href="./managerAd?memberEmail=${memberEmail }">홍보글</a></li>
                    <li><a href="./managerNotice?memberEmail=${memberEmail }">공지사항</a></li>
                    <li><a href="./managerMember?memberEmail=${memberEmail }">회원 관리</a></li>
            </ul>

         <!-- <div class="section-divider"></div> -->
         <div class="container uk-container-large" id="mypageData">
            <!-- 즐겨찾기 div -->
            <div class="uk-padding-small">
               <div class="section-title-container">
                  <h3 class="section-title">
                     <b>게시물</b>
                  </h3>
               </div>
               <div class="drop_menu mouse_click">
                  <div class="board">
                     <table class="list type1">
                        <caption>전체 게시물 : 번호, 제목, 글쓴이, 날짜, 조회수, 추천수로 구성됨</caption>
                        <colgroup>
                           <col class="width_30 dispaly_sm_none" />
                           <col class="width_30 dispaly_sm_none" />
                           <col class="width_250 display_lg_none" />
                           <col class="width_250 display_lg_none" />
                           <col class="width_250 display_lg_none" />
                           <col class="width_30 dispaly_sm_none" />
                           <col class="width_30 dispaly_sm_none" />
                           <col class="width_30 dispaly_sm_none" />
                        </colgroup>
                        <thead>
                           <tr style="text-align: center;">
                              <th scope="col" class ="dispaly_sm_none"><input type="checkbox" name="allCheck" id="cbx_chkAll"></th>
                              <th scope="col" class="display_sm_none">번호</th>
                              <th scope="col" class="display_lg_none">제목</th>
                              <th scope="col" class="display_lg_none">글쓴이</th>
                              <th scope="col" class="display_lg_none">날짜</th>
                              <th scope="col" class="display_sm_none">조회 수</th>
                              <th scope="col" class="display_sm_none">추천 수</th>
                              <th scope="col" class="display_sm_none">삭제</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:choose>
                              <c:when test="${articleList!=null && pageInfo.listCount>0 }">
                                 
                                 <c:forEach var="article" items="${articleList }">
                                    <input type="hidden"
                                       href="./comDetail?memberEmail=${memberEmail }">
                                    <tr>
                                       <td class="display_sm_none" style="text-align: center;"><input type="checkbox" name="chk" id="chk" class="checkbox_RecipeBoard" value="${articel.comNum}" ></td>
                                       <td class="display_sm_none" style="text-align: center;">${article.comNum }</td>
                                       <td class="display_lg_none"><a href="./comDetail?comNum=${article.comNum}&memberEmail=${memberEmail }"
                                          class="subject"> ${article.comTitle} </a></td>
                                       <td class="display_lg_none" style="text-align: center;"><a href="#"
                                          class="writer" onclick="return false;" >${article.memberNickname}</a></td>
                                       <td class="display_sm_none" style="text-align: center;">${article.comDate}</td>
                                       <td class="display_sm_none" style="text-align: center;">${article.comViews}</td>
                                       <td class="display_sm_none" style="text-align: center;">${article.comReco}</td>
                                       <td class="display_sm_none" style="text-align: center;"><a href="./managerDeleteCom?comNum=${article.comNum}" ><img src="./resources/images/delete.png" style="width: 40px; height: 30px;"/></a></td>
                                    </tr>
                                 </c:forEach>
                              </c:when>
                           </c:choose>
                        </tbody>
                     </table>
                     <input type="submit" class="deleteButton" name="btn" id="deleteButton" value="선택삭제">
                  

               </div>
               </div>

               <div class="paging-in" style="text-align: center;">
                  <c:choose>
                     <c:when test="${pageInfo.page<=1}">
                        <img src="/resources/images/community/prev.png">&nbsp;
                              </c:when>
                     <c:otherwise>
                        <a
                           href="managerCom?memberEmail=${memberEmail }&page=${pageInfo.page-1}"><img
                           src="/resources/images/community/prev.png"></a>&nbsp;
                              </c:otherwise>
                  </c:choose>
                  <c:forEach var="i" begin="${pageInfo.startPage }"
                     end="${pageInfo.endPage }">
                     <c:choose>
                        <c:when test="${pageInfo.page==i }">[${i }]</c:when>
                        <c:otherwise>
                           <a href="managerCom?memberEmail=${memberEmail }&page=${i}">[${i }]</a>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>

                  <%-- <div>
                              <c:forEach var="i" begin="${pageInfo.startPage }"
                                 end="${pageInfo.endPage }">
                                 <c:choose>
                                    <c:when test="${pageInfo.page==i }">[${i }]</c:when>
                                    <c:otherwise>
                                       <a href="communitylist?page=${i}">[${i }]</a>
                                    </c:otherwise>
                                 </c:choose> 
                              </c:forEach>
                              </div> --%>
                  <c:choose>
                     <c:when test="${pageInfo.page>=pageInfo.maxPage }">
                     </c:when>
                     <c:otherwise>
                        <a
                           href="managerCom?memberEmail=${memberEmail }&page=${pageInfo.page+1}">&nbsp;<img
                           src="/resources/images/community/next.png"></a>
                     </c:otherwise>
                  </c:choose>
               </div>
               <form action="./managerCom" name="search-form" autocomplete="off">
                              <input type="text" name="keyword" value="" />
                              <button class="searchButton" type="submit" value="검색">검색</button>
                    </form>
                           
            </div>
         </div>
      </div>
      <script type="text/javascript">
      
      $(document).ready(function() {
         $("#cbx_chkAll").click(function() {
            if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
            else $("input[name=chk]").prop("checked", false);
         });
         
         $("input[name=chk]").click(function() {
            var total = $("input[name=chk]").length;
            var checked = $("input[name=chk]:checked").length;
            
            if(total != checked) $("#cbx_chkAll").prop("checked", false);
            else $("#cbx_chkAll").prop("checked", true); 
         });
         
           $("#deleteButton").click(function(){ 
                  
              var memberEmail = $("#memberEmail").val();
              console.log("memberEmail: "+memberEmail);
                     
              });
      });
      


      
      </script>
</body>
</html>