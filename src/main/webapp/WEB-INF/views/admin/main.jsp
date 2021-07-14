<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix ='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자 메인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<header>헤더</header>
	<div class = 'container'>
	 어드민 메인화면
	 <a class ='btn btn-default'  href='admin/user/listUser'>유저관리</a>
	 <a class ='btn btn-warning'  href='./user/logout'>로그아웃</a>
	</div>
<footer>풋터</footer>
	<c:choose>
<c:when test="${sessionScope.user.userId =='admin'}">
</c:when>
<c:when test="${sessionScope.user.userId !='admin'}">
<c:redirect url='/user/logout'/>
</c:when>
</c:choose>
</body>
</html>