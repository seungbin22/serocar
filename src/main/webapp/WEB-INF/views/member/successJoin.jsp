<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/css/member/successJoin.css" />
<link rel="stylesheet" href="/resources/css/uikit.min.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<body>
    <div class="center">
        <div class="container">
            <div class="text">SEROCAR</div>
            <div class="small-text"> ${memberNickname}님 안녕하세요!</div>
            <br>
            <div class="form-container">
                <div class="btn">
                    <button type="button" onclick="location.href='/login'">로그인</button>
                </div>
            </div>
        </div>
	</div>
</body>

</html>