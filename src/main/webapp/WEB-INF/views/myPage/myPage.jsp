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

<body>
   <form action="./myPage" method="POST">
      <input type="hidden" id="memberEmail" name="memberEmail" value=${memberEmail } />
      <input type="hidden" id="businessNum" name="businessNum" value=${businessNum } />
      <input type="hidden" id="memberNickname" name="memberNickname" value=${memberNickname } />
      <div class="wrapper">
         <div class="container">
            <div class="top-background-div"></div>
            <div class="top-container">
               <div class="profilePhotoContainer">
                  <div class="profilePhoto-text" id="profile">
                  <img style="border-radius: 50%; width:180px; height: 180px; max-width:fit-content; hidden; object-fit: cover; " src="profile/${memberProfile}" />
                  </div>
               </div><br><br>
               <div class="text" value="memberNickname">${memberNickname}</div>
               <button type="button" class="btn-normal" onclick="location.href='/profile?memberEmail=${memberEmail}'">프로필 수정</button>
            </div>
            <div>
               <div class="row">
                  <div class="index-section">
                     <div class="index-circle" onclick="myPickData()">
                        <h5 style="font-family: 'Montserrat' !important">
                           <b>즐겨찾기</b>
                        </h5>
                        <div>
                           <h2 style="line-height: 1; font-weight: 700" id="mypick">1</h2>
                        </div>
                     </div>
						<c:choose>
							<c:when test="${sessionScope.businessNum == null}">
							<div class="index-circle"
							                        onclick="location.href='./myPageList?memberEmail=${memberEmail}&businessNum=${businessNum}&memberNickname=${memberNickname}'">
							                        <h5 style="font-family: 'Montserrat' !important">
							                           <b>내가 쓴 글</b>
							                        </h5>
							                        <div>
							                           <h2 style="line-height: 1; font-weight: 700" id="myReview">${count2}</h2>
							                        </div>
							                     </div>
							</c:when>
							
							<c:when test="${sessionScope.businessNum != null}">
							<div class="index-circle"
							                        onclick="location.href='./myPageList_ad?memberEmail=${memberEmail}&businessNum=${businessNum}&memberNickname=${memberNickname}'">
							                        <h5 style="font-family: 'Montserrat' !important">
							                           <b>내가 쓴 글</b>
							                        </h5>
							                        <div>
							                           <h2 style="line-height: 1; font-weight: 700" id="myReview">${count_ad}</h2>
							                        </div>
							                     </div>
							</c:when>
						</c:choose>

                     <div class="index-circle" onclick="location.href='./myRecord?memberEmail=${memberEmail}&memberNickname=${memberNickname}&businessNum=${businessNum}'">
                        <h5 style="font-family: 'Montserrat' !important">
                           <b>쪽지함</b>
                        </h5>
                        <div>
                           <h2 style="line-height: 1; font-weight: 700" id="myChatting">${chatCount }</h2>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- <div class="section-divider"></div> -->
            <div class="container uk-container-large" id="mypageData">
               <!-- 즐겨찾기 div -->
               <div class="uk-padding-small">
                  <div class="section-title-container">
                     <h3 class="section-title">
                        <b>즐겨찾기</b>
                     </h3>
                  </div>
                  <span id="resultArea">
                     <div style="margin: 16px 0;">
                        <div
                           class="uk-card uk-card-default uk-grid-collapse uk-grid uk-grid-stack"
                           style="padding: 16px" uk-grid="">
                           <div class="uk-width-1-3@m uk-first-column">
                              <div class="uk-grid" uk-grid="" style="margin: 0; height: 60%">
                                 <div class="uk-width-1-2 info-container uk-first-column">
                                    <img class="width:100%" src="/resources/images/car2.jpg"
                                       alt="">
                                 </div>
                                 <div class="uk-width-1-2 info-container">
                                    <div class="car-title">차이름</div>
                                    <div class="uk-text-meta">차종</div>

                                    <div class="info-container" style="margin-top: 40px">
                                       <div
                                          style="display: flex; justify-content: center; align-items: center; width: 50px; height: 50px; border-radius: 50%; background-color: #717171; color: #fff; font-weight: 700;">
                                          L</div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="uk-width-2-3@m">
                              <div class="uk-grid uk-grid-stack" uk-grid=""
                                 style="margin: 0; height: 60%">
                                 <div class="uk-width-expand@m uk-first-column"
                                    style="padding: 16px">
                                    <div class="uk-grid" uk-grid=""
                                       style="margin: 0; height: 50%">
                                       <div
                                          class="uk-width-1-2 info-container-top uk-first-column">
                                          <div class="uk-inline">
                                             <div class="small-title">
                                                연료 <span class="small-text" style="line-height: 40px;">
                                                   전기 </span>
                                             </div>
                                          </div>
                                       </div>
                                       <div
                                          class="
                                                        uk-width-1-2
                                                        info-container-top
                                                    ">
                                          <div class="small-title">
                                             가격 <span class="small-text" style="line-height: 40px;">
                                                4500~6500만원 </span>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="uk-grid" uk-grid=""
                                       style="margin: 0; height: 50%">
                                       <div
                                          class="uk-width-1-2 info-container-bottom uk-first-column">
                                          <div class="small-title">
                                             출시년도 <span class="small-text"> 2022 </span>
                                          </div>
                                       </div>
                                       <div
                                          class="
                                                        uk-width-1-2
                                                        info-container-bottom
                                                    ">
                                          <div class="small-title">
                                             색상 <span class="small-text"> black </span>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="uk-grid uk-grid-stack" uk-grid=""
                                 style="margin: 0; height: 40%">
                                 <div class="uk-width-expand@m info-container uk-first-column">
                                    <div
                                       class="
                                                    uk-text-center
                                                    uk-grid
                                                    uk-width-1-1
                                                    uk-padding-small
                                                "
                                       uk-grid="">

                                       <div class="uk-width-5-7">
                                          <div>
                                             <div class="delete">
                                                <img src="/resources/images/delete.png"
                                                   style="height: 40px; float: right;"
                                                   onclick="deleteSavedRoute(0)">
                                             </div>

                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
               </div>
               </span>
            </div>
            <!-- 내가 쓴 글 div -->

            <div class="info-container p-5">
               <button class="btn-normal" onclick="location.href='./' ">홈으로
                  가기</button>
            </div>
         </div>
         
         
   </form>
</body>
</html>