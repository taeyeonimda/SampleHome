<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix ='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원 관리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(()=>{
	chkUser();
});

function chkUser(){
	$('#testBtn').click(()=>{
		let userId = $("input:checked").val();

	if(userId==""||userId==null){
		alert("회원을 선택해주세요");
		return;
	}else{
		infoForm.submit();
	}	
	})
}
</script>
</head>
<body>
	<div class = 'container'>
	<h2>회원 관리</h2>
	<form name='infoForm' method ='post' action='./infoUser' >
		<table class="table table-bordered">
		<thead>
		<tr>
		<th>선택</th>
		<th>아이디</th>
		<th>비번</th>
		<th>가입일</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="users" items="${users}">
		<tr>
		<td><input type='radio' name='userId' id='userId' value='${users.userId}'></td>
		<td><c:out value="${users.userId }"/></td>
		<td><c:out value="${users.userPwd }"/></td>
		<td><c:out value="${users.userReg }"/></td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
	</form>
	<a class='btn btn-default' id='testBtn' type='submit'>확인</a>
	 <nav class='Page'>    
      <ul class='pagination'>
      <c:if test="${paging.startPage != 1 }">
         <li class="page-item" ><a class="page-link" href="/SampleHome/admin/user/listUser?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
      </c:if>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
         <c:choose>
            
            <c:when test="${p == paging.nowPage }">
               <li class="page-item" ><a class="page-link" style='font-weight:bold;'>${p }</a></li>
            </c:when>
            
            <c:when test="${p != paging.nowPage }">
               <li class="page-item"  ><a class="page-link" href="/SampleHome/admin/user/listUser?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
            </c:when>
            
         </c:choose>
      </c:forEach>
      <c:if test="${paging.endPage != paging.lastPage}">
         <li class="page-item"  ><a class="page-link" href="/SampleHome/admin/user/listUser?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
      </c:if>
      </ul> 
      </nav> 
	</div>
	 
      
</body>
</html>