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
    <meta name="viewport" content="width=device-width, sinitial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" type="text/css" href="css/uikit.min.css" />
    <link rel="stylesheet" type="text/css" href="css/header.css" />
    <link rel="stylesheet" type="text/css" href="./resources/css/searchpagecss/searchcarto.css" />

    <link rel="stylesheet" href="./resources/css/searchpagecss/danawa.css" />
    <link rel="stylesheet" href="./resources/css/searchpagecss/danawa1.css" />
    <link rel="stylesheet" href="./resources/css/searchpagecss/danawa5.css" />
    <!-- <link rel="stylesheet" href="./resources/css/searchpagecss/home_style.css" /> -->
    <link rel="stylesheet" href="./resources/css/searchpagecss/NewFile.css" />
    <link rel="stylesheet" href="./resources/images/car" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>

  <body>
                <div class="mainContents">

                    <div aria-label="어떤 차를 찾으세요?" class="section section3">
                        <div class="secWrap">
                            <h2 class="htit">어떤 차를 찾으세요?</h2>
                            <div class="centerSearchForm">
                                <div class="searchBox">
                                  <form action="./carList"> 
                                    <div class="areaSearch">
                                        <div class="el-input el-input--suffix">
                                            <input type="text" name="keyword" autocomplete="off" placeholder="모델명을 입력해주세요. 예) 아이오닉5"
                                                class="el-input__inner">
                                        </div>
                                        
                                        <button type="submit" class="el-button icon-search el-button--default">
                                            <span>검색</span>
                                        </button>
                                        
                                    </div>
                                    </form>
                                </div>
                                <div class="flagitem">
                                    <span class="flag">
                                        <a>#그랜저 IG</a>
                                    </span>
                                    <span class="flag">
                                        <a>#아반떼 AD</a>
                                    </span>
                                    <span class="flag">
                                        <a>#5시리즈 (G30)</a>
                                    </span>
                                    <span class="flag">
                                        <a>#G80</a>
                                    </span>
                                    <span class="flag">
                                        <a>#SM6</a>
                                    </span>
                                </div>
                                <div class="rtabBox">
                                    <div>
                                        <div class="maincont_search">
                                            <div class="inner">
                                                <div class="cate_select">
                                                    <fieldset>
                                                        <form name="carlist_mini2" method="post" enctype="form-data" action="">
                                                            <div id="mini_combo">
                                                                <div id="mini_combo_1">
                                                                    <div class="select_box">
                                                                        <label for="sb_brand">제조사</label>
                                                                        <select
                                                                            name="carinfo1"
                                                                            size="1"
                                                                            onchange="categoryChange(this)"
                                                                            class="color"
                                                                            id="sb_brand">
                                                                            <option value="">제조사</option>
                                                                            <option value="현대">현대</option>
                                                                            <option value="제네시스">제네시스</option>
                                                                            <option value="기아">기아</option>
                                                                            <option value="쉐보레">쉐보레
                                                                            </option>
                                                                            <option value="르노">르노</option>
                                                                            <option value="쌍용">쌍용</option>
                                                                            <option value="BMW">BMW</option>
                                                                            <option value="닛산">닛산</option>
                                                                            <option value="람보르기니">람보르기니</option>
                                                                            <option value="랜드로버">랜드로버</option>
                                                                            <option value="렉서스">렉서스</option>
                                                                            <option value="롤스로이스">롤스로이스</option>
                                                                            <option value="르노">르노</option>
                                                                            <option value="링컨">링컨</option>
                                                                            <option value="마세라티">마세라티</option>
                                                                            <option value="맥라렌">맥라렌</option>
                                                                            <option value="벤틀리">벤틀리</option>
                                                                            <option value="볼보">볼보</option>
                                                                            <option value="시트로엥">시트로엥</option>
                                                                            </option>
                                                                            <option value="이베코">이베코</option>
                                                                            <option value="인피니티">인피니티</option>
                                                                            <option value="재규어">재규어</option>
                                                                            <option value="지프">지프</option>
                                                                            <option value="캐딜락">캐딜락</option>
                                                                            <option value="크라이슬러">크라이슬러</option>
                                                                            <option value="테슬라">테슬라</option>
                                                                            <option value="토요타">토요타</option>
                                                                            <option value="타타대우">타타대우</option>
                                                                            <option value="페라리">페라리</option>
                                                                            <option value="펜트">펜트</option>
                                                                            <option value="포드">포드</option>
                                                                            <option value="포르쉐">포르쉐</option>
                                                                            <option value="폭스바겐">폭스바겐</option>
                                                                            <option value="폴스타">폴스타</option>
                                                                            <option value="푸조">푸조</option>
                                                                            <option value="혼다">혼다</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="select_box">
                                                                        <label for="sb_class">차종선택</label>
                                                                        <select
                                                                            name="carinfo2"
                                                                            size="1"
                                                                            onchange="categoryChange2(this)"
                                                                            class="color"
                                                                            id="sb_class">
                                                                            <option value="">차종선택</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="select_box">
                                                                        <label for="sb_model">모델선택</label>
                                                                        <select
                                                                            name="carinfo3"
                                                                            size="1"
                                                                            onchange="car_model_mini2(this, '3');"
                                                                            class="color"
                                                                            id="sb_model">
                                                                            <option value="">모텔선택</option>
                                                                        </select>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <div id="mini_btn">
                                                                <input
                                                                    type="image"
                                                                    name="formimage1"
                                                                    src="http://xn--2n2bn02bojc.com/as5/site/carpreg/img//searchsb_btn.gif"
                                                                    border="0"
                                                                    align="absmiddle"
                                                                    alt="검색하기"/>
                                                            </div>
                                                        </form>
                                                    </fieldset>
                                                </div>
                                                <!-- 탭 -->
                                                <div class="cate_tab">
                                                    <ul>
                                                        <li>
                                                            <a href="#cate_tab" class="tabbtn">제조사 검색</a>
                                                            <div class="tabcont">
                                                                <img
                                                                    src="http://xn--2n2bn02bojc.com/as5/site/carpreg/img/searchtab_cate01.jpg"
                                                                    usemap="#quick1"
                                                                    alt="제조사 목록">
                                                                <map name="quick1">
                                                                    <area
                                                                        shape="rect"
                                                                        coords="898,9,978,79"
                                                                        href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carnation=2&amp;carinfo1=%ec%9d%b8%ed%94%bc%eb%8b%88%ed%8b%b0"
                                                                        alt="인피니티"/>
                                                                    <area
                                                                        shape="rect"
                                                                        coords="25,15,86,72"
                                                                        href="carList?carBrand=hyundai" id="carBrand" name="carBrand" 
                                                                        alt="현대"/>
                                                                    <area
                                                                        shape="rect"
                                                                        coords="98,12,167,74"
                                                                        href="carList?carBrand=kia" id="carBrand"
                                                                        alt="기아"/>
                                                                    <area
                                                                        shape="rect"
                                                                        coords="182,9,245,77"
                                                                        href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carnation=1&amp;carinfo1=%ec%8c%8d%ec%9a%a9"
                                                                        alt="쌍용"/>
                                                                    <area
                                                                        shape="rect"
                                                                        coords="259,10,331,76"
                                                                        href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carnation=1&amp;carinfo1=%eb%a5%b4%eb%85%b8(%ec%82%bc%ec%84%b1)"
                                                                        alt="르노"/>
                                                                    <area
                                                                        shape="rect"
                                                                        coords="339,12,415,74"
                                                                        href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carnation=1&amp;carinfo1=%ec%89%90%eb%b3%b4%eb%a0%88(%eb%8c%80%ec%9a%b0)"
                                                                        alt="쉐보레"/>
                                                                    <area
                                                                        shape="rect"
                                                                        coords="429,10,489,71"
                                                                        href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carnation=2&amp;carinfo1=%eb%b2%a4%ec%b8%a0"
                                                                        alt="벤츠"/>
                                                                    <area
                                                                        shape="rect"
                                                                        coords="495,10,573,76"
                                                                        href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carnation=2&amp;carinfo1=%ec%95%84%ec%9a%b0%eb%94%94"
                                                                        alt="아우디"/>
                                                                    <area
                                                                        shape="rect"
                                                                        coords="579,6,641,76"
                                                                        href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carnation=2&amp;carinfo1=BMW"
                                                                        alt="BMW"/>
                                                                    <area
                                                                        shape="rect"
                                                                        coords="647,9,734,76"
                                                                        href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carnation=2&amp;carinfo1=%eb%af%b8%eb%8b%88"
                                                                        alt="미니"/>
                                                                    <area
                                                                        shape="rect"
                                                                        coords="746,14,807,76"
                                                                        href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carnation=2&amp;carinfo1=%eb%a0%89%ec%84%9c%ec%8a%a4"
                                                                        alt="렉서스"/>
                                                                    <area
                                                                        shape="rect"
                                                                        coords="824,14,886,74"
                                                                        href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carnation=2&amp;carinfo1=%eb%8b%9b%ec%82%b0"
                                                                        alt="닛산"/>
                                                                </map>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <a href="#cate_tab" class="tabbtn">차종별 검색</a>
                                                            <!-- 차종별 -->

                                                            <div class="tabcont">
                                                                <div
                                                                    role="group"
                                                                    aria-label="checkbox-group"
                                                                    class="el-checkbox-group chkGroup btnType"
                                                                    style="display: flex;">
                                                                    <button style="margin: 1.6rem 0 0 1.6rem;" class="cate-list" onclick="location.href='./carList?carType=경차'">
                                                                        <label class="el-checkbox cate-list">
                                                                            <span class="el-checkbox__input">
                                                                                <span class="el-checkbox__inner"></span>
                                                                                <input type="checkbox" aria-hidden="false" true-value="001" false-value="" class="el-checkbox__original">
                                                                            </span>
                                                                            <span class="el-checkbox__label">경차</span>
                                                                        </label>
                                                                    </button>
                                                                    <button style="margin: 1.6rem 0 0 1.6rem;" class="cate-list">
                                                                        <label class="el-checkbox cate-list">
                                                                            <span class="el-checkbox__input">
                                                                                <span class="el-checkbox__inner"></span><input
                                                                                    type="checkbox"
                                                                                    aria-hidden="false"
                                                                                    true-value="002"
                                                                                    false-value=""
                                                                                    class="el-checkbox__original"></span><span class="el-checkbox__label">소형차</span>
                                                                        </label>
                                                                    </button>
                                                                    <button style="margin: 1.6rem 0 0 1.6rem;" class="cate-list">
                                                                        <label class="el-checkbox cate-list">
                                                                            <span class="el-checkbox__input">
                                                                                <span class="el-checkbox__inner"></span><input
                                                                                    type="checkbox"
                                                                                    aria-hidden="false"
                                                                                    true-value="003"
                                                                                    false-value=""
                                                                                    class="el-checkbox__original"></span><span class="el-checkbox__label">준중형차</span>
                                                                        </label>
                                                                    </button>
                                                                    <button style="margin: 1.6rem 0 0 1.6rem;" class="cate-list">
                                                                        <label class="el-checkbox cate-list">
                                                                            <span class="el-checkbox__input">
                                                                                <span class="el-checkbox__inner"></span><input
                                                                                    type="checkbox"
                                                                                    aria-hidden="false"
                                                                                    true-value="004"
                                                                                    false-value=""
                                                                                    class="el-checkbox__original"></span><span class="el-checkbox__label">중형차</span>
                                                                        </label>
                                                                    </button>
                                                                    <button style="margin: 1.6rem 0 0 1.6rem;" class="cate-list">
                                                                        <label class="el-checkbox cate-list">
                                                                            <span class="el-checkbox__input">
                                                                                <span class="el-checkbox__inner"></span><input
                                                                                    type="checkbox"
                                                                                    aria-hidden="false"
                                                                                    true-value="005"
                                                                                    false-value=""
                                                                                    class="el-checkbox__original"></span><span class="el-checkbox__label">대형차</span>
                                                                        </label>
                                                                    </button>
                                                                    <button style="margin: 1.6rem 0 0 1.6rem;" class="cate-list">
                                                                        <label class="el-checkbox cate-list">
                                                                            <span class="el-checkbox__input">
                                                                                <span class="el-checkbox__inner"></span><input
                                                                                    type="checkbox"
                                                                                    aria-hidden="false"
                                                                                    true-value="006"
                                                                                    false-value=""
                                                                                    class="el-checkbox__original"></span><span class="el-checkbox__label">스포츠카</span>
                                                                        </label>
                                                                    </button>
                                                                    <button style="margin: 1.6rem 0 0 1.6rem;" class="cate-list">
                                                                        <label class="el-checkbox cate-list">
                                                                            <span class="el-checkbox__input">
                                                                                <span class="el-checkbox__inner"></span><input
                                                                                    type="checkbox"
                                                                                    aria-hidden="false"
                                                                                    true-value="007"
                                                                                    false-value=""
                                                                                    class="el-checkbox__original"></span><span class="el-checkbox__label">SUV</span>
                                                                        </label>
                                                                    </button>
                                                                    <button style="margin: 1.6rem 0 0 1.6rem;" class="cate-list">
                                                                        <label class="el-checkbox cate-list">
                                                                            <span class="el-checkbox__input">
                                                                                <span class="el-checkbox__inner"></span><input
                                                                                    type="checkbox"
                                                                                    aria-hidden="false"
                                                                                    true-value="008"
                                                                                    false-value=""
                                                                                    class="el-checkbox__original"></span><span class="el-checkbox__label">RV</span>
                                                                        </label>
                                                                    </button>
                                                                    <button style="margin: 1.6rem 0 0 1.6rem;" class="cate-list">
                                                                        <label class="el-checkbox cate-list">
                                                                            <span class="el-checkbox__input">
                                                                                <span class="el-checkbox__inner"></span><input
                                                                                    type="checkbox"
                                                                                    aria-hidden="false"
                                                                                    true-value="009"
                                                                                    false-value=""
                                                                                    class="el-checkbox__original"></span><span class="el-checkbox__label">경승합차</span>
                                                                        </label>
                                                                    </button>
                                                                    <button style="margin: 1.6rem 0 0 1.6rem;" class="cate-list">
                                                                        <label class="el-checkbox cate-list">
                                                                            <span class="el-checkbox__input">
                                                                                <span class="el-checkbox__inner"></span><input
                                                                                    type="checkbox"
                                                                                    aria-hidden="false"
                                                                                    true-value="010"
                                                                                    false-value=""
                                                                                    class="el-checkbox__original"></span><span class="el-checkbox__label">승합차</span>
                                                                        </label>
                                                                    </button>
                                                                    <button style="margin: 1.6rem 0 0 1.6rem;" class="cate-list">
                                                                        <label class="el-checkbox cate-list">
                                                                            <span class="el-checkbox__input">
                                                                                <span class="el-checkbox__inner"></span><input
                                                                                    type="checkbox"
                                                                                    aria-hidden="false"
                                                                                    true-value="011"
                                                                                    false-value=""
                                                                                    class="el-checkbox__original"></span><span class="el-checkbox__label">화물차</span>
                                                                        </label>
                                                                    </button>
                                                                    <button style="margin: 1.6rem 0 0 1.6rem;" class="cate-list">
                                                                        <label class="el-checkbox cate-list">
                                                                            <span class="el-checkbox__input">
                                                                                <span class="el-checkbox__inner"></span>
                                                                                <input
                                                                                    type="checkbox"
                                                                                    aria-hidden="false"
                                                                                    true-value="012"
                                                                                    false-value=""
                                                                                    class="el-checkbox__original"></span><span class="el-checkbox__label">
                                                                                버스
                                                                            </span>
                                                                        </label>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <a href="#cate_tab" class="tabbtn">가격대별 검색</a>
                                                            <div class="tabcont cate03" id="cate_price">
                                                                <ul>
                                                                    <li class="li_1">
                                                                        <a
                                                                        href="./carList?minMoney=1000&maxMoney=1999"><span>1000</span>만원대</a>
                                                                    </li>
                                                                    <li>
                                                                        <a
                                                                        href="./carList?minMoney=2000&maxMoney=2999"><span>2000</span>만원대</a>
                                                                    </li>
                                                                    <li>
                                                                        <a
                                                                            href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carmoney1=400&amp;carmoney2=600">
                                                                            <span>1000~1500</span>만원</a>
                                                                    </li>
                                                                    <li>
                                                                        <a
                                                                            href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carmoney1=600&amp;carmoney2=1000">
                                                                            <span>1500~2000</span>만원</a>
                                                                    </li>
                                                                    <li>
                                                                        <a
                                                                            href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carmoney1=1000&amp;carmoney2=1500">
                                                                            <span>2000~3000</span>만원</a>
                                                                    </li>
                                                                    <li>
                                                                        <a
                                                                            href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carmoney1=1500&amp;carmoney2=3000">
                                                                            <span>3000~4000</span>만원</a>
                                                                    </li>
                                                                    <li>
                                                                        <a
                                                                            href="http://xn--2n2bn02bojc.com/main.php?m=sale&amp;s=list&amp;carmoney1=3000">
                                                                            <span>4000이상</span>만원 이상</a>
                                                                    </li>
                                                                   
                                                                </ul>
                                                                <p id="cate_price_car"><img src="/resources/images/car/sedan.png" alt="가격 아이콘"/></p>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>

                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    

                </div>
            

            <!-- ------------------------다나와-------------------------- -->

            <div class="autodanawa_wrap">
               
                <div id="autodanawa_content">
                    <div id="autodanawa_gridC">
                        

                        <div class='gridWide'>

                            <div class="newcar_search">
                               
                                <div id='container_newcarlist' class="container_newcarlist">
                                    <div class="top">
                                        <div class='tabHead'>
                                            <ul class='list'>
                                                <li class='on' data-tab='all'>
                                                    <a href='javascript:void(0);'>
                                                        <button type='button'>전체
                                                            <span class='count'>(${pageInfo.listCount })</span></button>
                                                    </a>
                                                </li>

                                            </ul>
                                            <input type='hidden' id='listTab' value='all'/>
                                        </div>
                                       
                                    </div>
                                    <div class="contents">
                                        <div class="filter clearFix">
                                            <ul class="align left">
                                                <li>
                                                    <button
                                                        type="button"
                                                        name="sortType"
                                                        class="btn_align listSortType select"
                                                        value="1">
                                                        <span>인기모델순</span></button>
                                                </li>
                                                <li>
                                                    <button
                                                        type="button"
                                                        name="sortType"
                                                        class="btn_align asc listSortType"
                                                        value="4">
                                                        <span>가격순</span></button>
                                                </li>
                                                
                                                <input type="hidden" id="listSortType" value="1"/>
                                            </ul>
                                            
                                        </div>
                                       <c:choose>
                                    <c:when test="${carList!=null && pageInfo.listCount>0 }">
                                    <c:forEach var="car" items="${carList }">
                                       <input type="hidden" name="carNum" id="carNum" href="./carList?carNum=${car.carNum }">
                                                <ul class="list modelList">
                                                    <li>
                                                        <div class="info">
                                                            <a href="javascript:void(0);" model="4188"
                                                                name="modelDetailLink" class="image">
                                                                <img src="carDetail/${car.carImage }"
                                                                    alt="현대 디 올 뉴 그랜저">
                                                            </a>
                                                            <div class="detail">
                                                                <div class="detail_middle">
                                                                    <a href="javascript:void(0);" model="4188"
                                                                        name="modelDetailLink" class="name">
                                                                        <img src="carBrand/${car.carBrand }"
                                                                            alt="현대">${car.carName } 카넘:${car.carNum }
                                                                    </a>
                                                                    <div class="spec">
                                                                        <span>2022.11. 출시</span>
                                                                        <span>대형</span>
                                                                        <span>${car.carComment }
                                                                    </div>
                                                                    <a href='javascript:void(0);' no='5193632'
                                                                        class='news' name='newcarNews'
                                                                        model='4188'>[관련뉴스] 7세대 신형 그랜저 견적내기 ll 가성비 그랜저
                                                                        &amp; 가장 비싼 그랜저 &amp; 나만의 그랜저 만들기!</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="right">
                                                            <div class="row">
                                                                <div class="price">
                                                                    <strong>${car.carMoney }</strong>만 원
                                                                </div>
                                                                <div class="action">
                                                                    <a href="/newcar/?Work=estimate&Model=4188"
                                                                        class="btn_estm" target="_blank">자세히보기</a>
                                                                </div>
                                                            </div>
                                                                   <div class="likeComment">
                                                <button class="fa fa-heart-o fa-2x Cancle Btn FavBtn"
                                                   id="iconH" value="${car.carNum }">${car.carNum }</button>
                                             </div>                                                
                                                           </div>
                                                          </li>
                                                   
                                                      </ul>
                                                      </c:forEach>
                                       </c:when>
                                    </c:choose>
                                        <div class="page_area">
                                            <a href='javascript:void(0);' page='1' class='on newcarPage'>
                                                <span>1</span></a>
                                            <a href='javascript:void(0);' page='2' class=' newcarPage'>
                                                <span>2</span></a>
                                            <a href='javascript:void(0);' page='3' class=' newcarPage'>
                                                <span>3</span></a>
                                            <a href='javascript:void(0);' page='4' class=' newcarPage'>
                                                <span>4</span></a>
                                            <a href='javascript:void(0);' page='5' class=' newcarPage'>
                                                <span>5</span></a>
                                            <a href='javascript:void(0);' page='6' class=' newcarPage'>
                                                <span>6</span></a>
                                            <a href='javascript:void(0);' page='7' class=' newcarPage'>
                                                <span>7</span></a>
                                            <a href='javascript:void(0);' page='8' class=' newcarPage'>
                                                <span>8</span></a>
                                            <a href='javascript:void(0);' page='9' class=' newcarPage'>
                                                <span>9</span></a>
                                            <a href='javascript:void(0);' page='10' class=' newcarPage'>
                                                <span>10</span></a>
                                            <a href='javascript:void(0);' page='11' class='next newcarPage'>
                                                <span>다음</span></a>
                                        </div>
                                        <div class="paging-in" style="text-align: center;">
											<c:choose>
												<c:when test="${pageInfo.page<=1}">
											<img src="/resources/images/community/prev.png">&nbsp;
										</c:when>
												<c:otherwise>
													<a href="carList?minMoney=${minMoney }&maxMoney=${maxMoney }&carType=${carType }&keyword=${searchKeyword }&carBrand=${searchCarBrand }&page=${pageInfo.page-1}"><img src="/resources/images/community/prev.png"></a>&nbsp;
										</c:otherwise>
										
											</c:choose>
										<c:forEach var="i" begin="${pageInfo.startPage }"
											end="${pageInfo.endPage }">
											<c:choose>
												<c:when test="${pageInfo.page==i }">[${i }]</c:when>
												<c:otherwise>
													<a class='on newcarPage' href="carList?minMoney=${minMoney }&maxMoney=${maxMoney }&carType=${carType }&keyword=${searchKeyword }&carBrand=${searchCarBrand }&page=${i}">[${i }]</a>
												</c:otherwise>
											</c:choose> 
										</c:forEach>
										
						
											<c:choose>
												<c:when test="${pageInfo.page>=pageInfo.maxPage }">
										</c:when>
												<c:otherwise>
													<a href="carList?minMoney=${minMoney }&maxMoney=${maxMoney }&carType=${carType }&keyword=${searchKeyword }&carBrand=${searchCarBrand }&page=${pageInfo.page+1}">&nbsp;<img src="/resources/images/community/next.png"></a>
												</c:otherwise>
											</c:choose>
										</div>
                                    </div>
                                </div>

                                <input type="hidden" value="1" id="page"/>
                                <div id="popup_option_result" class="off">
                                    <div class="list">
                                        <dl class="searchOptionResultList"></dl>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

<script src="./resources/js/searchj.js"></script>
<script>
      //좋아요 
      var likeval = $
      {
         carLike
      };

      let carNum = $
      {
         car.carNum
      };
      let memberEmail = "${memberEmail}";
      let carLikeN = 1;

      if (likeval > 0) {
         console.log(likeval + "좋아요 누름");
         $('.FavBtn').html("좋아요 취소");
         $('.FavBtn').click(function() {
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
         $('.FavBtn').click(function() {
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
         });

      }
   </script>
</body>

</html>