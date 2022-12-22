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
	
	<!-- carcar -->
    <link rel="stylesheet" href="./resources/css/pub/bootstrap.min1.css">
    <link rel="stylesheet" href="./resources/css/pub/sangse.css">
	<link rel="stylesheet" href="./resources/css/pub/css/common1.css">
	<link rel="stylesheet" href="./resources/css/pub/css/common.css">
	<!-- img -->
    <link href="css/pub/css/magnific-popup.min.css" rel="stylesheet" />
    <!--== Bootstrap Min CSS ==-->
    <link href="css/pub/css/bootstrap.min.css" rel="stylesheet" />
    <!--== Main Style CSS ==-->
    <link href="css/pub/css/style.css" rel="stylesheet" />
    <!--== Helper Min CSS ==-->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<!--=======================Javascript============================-->



	<!-- 펼치기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="./resources/js/sangse/shCore.js"></script>
	<script type="text/javascript" src="./resources/js/sangse/shBrushXml.js"></script>
	<script type="text/javascript" src="./resources/js/sangse/shBrushCss.js"></script>
	<script type="text/javascript" src="./resources/js/sangse/shBrushJScript.js"></script>
	<script type="text/javascript" src="./resources/js/sangse/guide.js"></script>
	<script src="./resources/js/sangse/jquery-3.4.1.min.js"></script>
	<script src="./resources/js/sangse/layout.js"></script>


	<script type="text/javascript">
		SyntaxHighlighter.all();
		$(document).ready(function(){
			$('.g-nav-snb').append(webSnb);
			$('.g-nav-snb ul li').eq(5).addClass("active");
			$('#g-aside .g-area-control a').trigger('click');
	
			$(document).on('click', '.table-accordion dt a', function(e) {
				e.preventDefault();
	
				var _accordionDl = $(this).closest('dl');
				$('.table-accordion dl').removeClass('active');
				$('.table-accordion dd').slideUp('400');
				if(!_accordionDl.children('dd').is(":visible")){
					_accordionDl.addClass('active');
					_accordionDl.children('dd').slideDown('400');
				}
			});
		});
	</script>
	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="homeNotice.js" type="text/javascript"></script>

	<script src="./resources/js/common.js"></script>
	<!-- <script src="js/jquery.fullpage.min.js"></script> -->
	<script src="./resources/js/js.js"></script>
	<!-- img -->
    <!--=== Slicknav Min Js ===-->
    <script src="./resources/js/sangse/jquery.slicknav.min.js"></script>
    <!--=== Magnific Popup Min Js ===-->
    <script src="./resources/js/sangse/jquery.magnific-popup.min.js"></script>
    <script src="./resources/js/sangse/active.js"></script>
</head>

