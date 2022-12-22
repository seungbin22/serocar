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
<input type="hidden" value="${car.carNum }"/>
<input type="hidden" value="${carNum }"/>
   <div id="fullpage">

      <div class="section">
         <div class="section2" style="padding-bottom: 120px;" id="fullpage">
            <div class="container">
               <div class="row">
                  <!-- <div class="section2-main-txt">Exterior Colors<br>
                     <h3>새롭게 추가된 외장 컬러는 팰리세이드의 세련된 이미지를 더욱 풍성하게 완성해줍니다.</h3>
                  </div> -->
                  <div class="text-center">
                     <div class="tab-img">
                        <div id="sgp">
                           <img src="./resources/images/carsange/1.webp" alt="스틸그라파이트">
                        </div>
                        <div id="mcd">
                           <img src="./resources/images/carsange/2.webp" alt="문라이트클라우드">
                        </div>
                        <div id="tlb">
                           <img src="./resources/images/carsange/3.webp" alt="타임리스블랙">
                        </div>
                        <div id="svd">
                           <img src="./resources/images/carsange/4.webp" alt="시에라버건디">
                        </div>
                        <div id="rpt">
                           <img src="./resources/images/carsange/5.webp" alt="레인포레스트">
                        </div>
                        <div id="wtc">
                           <img src="./resources/images/carsange/6.webp" alt="화이트크림">
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="container">
               <div class="row bottom-box">
                  <div class="col-sm-6 section02-text text-center">
                     <div class="txt1">
                        <h1>스틸 그라파이트<br>
                           <h3>다크 그레이의 색상이 세련되고 품격있는 느낌을 줍니다.</h3>
                        </h1>
                     </div>
                     <div class="txt2">
                        <h1>문라이트 클라우드<br>
                           <h3>빛에 비추면 세련된 네이비 컬러가 신비한 느낌을 줍니다.</h3>
                        </h1>
                     </div>
                     <div class="txt3">
                        <h1>타임리스 블랙<br>
                           <h3>블랙의 색상이 중후하며 고급스러운 느낌을 줍니다.</h3>
                        </h1>
                     </div>
                     <div class="txt4">
                        <h1>시에라 버건디<br>
                        <h3>버건디 색상이 따뜻하면서 우아한 느낌을 줍니다.</h3></h1>
                     </div>
                     <div class="txt5">
                        <h1>레인 포레스트 (캘리그래피 전용)<br>
                        <h3>다크그린의 색상이 중후함과 고급스러운 느낌을 줍니다.</h3></h1>
                     </div>
                     <div class="txt6">
                        <h1>화이트 크림<br>
                        <h3>화이트 색상의 컬러로 깨끗하고 기품 있는 느낌을 줍니다.</h3></h1>
                     </div>
                  </div>
                  <div class="col-sm-6">
                     <div class="tab-car-color-txt">
                        <ul>
                           <li class="sgp"><a href="#"></a></li>
                           <li class="mcd"><a href="#"></a></li>
                           <li class="tlb"><a href="#"></a></li>
                           <li class="svd"><a href="#"></a></li>
                           <li class="rpt"><a href="#"></a></li>
                           <li class="wtc"><a href="#"></a></li>
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
                                             <div class="gallery-item" data-mfp-src="assets/img/product/product-1.png">
                                                <img src="assets/img/product/05-img-1.jpg" alt="gallery" />
                                                <div class="gallery-item__text">
                                                   <h3>Disk Break</h3>
                                                </div>
                                             </div>
                                          </div>
                           
                                          <div class="col-sm-6 col-lg-3">
                                             <div class="gallery-item" data-mfp-src="assets/img/product/product-2.png">
                                                <img src="assets/img/product/05-img.jpg" alt="gallery" />
                                                <div class="gallery-item__text">
                                                   <h3>Wheel Frame</h3>
                                                </div>
                                             </div>
                                          </div>
                           
                                          <div class="col-sm-6 col-lg-3">
                                             <div class="gallery-item" data-mfp-src="assets/img/product/product-3.png">
                                                <img src="assets/img/product/07-img-1.webp" alt="gallery" />
                                                <div class="gallery-item__text">
                                                   <h3>car steering</h3>
                                                </div>
                                             </div>
                                          </div>
                           
                                          <div class="col-sm-6 col-lg-3">
                                             <div class="gallery-item" data-mfp-src="assets/img/product/product-4.png">
                                                <img src="assets/img/product/07-img-2.webp" alt="gallery" />
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
                                                <div class="gallery-item" data-mfp-src="assets/img/product/product-1.png">
                                                   <img src="./resources/images/carsange/palisadein1.png.jpg" alt="gallery" />
                                                   <div class="gallery-item__text">
                                                      <h3>Disk Break</h3>
                                                   </div>
                                                </div>
                                             </div>
                              
                                             <div class="col-sm-6 col-lg-3">
                                                <div class="gallery-item" data-mfp-src="assets/img/product/product-2.png">
                                                   <img src="./resources/images/carsange/palisadein2.png.jpg" alt="gallery" />
                                                   <div class="gallery-item__text">
                                                      <h3>Wheel Frame</h3>
                                                   </div>
                                                </div>
                                             </div>
                              
                                             <div class="col-sm-6 col-lg-3">
                                                <div class="gallery-item" data-mfp-src="assets/img/product/product-3.png">
                                                   <img src="./resources/images/carsange/07-img-1.webp" alt="gallery" />
                                                   <div class="gallery-item__text">
                                                      <h3>car steering</h3>
                                                   </div>
                                                </div>
                                             </div>
                              
                                             <div class="col-sm-6 col-lg-3">
                                                <div class="gallery-item" data-mfp-src="assets/img/product/product-4.png">
                                                   <img src="./resources/images/carsange/07-img-2.webp" alt="gallery" />
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
                                    <li><a href="javascript:void(0);">재원</a></li>
                                    <li class="img-arrow">상세 펼치기</li>
                                 </ul>
                              </dt>
                              <dd>
                                 가격 :
                                 3,867~6,028만원 <br>
                                 연료 :
                                 가솔린, 디젤 <br>
                                 연비 :
                                 복합 8.5~12.4km/ℓ 도심 7.6~11.3, 고속 10~14.1 <br>
                                 출력 :
                                 202~295hp 엔진<br>
                                 엔진 :
                                 I4, V6 자연흡기
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

   

</body>
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
</html>