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
				<li for=""><a href="./managerAd?memberEmail=${memberEmail }">홍보글</a></li>
				<li for=""><a href="">회원 관리</a></li>
			</ul>

			<!-- <div class="section-divider"></div> -->
			<div class="container uk-container-large" id="mypageData">
				<!-- 즐겨찾기 div -->
				<div class="uk-padding-small">
					<div class="section-title-container">
						<h3 class="section-title">
							<b>회원관리</b>
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
										<th scope="col">이메일</th>
										<th scope="col">패스워드</th>
										<th scope="col" class="display_sm_none">닉네임</th>
										<th scope="col" class="display_md_none">성별</th>
										<th scope="col" class="display_md_none">가입날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${articleList3!=null && pageInfo3.listCount>0 }">
											
											<c:forEach var="article" items="${articleList3 }">
												<input type="hidden"
													href="./comDetail?memberEmail=${memberEmail }">
												<tr>
													<td class="num display_sm_none">${article.memberNum }</td>
													<td class="text_left color_black">${article.memberEmail}</td>
													<td class="text_left color_black">${article.memberPassword}</td>
													<td class="display_sm_none">${article.memberNickname}</td>
													<td class="display_md_none">${article.memberGender}</td>
													<td class="display_md_none">${article.memberDate}</td>
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
							<c:when test="${pageInfo3.page<=1}">
								<img src="/resources/images/community/prev.png">&nbsp;
                              </c:when>
							<c:otherwise>
								<a
									href="managerMember?memberEmail=${memberEmail }&page=${pageInfo3.page-1}"><img
									src="/resources/images/community/prev.png"></a>&nbsp;
                              </c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${pageInfo3.startPage }"
							end="${pageInfo3.endPage }">
							<c:choose>
								<c:when test="${pageInfo3.page==i }">[${i }]</c:when>
								<c:otherwise>
									<a href="managerMember?memberEmail=${memberEmail }&page=${i}">[${i }]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${pageInfo3.page>=pageInfo.maxPage }">
							</c:when>
							<c:otherwise>
								<a
									href="managerMember?memberEmail=${memberEmail }&page=${pageInfo3.page+1}">&nbsp;<img
									src="/resources/images/community/next.png"></a>
							</c:otherwise>
						</c:choose>
					</div>
					
										<form action="./managerMember" name="search-form" autocomplete="off">
                              <input type="text" name="keyword" value="" />
                              <button type="submit" value="검색">검색</button>
                    </form>
					
				</div>
			</div>
		</div>
	</form>
</body>
</html>