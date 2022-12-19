<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" type="text/css"
	href="../resources/css/news/newsList.css" />

<body>
	<div class="sub-cmn-wrapper">
		<article class="pt0 sub-cmn-area">
			<div class="grid1170">
				<div class="posttag-wrap">
					<div class="posttag__lt">
						<h3 class="fs30 cmn-list-hd__tit">
							<br>News
						</h3>
									<ul class="cmn-list">
									<c:if test="${newsList != null}">
								<c:forEach var="news" items="${newsList}" varStatus="status">
										<li class="cmn-list-item col1">
											<div class="cmn-list-link__col">
												<a href="#" class="cmn-list-thumb">
												<img src="news/${news.newsImage}"/></a>
												<div class="cmn-list-info">
													<a href="" class="cmn-list-info__link"
														style="box-sizing: 100px;"> <span
														class="fs14 cmn-list-info__label">News</span>
														<p class="fs20 txt-elp cmn-list-info__tit">
															<a href="#" id="newsTitle" name="newsTitle">${news.newsTitle}</a>
														</p>
														<p class="fs14 txt-elp__multi cmn-list-info__txt">
															<a href="#">${news.newsContent}</a>
														</p>
													</a> <small class="cmn-list-info__date">${news.newsDate}</small>
												</div>
											</div>
										</li>
										</c:forEach>
							</c:if>
									</ul>
							<c:if test="${newsList==null }">
								<div class="div_empty">개상품이 없습니다. 분양불가</div>
							</c:if>
					</div>
					<!-- //related posts -->
				</div>
				<!-- //post and tag wrap -->
			</div>
			<!-- //grid -->
		</article>
		<!-- //related posts -->

	</div>
	<!-- //sub common wrapper -->
</body>
</html>