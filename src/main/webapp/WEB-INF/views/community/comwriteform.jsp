<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.3.0/classic/ckeditor.js"></script>
<script>
$(function() {
    ClassicEditor
        .create(document.querySelector('#editor'), {
           ckfinder : {
              uploadUrl:"/upload"
           }
        })
        .then(editor=> {
           window.editor=editor;
        })
        .catch( error => {
            console.error( error );
        });
});   
</script>
</head>

<link rel="stylesheet" href="/resources/css/community/sub.css" />
<link rel="stylesheet" href="/resources/css/community/base.css" />
<link rel="stylesheet" href="/resources/css/community/contents.css" />

<body>
   <form action="communitywrite" method="POST" enctype="multipart/form-data">
   <input type="hidden" id="memberEmail" name="memberEmail" value="${memberEmail }">
      <div class="wrap">
         <div class="container" id="sub_container">
            <div class="width_fixed">

               <div id="sub_contents" class="sub_contents">
                  <div id="sub_content_left" class="width_lg_100p">
                     <div id="sub_content_inner">
                        <h3 class="title">
                           <strong>자유 게시판</strong>
                        </h3>
                        <h4 class="sub_title">
                           <img src="../img/sub/board_write_logo.png" alt="SEROCAR" />
                           글쓰기
                        </h4>
                        <p class="text_right mb10">
                           글 작성 시 <i class="icon_required"></i> 필수 표시된 항목은 꼭 기재해 주세요.
                        </p>
                        <!-- <form action="#" method="post"> -->
                           <fieldset>
                              <legend>자유 게시판 글쓰기</legend>
                              <div class="board">
                                 <table class="form type1">
                                    <caption>자유 게시판 글쓰기 : 카테고리, 제목, 작성자로 구성됨</caption>
                                    <colgroup>
                                       <col class="width_20p width_phone_120 width_sm_30p" />
                                       <col />
                                    </colgroup>
                                    <tbody>
                                       <tr>
                                          <th scope="row"><label for="subject">제목</label><span
                                             class="icon_required">필수</span></th>
                                          <td><input type="text" name="comTitle" id="comTitle"
                                             placeholder="제목을 입력해주세요"
                                             class="input01 required width_400" /> <span
                                             class="guide">* 20자 이내로 입력하세요</span></td>
                                       </tr>
                                       <tr>
                                                    <th scope="row"><label for="writer">작성자</label><span class="icon_required">필수</span></th>
                                                    <td>
                                                        <input type="text" name="memberNickname" id="memberNickname" readonly="readonly" class="input01 required width_400" value="${memberNickname}"/>
                                                    </td>
                                                </tr>
                                    </tbody>
                                 </table>
                                 <table class="form type1">
                                    <caption>자유 게시판 글쓰기 : 내용으로 구성됨</caption>
                                    <colgroup>
                                       <col class="width_20p width_phone_120 width_sm_30p" />
                                       <col />
                                    </colgroup>
                                    <tbody>
                                       <tr>
                                          <th scope="row"><label for="contents">내용 작성</label><span
                                             class="icon_required">필수</span></th>
                                          <td><textarea name="comContent" id="editor"
                                                cols="30" rows="30" class="input01 width_100p"
                                                placeholder="내용을 입력해주세요"></textarea></td>
                                       </tr>
                                    </tbody>
                                 </table>
                                 <p class="color_red bg_yellow lh30 mt10 mb10 pl10 pr10">※
                                    개인정보 노출피해방지를 위하여 주민번호나 계좌번호 등의 개인정보가 노출되어있는지는 않은지 확인하시기
                                    바랍니다.</p>
                                 <!-- <table class="form type1">
                                    <caption>자유 게시판 글쓰기 : 첨부파일로 구성됨</caption>
                                    <colgroup>
                                       <col class="width_20p width_phone_120 width_sm_30p" />
                                       <col />
                                    </colgroup>
                                    
                                 </table> -->
                              </div>
                              <div class="btn_area text_right">
                                 <a href="/communityList"
                                    class="btn_gray btn btn_regular btn_radius5">취소</a> <input
                                    type="submit" value="쓰기"
                                    class="btn_board_write btn btn_navy btn_radius5 btn_regular btn_right">
                              </div>
                           </fieldset>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </form>
</body>
</html>