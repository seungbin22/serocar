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
		<div class="wrapper">
<input type="hidden" id="memberEmail" name="memberEmail" value="" />
			<ul>
				<li for=""><a href="./managerCom?memberEmail=${memberEmail }">게시물</a></li>
				<li for=""><a href="">홍보글</a></li>
				<li for=""><a href="./managerMember?memberEmail=${memberEmail }">회원 관리</a></li>
			</ul>

			<!-- <div class="section-divider"></div> -->
			<div class="container uk-container-large" id="mypageData">
				<!-- 즐겨찾기 div -->
				<div class="uk-padding-small">
					<div class="section-title-container">
						<h3 class="section-title">
							<b>홍보글</b>
						</h3>
					</div>
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
										<th scope="col" class="display_sm_none">번호</th>
										<th scope="col">제목</th>
										<th scope="col">글쓴이</th>
										<th scope="col" class="display_sm_none">날짜</th>
										<th scope="col" class="display_md_none">조회 수</th>
										<th scope="col" class="display_md_none">추천 수</th>
									</tr>
								</thead>
								<tbody>
                                    <c:choose>
                                       <c:when
                                          test="${articleList2!=null && pageInfo2.listCount>0 }">
                                          
                                          1:${memberEmail }<br>
                                          2:${article.memberEmail }
                                          <c:forEach var="article" items="${articleList2 }">
                                             <input type="hidden" href="./comDetail?memberEmail=${memberEmail }">
                                             <tr>
                                                <td class="num display_sm_none">${article.ad_num }</td>
                                                <td class="text_left color_black"><a href="./comDetail?comNum=${article.ad_num}&memberEmail=${memberEmail }"
                                                   class="subject"> ${article.ad_title}
                                                </a></td>
                                                <td class="text_left color_black"><a href="#"
                                                   class="modal-writer1" data-com-id = "${article.memberNickname}">${article.memberNickname}
                                                </a></td>
                                                <td class="display_sm_none">${article.ad_date}</td>
                                                <td class="display_md_none">${article.ad_views}</td>
                                                <td class="display_md_none">${article.ad_reco}</td>
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
                                       <a href="managerAd?page=${pageInfo2.page-1}"><img src="/resources/images/community/prev.png"></a>&nbsp;
                              </c:otherwise>
                                 </c:choose>
                              <c:forEach var="i" begin="${pageInfo2.startPage }"
                                 end="${pageInfo2.endPage }">
                                 <c:choose>
                                    <c:when test="${pageInfo2.page==i }">[${i }]</c:when>
                                    <c:otherwise>
                                       <a href="managerAd?page=${i}">[${i }]</a>
                                    </c:otherwise>
                                 </c:choose> 
                              </c:forEach>

                                 <c:choose>
                                    <c:when test="${pageInfo2.page>=pageInfo2.maxPage }">
                              </c:when>
                                    <c:otherwise>
                                       <a href="managerAd?page=${pageInfo2.page+1}">&nbsp;<img src="/resources/images/community/next.png"></a>
                                    </c:otherwise>
                                 </c:choose>
                              </div>
					
										<form action="./managerAd" name="search-form" autocomplete="off">
                              <input type="text" name="keyword" value="" />
                              <button type="submit" value="검색">검색</button>
                    </form>
					
				</div>
			</div>
		</div>
	</form>
</body>
</html>