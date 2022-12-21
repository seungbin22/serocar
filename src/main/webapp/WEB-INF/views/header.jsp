<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- c:choose 사용 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- substring 사용 -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Document</title>
</head>

<link rel="stylesheet" href="/resources/css/header.css" />

<body>
<form action="./logout" method="post">
<input type="hidden" id="memberEmail" name="memberEmail">
<input type="hidden" id="memberNickname" name="memberNickname">
   <c:choose>
      <c:when test="${sessionScope.memberEmail == null}">
      
         <div id="headerArea">
            <nav id="navcc">
               <div class="nav-wrapper navWidth">
                  <a href="/" id="navlefttext"> <b>SEROCAR</b> 
                  <h7 id="navlongtext2">&nbsp;Select Easy Route Optimized</h7>

                  </a>
                  <ul id="navtextbtn1" class="nav-button-container">
                     <li id="navtextbtn1_1"><a href="/carList">Model</a></li>

                     <li id="navtextbtn1_2"><a href="/newsList">News</a></li>

                     <li id="navtextbtn1_3"><a href="/communityList">Community</a></li>

                     <li id="navtextbtn1_4">
                        <button class="header-btn" type="button" onclick="location.href='/login'"> 
                           로그인
                        </button>
                     </li>

                  </ul>
               </div>
            </nav>
         </div>
      </c:when>

      <c:when test="${sessionScope.memberEmail != null and memberEmail != '123'}">
      
         <div id="headerArea">
            <nav id="navcc">
               <div class="nav-wrapper navWidth">
                  <a href="/" id="navlefttext"> <b>SEROCAR</b> 
                  <h7 id="navlongtext2">&nbsp;Select Easy Route Optimized</h7>

                  </a>
                  <ul id="navtextbtn1" class="nav-button-container">
                     <li id="navtextbtn1_1"><a href="/carList">Model</a></li>

                     <li id="navtextbtn1_2"><a href="/newsList">News</a></li>

                     <li id="navtextbtn1_3"><a href="/communityList">Community</a></li>

                     <li id="loginLogoutNav">
                        <div>
                           <div id="loginLogout">
                           <button class="nav-profile-btn" type="button" aria-expanded="false">
                                    <img style="width: 35px; height: 35px; border-radius: 50%;" id= "header-profile" src="profile/${memberProfile}"/>
                              </button>
                              <div uk-dropdown="mode: hover" class="header-dropdown-style uk-dropdown uk-dropdown-bottom-right">
                                 <ul style="color: #000; text-align: center">
                                    <li id=sidebar><a href="./myPage?memberEmail=${memberEmail }&businessNum=${businessNum}&memberNickname=${memberNickname}">마이페이지</a></li>
                                    <li id=sidebar><a href="./logout">로그아웃</a></li>
                                 </ul>
                              </div> 
                           </div>
                        </div>
                     </li>
                  </ul>
               </div>
            </nav>
         </div>
      </c:when>
      
      <c:when test="${memberEmail eq '123'}">
      
         <div id="headerArea">
            <nav id="navcc">
               <div class="nav-wrapper navWidth">
                  <a href="/" id="navlefttext"> <b>SEROCAR</b> 
                  <h7 id="navlongtext2">&nbsp;Select Easy Route Optimized</h7>
                  
                  </a>
                  <ul id="navtextbtn1" class="nav-button-container">
                     <li id="navtextbtn1_1"><a href="/carList">Model</a></li>

                     <li id="navtextbtn1_2"><a href="/newsList">News</a></li>

                     <li id="navtextbtn1_3"><a href="/communityList">Community</a></li>

                     <li id="loginLogoutNav">
                        <div>
                           <div id="loginLogout">
                           <button class="nav-profile-btn" type="button" aria-expanded="false">
                                    <img style="width: 35px; height: 35px; border-radius: 50%;" id= "header-profile" src="profile/${memberProfile}"/>
                              </button>
                              <div uk-dropdown="mode: hover" class="header-dropdown-style uk-dropdown uk-dropdown-bottom-right">
                                 <ul style="color: #000; text-align: center">
                                    <li><a href="./managerCom?memberEmail=${memberEmail }">관리자 페이지</a></li>
                                    <li><a href="./logout">로그아웃</a></li>
                                 </ul>
                              </div> 
                           </div>
                        </div>
                     </li>
                  </ul>
               </div>
            </nav>
         </div>
      </c:when>
      
   </c:choose>
   </form>
</body>
</html>