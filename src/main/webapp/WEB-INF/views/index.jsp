<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <title>SEROCAR</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    
    <!-- css -->
    
    
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
        $(document).ready(function () {
            var currentPosition = parseInt($(".quickmenu").css("top"));
            $(window).scroll(function () {
                var position = $(window).scrollTop();
                $(".quickmenu").stop().animate({ "top": position + currentPosition + "px" }, 1000);
            });
        });

    </script>
    <link rel="canonical" href="https://myro.co.kr/" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link rel="stylesheet" href="/resources/css/uikit.min.css">
    <link rel="stylesheet" href="/resources/css/main/main.css">
    <link rel="stylesheet" href="/resources/css/main/blog.css">


</head>

<body>
  <header class="wide-spacing" id="home">
        <div class="main-top-container">
            <div class="uk-grid-match" uk-grid>
                <div style="margin: 0; padding: 0" class="uk-width-2-5@m">
                    <div class="main-left-container">
                        <div>
                            <div class="maintitleTextdiv" style="justify-content: center">
                                <div>
                                    <h2 class="mainsubtitle">
                                          Search for New Car
                                    </h2>

                                </div>
                            </div>

                            <h1 class="maintitlemyro">
                                <b>SEROCAR</b>
                            </h1>
                            <div class="text-focus-in" id="startbutton">
                                <a onclick="start()" class="btn mainstartbutton">시작하기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="margin: 0; padding: 0" class="uk-width-3-5@m">
                    <div style="
                           
                                height: 100vh;
                            ">
                        <div>
                   
                        
                         <video style="height: 100vh; max-width: 100% margin-right:30%;" id="mainVideo" preload="auto" crossorigin="anonymous" data-track="video" muted="" loop="" playsinline="" autoplay="" class="css-1gabl0n" tabindex="-1" data-track-vid-id="03cv6yy1ug1l" data-track-vid-parent="web-www-hero-home">
                         <source src="https://www.polestar.com/dato-assets/11286/1661778014-pure-design2-0-video-website-card_2022_polestar-2_think_other_na_16x9.mp4" type="video/mp4"></video>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </header>


    <!-- Main -->
    <div class="content123">
        <section class="page-section" id="services">

            <div class="text-center">
                <h2 class="section-heading text-uppercase">
                    신차 정보
                </h2>
                <!-- <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3> -->

                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <a href="#car1"><img src="/resources/images/main/car1.png" id="car1size" alt=""></a>

                            <!-- <a class="btn btn-primary btn-xl text-uppercase" href="#car1"></a> -->
                        </span>
                        <h5 class="my-3">토레스</h5>
                        <!-- <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam
                            architecto quo inventore harum ex magni, dicta impedit.</p> -->
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <a href="#car2"><img src="/resources/images/main/car2.png" id="car1size" alt=""></a>
                        </span>
                        <h5 class="my-3">아우디 S6</h5>
                        <!-- <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam
                            architecto quo inventore harum ex magni, dicta impedit.</p> -->
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <a href="#car3"><img src="/resources/images/main/car3.png" id="car1size" alt=""></a>
                        </span>
                        <h5 class="my-3">베뉴</h5>
                        <!-- <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam
                            architecto quo inventore harum ex magni, dicta impedit.</p> -->
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <a href="#car4"><img src="/resources/images/main/car4.png" id="car1size" alt=""></a>
                        </span>
                        <h5 class="my-3">XM3 E-ETECH</h5>
                        <!-- <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam
                            architecto quo inventore harum ex magni, dicta impedit.</p> -->
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <a href="#car5"><img src="/resources/images/main/car5.png" id="car1size" alt=""></a>
                        </span>
                        <h5 class="my-3">K9</h5>
                        <!-- <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam
                            architecto quo inventore harum ex magni, dicta impedit.</p> -->
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <a href="#car6"><img src="/resources/images/main/car6.png" id="car1size" alt=""></a>
                        </span>
                        <h5 class="my-3">트래버스</h5>
                        <!-- <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam
                            architecto quo inventore harum ex magni, dicta impedit.</p> -->
                    </div>
                </div>

        </section>
        <!-- Portfolio Grid-->
        <section class="page-section2" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">
                        자세히 보기
                    </h2>
                    <!-- <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3> -->
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="/resources/images/main/car1.png" alt="..." id="car1" />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">토레스</div>
                                <div class="portfolio-caption-subheading text-muted">쌍용</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="/resources/images/main/car2.png" alt="..." id="car2" />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">아우디 S6</div>
                                <div class="portfolio-caption-subheading text-muted">아우디</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="/resources/images/main/car3.png" alt="..." id="car3" />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">베뉴</div>
                                <div class="portfolio-caption-subheading text-muted">현대</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                        <!-- Portfolio item 4-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal4">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="/resources/images/main/car4.png" alt="..." id="car4" />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">XM3-ETECH</div>
                                <div class="portfolio-caption-subheading text-muted">르노</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                        <!-- Portfolio item 5-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="/resources/images/main/car5.png" alt="..." id="car5" />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">K9</div>
                                <div class="portfolio-caption-subheading text-muted">KIA</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <!-- Portfolio item 6-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal6">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="/resources/images/main/car6.png" alt="..." id="car6" />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">트래버스</div>
                                <div class="portfolio-caption-subheading text-muted">쉐보레</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 뉴스 -->

            <section>
            
                <div class="news-area">
                    <h2 class="section-heading text-uppercase2">
                    뉴스
                    </h2>
                    <div class="contentnews">

                  
                        <div class="products-area-wrapper sm-top">
                            <div class="container container-wide">
                               
                    
                                <div class="row">
                                    <div class="col-12">
                                        <div class="product-wrapper columns-5">
                                            <!-- Start Product Item -->
                                            <div class="col">
                                                <div class="product-item">
                                                    <div class="product-item__thumb">
                                                        <a href="https://n.news.naver.com/mnews/article/056/0011373682?sid=102">
                                                            <img class="thumb-primary" src="/resources/images/main/news2.jpg" alt="Product" />
                                                            <img class="thumb-secondary" src="/resources/images/main/news2.jpg" alt="Product" />
                                                        </a>
                                                    </div>
                    
                                                    <div class="product-item__content">
                                                        <div class="ratting">
                                                            <span><i class="ion-android-star"></i></span>
                                                            <span><i class="ion-android-star"></i></span>
                                                            <span><i class="ion-android-star"></i></span>
                                                            <span><i class="ion-android-star"></i></span>
                                                            <span><i class="ion-android-star-half"></i></span>
                                                        </div>
                                                        <h4 class="title"><a href="single-product.html">대구시, 불법 개조 자동차 집중 단속</a></h4>
                                                        <span class="price">대구시는 오늘(14일)부터 오는 25일까지 시내 주요 도로와 이면도로에서 불법 자동차 집중단속을 실시합니다.</span>
                                                    </div>
                    
                                                    <div class="product-item__action">
                                                        <button class="btn-add-to-cart"><i class="ion-bag"></i></button>
                                                        <button class="btn-add-to-cart"><i class="ion-ios-loop-strong"></i></button>
                                                        <button class="btn-add-to-cart"><i class="ion-ios-heart-outline"></i></button>
                                                        <button class="btn-add-to-cart"><i class="ion-eye"></i></button>
                                                    </div>
                    
                                                    <div class="product-item__sale">
                                                        <span class="sale-txt">25%</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Product Item -->
                    
                                            <!-- Start Product Item -->
                                            <div class="col">
                                                <div class="product-item">
                                                    <div class="product-item__thumb">
                                                        <a href="https://www.inews24.com/view/1538631">
                                                            <img class="thumb-primary" src="/resources/images/main/news3.jpg" alt="Product" />
                                                            <img class="thumb-secondary" src="/resources/images/main/news3.jpg" alt="Product" />
                                                        </a>
                                                    </div>
                    
                                                    <div class="product-item__content">
                                                        <div class="ratting">
                                                            <span><i class="ion-android-star"></i></span>
                                                            <span><i class="ion-android-star"></i></span>
                                                            <span><i class="ion-android-star"></i></span>
                                                            <span><i class="ion-android-star-half"></i></span>
                                                            <span><i class="ion-android-star-half"></i></span>
                                                        </div>
                                                        <h4 class="title"><a href="single-product.html">현대자동차, 디 올 뉴 그랜저 공개</a></h4>
                                                        <span class="price">14일 오후 경기도 고양시 일산서구 대화동 현대모터스튜디오 고양에서 열린 현대자동차 디 올 뉴 그랜저 미디어 론칭에서 차량이 전시되어 있다.</span>
                                                    </div>
                    
                                                    <div class="product-item__action">
                                                        <button class="btn-add-to-cart"><i class="ion-bag"></i></button>
                                                        <button class="btn-add-to-cart"><i class="ion-ios-loop-strong"></i></button>
                                                        <button class="btn-add-to-cart"><i class="ion-ios-heart-outline"></i></button>
                                                        <button class="btn-add-to-cart"><i class="ion-eye"></i></button>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Product Item -->
                    
                                            <!-- Start Product Item -->
                                            <div class="col">
                                                <div class="product-item">
                                                    <div class="product-item__thumb">
                                                        <a href="single-product.html">
                                                            <img class="thumb-primary" src="/resources/images/main/news1.jpg" alt="Product" />
                                                            <img class="thumb-secondary" src="/resources/images/main/news1.jpg" alt="Product" />
                                                        </a>
                                                    </div>
                    
                                                    <div class="product-item__content">
                                                        <div class="ratting">
                                                            <span><i class="ion-android-star"></i></span>
                                                            <span><i class="ion-android-star"></i></span>
                                                            <span><i class="ion-android-star"></i></span>
                                                            <span><i class="ion-android-star"></i></span>
                                                            <span><i class="ion-android-star"></i></span>
                                                        </div>
                                                        <h4 class="title"><a href="single-product.html">"전기차, 미국 자동차시장 주류로…"</a></h4>
                                                        <span class="price">전기차가 이제 미국 자동차 시장에서 주류로 자리 잡기 시작했다고 뉴욕타임스(NYT)가 13일(현지시간) 진단했다.</span>
                                                    </div>
                    
                                                    <div class="product-item__action">
                                                        <button class="btn-add-to-cart"><i class="ion-bag"></i></button>
                                                        <button class="btn-add-to-cart"><i class="ion-ios-loop-strong"></i></button>
                                                        <button class="btn-add-to-cart"><i class="ion-ios-heart-outline"></i></button>
                                                        <button class="btn-add-to-cart"><i class="ion-eye"></i></button>
                                                    </div>
                    
                                                    <div class="product-item__sale">
                                                        <span class="sale-txt">35%</span>
                                                    </div>
                                                </div>
                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3> -->
                </div>
                    <!--Blog Section-->

    
                
                
        </section>
     
        
    </div>

   
    <!-- content fin -->


    </div>

    <!-- Portfolio Modals-->
    <!-- Portfolio item 1 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="/resources/images/main/close-icon.svg"
                        alt="Close modal" />
                </div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="modal-body">
                                <!-- Project details-->
                                <h2 class="text-uppercase">토레스</h2>
                                <p class="item-intro text-muted">쌍용</p>
                                <img class="img-fluid d-block mx-auto" src="/resources/images/main/car1.png" alt="..." />
                                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur
                                    adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt
                                    repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae,
                                    nostrum, reiciendis facere nemo!</p>
                                <ul class="list-inline">
                                    <li>
                                        <strong>Client:</strong>
                                        Threads
                                    </li>
                                    <li>
                                        <strong>Category:</strong>
                                        Illustration
                                    </li>
                                </ul><br>
                                <a href="http://www.smotor.com/kr/showroom/torres/" target="_blank"
                                    class="Portfoliogo"><u>구경하러가기</u></a><br>
                                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal"
                                    type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    돌아가기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio item 2 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="/resources/images/main/close-icon.svg"
                        alt="Close modal" />
                </div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="modal-body">
                                <!-- Project details-->
                                <h2 class="text-uppercase">아우디 S6</h2>
                                <p class="item-intro text-muted">아우디</p>
                                <img class="img-fluid d-block mx-auto" src="/resources/images/main/car2.png" alt="..." />
                                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur
                                    adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt
                                    repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae,
                                    nostrum, reiciendis facere nemo!</p>
                                <ul class="list-inline">
                                    <li>
                                        <strong>Client:</strong>
                                        Explore
                                    </li>
                                    <li>
                                        <strong>Category:</strong>
                                        Graphic Design
                                    </li>
                                </ul>
                                <a href="https://www.audi.co.kr/kr/web/ko/models/a6/s6_2021.html" target="_blank"
                                    class="Portfoliogo"><u>구경하러가기</u></a><br>
                                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal"
                                    type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    돌아가기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio item 3 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="/resources/images/main/close-icon.svg"
                        alt="Close modal" />
                </div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="modal-body">
                                <!-- Project details-->
                                <h2 class="text-uppercase">베뉴</h2>
                                <p class="item-intro text-muted">현대</p>
                                <img class="img-fluid d-block mx-auto" src="/resources/images/main/car3.png" alt="..." />
                                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur
                                    adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt
                                    repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae,
                                    nostrum, reiciendis facere nemo!</p>
                                <ul class="list-inline">
                                    <li>
                                        <strong>Client:</strong>
                                        Finish
                                    </li>
                                    <li>
                                        <strong>Category:</strong>
                                        Identity
                                    </li>
                                </ul>
                                <a href="https://www.hyundai.com/kr/ko/e/vehicles/type/suv" target="_blank"
                                    class="Portfoliogo"><u>구경하러가기</u></a><br>
                                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal"
                                    type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    돌아가기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio item 4 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="/resources/images/main/close-icon.svg"
                        alt="Close modal" />
                </div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="modal-body">
                                <!-- Project details-->
                                <h2 class="text-uppercase">XM3-ETECH</h2>
                                <p class="item-intro text-muted">르노</p>
                                <img class="img-fluid d-block mx-auto" src="/resources/images/main/car4.png" alt="..." />
                                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur
                                    adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt
                                    repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae,
                                    nostrum, reiciendis facere nemo!</p>
                                <ul class="list-inline">
                                    <li>
                                        <strong>Client:</strong>
                                        Lines
                                    </li>
                                    <li>
                                        <strong>Category:</strong>
                                        Branding
                                    </li>
                                </ul>
                                <a href="https://www.renaultkoream.com/new/model/xm3hev_overview.jsp" target="_blank"
                                    class="Portfoliogo"><u>구경하러가기</u></a><br>
                                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal"
                                    type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    돌아가기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio item 5 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="/resources/images/main/close-icon.svg"
                        alt="Close modal" />
                </div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="modal-body">
                                <!-- Project details-->
                                <h2 class="text-uppercase">K9</h2>
                                <p class="item-intro text-muted">KIA</p>
                                <img class="img-fluid d-block mx-auto" src="/resources/images/main/car5.png" alt="..." />
                                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur
                                    adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt
                                    repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae,
                                    nostrum, reiciendis facere nemo!</p>
                                <ul class="list-inline">
                                    <li>
                                        <strong>Client:</strong>
                                        Southwest
                                    </li>
                                    <li>
                                        <strong>Category:</strong>
                                        Website Design
                                    </li>
                                </ul>
                                <a href="https://www.kia.com/kr/vehicles/k9/features" target="_blank"
                                    class="Portfoliogo"><u>구경하러가기</u></a><br>
                                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal"
                                    type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    돌아가기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio item 6 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="/resources/images/main/close-icon.svg"
                        alt="Close modal" />
                </div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="modal-body">
                                <!-- Project details-->
                                <h2 class="text-uppercase">트래버스</h2>
                                <p class="item-intro text-muted">쉐보레</p>
                                <img class="img-fluid d-block mx-auto" src="/resources/images/main/car6.png" alt="..." />
                                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur
                                    adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt
                                    repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae,
                                    nostrum, reiciendis facere nemo!</p>
                                <ul class="list-inline">
                                    <li>
                                        <strong>Client:</strong>
                                        Window
                                    </li>
                                    <li>
                                        <strong>Category:</strong>
                                        Photography
                                    </li>
                                </ul>
                                <a href="https://www.chevrolet.co.kr/rv/traverse-highlight.gm" target="_blank"
                                    class="Portfoliogo"><u>구경하러가기</u></a><br>
                                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal"
                                    type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    돌아가기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <script src="js/polyfill.min.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>

</html>