<body>
	<div id="fullpage">

		<div class="section">
			<div class="section2" style="padding-bottom: 120px;" id="fullpage">
				<div class="container">
					<div class="row">
						<div class="section2-main-txt"><br>
							<h1>SPORTAGE</h1>
						</div>
						<div class="text-center">
							<div class="tab-img">
								<div id="sgp7">
									<img src="./resources/images/carsange/sportage1.png" alt="어비스 블랙 펄 (블랙잉크)">
								</div>
								<div class="display-none" id="mcd7">
									<img src="./resources/images/carsange/sportage2.png" alt="세레니티 화이트 펄 (블랙잉크)">
								</div>
								<div class="display-none" id="tlb7">
									<img src="./resources/images/carsange/sportage3.png" alt="어비스 블랙 펄">
								</div>
								<div class="display-none" id="svd7">
									<img src="./resources/images/carsange/sportage4.png" alt="세레니티 화이트 펄">
								</div>
								<div class="display-none" id="rpt7">
									<img src="./resources/images/carsange/sportage5.png" alt="큐레아티드 실버 메탈">
								</div>
								<div class="display-none" id="wtc7">
									<img src="./resources/images/carsange/sportage6.png" alt="트랜스미션 블루 펄">
								</div>
								
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row bottom-box">
						<div class="col-sm-6 section02-text text-center">
							<div class="txt1">
								<h1>스노우 화이트 펄<br>
									<!-- <h3>다크 그레이의 색상이 세련되고 품격있는 느낌을 줍니다.</h3> -->
								</h1>
							</div>
							<div class="txt2">
								<h1>스틸 그레이
									<!-- <h3>빛에 비추면 세련된 네이비 컬러가 신비한 느낌을 줍니다.</h3> -->
								</h1>
							</div>
							<div class="txt3">
								<h1>그래비티 그레이<br>
									<!-- <h3>블랙의 색상이 중후하며 고급스러운 느낌을 줍니다.</h3> -->
								</h1>
							</div>
							<div class="txt4">
								<h1>퓨전 블랙
									<br>
								<!-- <h3>버건디 색상이 따뜻하면서 우아한 느낌을 줍니다.</h3></h1> -->
							</div>
							<div class="txt5">
								<h1>다우닝 레드
									<br>
								<!-- <h3>다크그린의 색상이 중후함과 고급스러운 느낌을 줍니다.</h3></h1> -->
							</div>
							<div class="txt6">
								<h1>베스타 블루
									<br>
								<!-- <h3>화이트 색상의 컬러로 깨끗하고 기품 있는 느낌을 줍니다.</h3></h1> -->
							</div>
							
						</div>
						<div class="col-sm-6">
							<div class="tab-car-color-txt">
								<ul>
									<li class="sgp7"><a href="#"> </a></li>
									<li class="mcd7"><a href="#"></a></li>
									<li class="tlb7"><a href="#"></a></li>
									<li class="svd7"><a href="#"></a></li>
									<li class="rpt7"><a href="#"></a></li>
									<li class="wtc7"><a href="#"></a></li>
								</ul>
							</div>
			
						</div>
							
					</div> 
				</div> 
			</div>
		</div>
		<!-- 섹션2끝 -->
	
	
		<div class="g-content">
			<div class="g-box-basic">
				<h2 class="g-tit-basic">상세정보&nbsp;<button style="border: none;" class="fa fa-2x CancleBtn LikeBtn" id="iconH" ><img style="background-color:white; width: 45px; height: 45px;" id="iconH" class="iconH" src="../resources/images/star.png"/></button></h2>
	
				<!-- 탭그룹 -->
				<div class="row">
					<!-- <h3 class="g-tit-basic">TABLE2(아코디언게시판)</h3> -->
					<div class="tab-wrap g-tab-sample ui-tab">
						<div class="tab-content">
							<div class="g-tab-inner">
								<!-- view -->
								<div class="table-accordion">
									<!-- <div class="boardTotalcount">전체 <span>24</span>건</div> -->
									<dl>
										<dt>
											<ul>
												<li>Q</li>
												<li><a href="javascript:void(0);">익스테리어</a></li>
												<li class="img-arrow">상세 펼치기</li>
											</ul>
										</dt>
										<dd>
											<div class="page-content-wrapper sp-y">
											<div class="gallery-page-content">
												<div class="container container-wide">
													<div class="row mtn-30 image-gallery">
														<div class="col-sm-6 col-lg-3">
															<div class="gallery-item" data-mfp-src="./resources/images/carsange/sportageEx1.png">
																<img src="./resources/images/carsange/sportageEx1.png" alt="gallery" />
																<div class="gallery-item__text">
																	<h3>Disk Break</h3>
																</div>
															</div>
														</div>
									
														<div class="col-sm-6 col-lg-3">
															<div class="gallery-item" data-mfp-src="./resources/images/carsange/sportageEx2.png">
																<img src="./resources/images/carsange/sportageEx2.png" alt="gallery" />
																<div class="gallery-item__text">
																	<h3>Wheel Frame</h3>
																</div>
															</div>
														</div>
									
														<div class="col-sm-6 col-lg-3">
															<div class="gallery-item" data-mfp-src="./resources/images/carsange/sportageEx3.png">
																<img src="./resources/images/carsange/sportageEx3.png" alt="gallery" />
																<div class="gallery-item__text">
																	<h3>car steering</h3>
																</div>
															</div>
														</div>
									
														<div class="col-sm-6 col-lg-3">
															<div class="gallery-item" data-mfp-src="./resources/images/carsange/sportageEx4.png">
																<img src="./resources/images/carsange/sportageEx4.png" alt="gallery" />
																<div class="gallery-item__text">
																	<h3>car steering</h3>
																</div>
															</div>
														</div>
									
														
													</div>
												</div>
											</div>
										</div> 
									</dd>
									</dl>
									<dl>
										<dt>
											<ul>
												<li>Q</li>
												<li><a href="javascript:void(0);">인테리어</a></li>
												<li class="img-arrow">상세 펼치기</li>
											</ul>
										</dt>
										<dd>
											<div class="page-content-wrapper sp-y">
												<div class="gallery-page-content">
													<div class="container container-wide">
														<div class="row mtn-30 image-gallery">
															<div class="col-sm-6 col-lg-3">
																<div class="gallery-item" data-mfp-src="./resources/images/carsange/sportageIn1.png">
																	<img src="./resources/images/carsange/sportageIn1.png" alt="gallery" />
																	<div class="gallery-item__text">
																		<h3>Disk Break</h3>
																	</div>
																</div>
															</div>
										
															<div class="col-sm-6 col-lg-3">
																<div class="gallery-item" data-mfp-src="./resources/images/carsange/sportageIn2.png">
																	<img src="./resources/images/carsange/sportageIn2.png" alt="gallery" />
																	<div class="gallery-item__text">
																		<h3>Wheel Frame</h3>
																	</div>
																</div>
															</div>
										
															<div class="col-sm-6 col-lg-3">
																<div class="gallery-item" data-mfp-src="./resources/images/carsange/sportageIn3.png">
																	<img src="./resources/images/carsange/sportageIn3.png" alt="gallery" />
																	<div class="gallery-item__text">
																		<h3>car steering</h3>
																	</div>
																</div>
															</div>
										
															<div class="col-sm-6 col-lg-3">
																<div class="gallery-item" data-mfp-src="./resources/images/carsange/">
																	<img src="./resources/images/carsange/sonataIn4.png" alt="gallery" />
																	<div class="gallery-item__text">
																		<h3>car steering</h3>
																	</div>
																</div>
															</div>
										
															
														</div>
													</div>
												</div>
											</div> 	
										</dd>
									</dl>
									<dl>
										<dt>
											<ul>
												<li>Q</li>
												<li><a href="javascript:void(0);">제원</a></li>
												<li class="img-arrow">상세 펼치기</li>
											</ul>
										</dt>
										<dd>
											가격 :							
											2,474~3,818만원<br>
											연료 :
											LPG, 가솔린, 디젤 <br>
											연비 :
											복합 9~14.5km/ℓ 도심 8.1~12.9, 고속 10.2~17 <br>
											출력 :
											146~184hp 엔진<br>
											엔진 :
											I4 싱글터보
										</dd>
									</dl>
								</div>
								
							</div>
								<!-- //view -->
							</div>
						</div>
						
					</div>
				</div>
				<!-- //탭그룹 -->
	
			</div>
		</div>
