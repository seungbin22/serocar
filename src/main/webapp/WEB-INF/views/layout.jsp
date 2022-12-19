<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />

<!-- css적용 -->
<link rel="stylesheet" href="/resources/css/main/styles.css" />

<!-- 헤더 세트 -->
<link rel="stylesheet" href="/resources/css/uikit.min.css">


<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/uikit.min.js"></script>

</head>
<body>

<!-- header 부분 -->
<tiles:insertAttribute name="header"/>

<!-- body 부분 -->
<tiles:insertAttribute name="body"/>

<!-- body 부분 -->
<tiles:insertAttribute name="footer"/>


</body>
</html>