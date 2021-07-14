<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
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
	alert("수정시 기존패스워드 입력해주세요.");
	chnageUser(); 
	delUser(); 
}); 

//유저수정
function chnageUser(){ 
	$('#chnageBtn').click(()=>{
		let userId = $("#userId").val();
		let originPwd = $('#originPwd').val();//기존비밀번호 확인용 히든타입
		let oriPwd = $('#oriPwd').val();//기존비밀번호 입력해서 확인용
		let userPwd = $("#userPwd").val();
		
		if(originPwd != oriPwd){
			alert("기존비밀번호가 다릅니다");
			return;
		}
		
		  if(oriPwd !="" && userPwd !="")
		      	oriPwd=userPwd;
		$.ajax({
			url: "./chnage",
			data:{
				userId:userId,
				userPwd: userPwd
			}, 
			success: ()=>{
				alert("수정에 성공하였습니다. 메인으로 이동합니다.");
				setTimeout('location.href="./logout"',1500);
				console.log(userId);
				console.log(userPwd);
			}, 
			error: ()=>{
				alert("수정에 실패했습니다."); 
				console.log(userId);
				console.log(userPwd);
			} 
		})
	});
};
 

 
//유저삭제(update)
function delUser(){
	$('#delBtn').click(()=>{
		let userId = $("userId").val();
		let originPwd = $('#originPwd').val();//기존비밀번호 확인용 히든타입
		let oriPwd = $('#oriPwd').val();//기존비밀번호 입력해서 확인용
		
		if(originPwd != oriPwd){
			alert("기존비밀번호가 다릅니다");
			return;
		}
		
		$.ajax({
			url : "./delete", 
			data: {
				userId:$('#userId').val()
			}, 
			success:() =>{
				alert("탈퇴를 완료했습니다. 메인으로 이동합니다.");
				setTimeout('location.href="./logout"', 1500);
			},
			error: () =>{ 
				alert("탈퇴에 실패했습니다.");
			}
		})

		
  
	});
};
</script>
</head>
<body>
	<div class='container'>
		<form>
			<h1 class="text-center">
				<b class='font-kr' style='font-size: 50px;'>회원수정/탈퇴</b>
			</h1>
			<br>
			<p class="text-left font-kr" style='font-size: 20px;'>회원님의 정보입니다.</p>
			<div class="form-group">
				<input class="form-control" id='userId'
					value="${sessionScope.user.userId}"readonly>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id='oriPwd'
					name="oriPwd" placeholder="기존패스워드." maxlength='13'>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id='userPwd'
					name="userPwd" placeholder="영문,특수문자,숫자를 포함해 8자이상을 적어주세요."
					maxlength='13'>
			</div>
			<input type='hidden' id='originPwd'
				value='${sessionScope.user.userPwd}'>
			<!-- 비밀번호 확인용 -->
			<div class='text-center' id='btnLine'>
				<button type='button' class='btn btn-info' id='chnageBtn'>수정</button>
				<button type='button' class='btn btn-danger' id='delBtn'>탈퇴</button>
			</div>
		</form>
	</div>
</body>
</html>