<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Main</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(()=>{
	userReg();
	logon();
})

function userReg(){
	$('#userReg').click(()=>{
		location.href='./user/joinForm'
	})
}

function logon(){
	$('#logon').click(()=>{
		location.href='./user/logon'
	})
}
</script>
</head>
<body>
	<header> 헤더영역 </header>
	<div class='container'>
		메인화면

		<c:if test="${sessionScope.user.userId == 'admin' }">
			<c:redirect url="./admin" />
		</c:if>

		<c:choose>
			<c:when test="${sessionScope.user == null }">
				<c:choose>
					<c:when
						test="${pageContext.request.requestURI=='/home/WEB-INF/views//main.jsp'}">
						<li><a href="/user/logon"><span
								class="glyphicon glyphicon-log-in"></span>로그인</a></li>
						<li><a href="/user/joinForm"><span
								class="glyphicon glyphicon-user"></span>회원가입</a></li>
					</c:when>
					<c:when
						test="${pageContext.request.requestURI=='/home/WEB-INF/views/common/myPage.jsp'}">
						<li><a href="./user/logon"><span
								class="glyphicon glyphicon-log-in"></span>로그인</a></li>
						<li><a href="./user/joinForm"><span
								class="glyphicon glyphicon-user"></span>회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="./user/logon"><span
								class="glyphicon glyphicon-log-in"></span>로그인</a></li>
						<li><a href="./user/joinForm"><span
								class="glyphicon glyphicon-user"></span>회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</c:when>

			<c:when test="${sessionScope.user.userId !='admin'}">
				<c:choose>
					<c:when
						test="${pageContext.request.requestURI=='/hotel/WEB-INF/views//main.jsp'}">
						<li class='font-kr' style='font-size: 20px;'><a href="./">${user.userId}님
								환영합니다.</a></li>
						<li><a href="./user/logout"><span
								class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
						<li><a href="./common/myPage"><span
								class="glyphicon glyphicon-user"></span>마이페이지</a></li>
					</c:when>
					<c:when
						test="${pageContext.request.requestURI=='/hotel/WEB-INF/views/common/myPage.jsp'}">
						<li class='font-kr' style='font-size: 20px;'><a href="./">${user.userId}님
								환영합니다.</a></li>
						<li><a href="./user/logout"><span
								class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
						<li><a href="./common/myPage"><span
								class="glyphicon glyphicon-user"></span>마이페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class='font-kr' style='font-size: 20px;'>${user.userId}님
								환영합니다.</a></li>
						<li><a href="./user/logout"><span
								class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
						<li><a href="./common/myPage"><span
								class="glyphicon glyphicon-user"></span>마이페이지</a></li>
					</c:otherwise>
				</c:choose>
			</c:when>
		</c:choose>

	</div>
	<footer> 풋터영역 </footer>
</body>
</html>