<script>
      //좋아요 
      var likeval = ${carLike};

      let carNum = ${carNum};
      let memberEmail = "${memberEmail}";
      let carLikeN = 1;

      if (likeval > 0) {
         console.log(likeval + "좋아요 누름");
         $('.iconH').attr("src", "../resources/images/starcolor.png");
         $('.LikeBtn').click(function() {
            $.ajax({
               type : 'post',
               url : '<c:url value ="/carlikeDown"/>',
               contentType : 'application/json',
               data : JSON.stringify({
                  "carNum" : carNum,
                  "memberEmail" : memberEmail,
                  "carLikeN" : carLikeN
               }),
               success : function(data) {
                  alert('취소 성공');
               }
            });// 아작스 끝
         });

      } else {
         console.log(likeval + "좋아요 안누름")
         console.log(memberEmail);
         $('.LikeBtn').click(function() {
            $.ajax({
               type : 'post',
               url : '<c:url value ="/carlikeUp"/>',
               contentType : 'application/json',
               data : JSON.stringify({
                  "carNum" : carNum,
                  "memberEmail" : memberEmail,
                  "carLikeN" : carLikeN
               }),
               success : function(data) {
                  alert('성공염');
               }
            });// 아작스 끝
            $('.iconH').attr("src", "../resources/images/starcolor.png");
         });

      }
   </script>
</body>

</html>