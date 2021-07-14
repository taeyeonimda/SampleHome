<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(()=>{
	userLogin();
});
	
function userLogin(){
	$('#loginBtn').click(()=>{ 
		let userId =$('#userId').val();
	    let userPwd= $("#userPwd").val();
	     
	    if(userId==""){
	    	alert("아이디를 입력해주세요");
	    	return;
	    }
	    
	    if(userPwd==""){
	    	alert("비밀번호를 입력해주세요");
	    	return;
	    }
	    
	      $.ajax({ 
		         url:"login",
		         data:{
		            userId: userId,
		            userPwd: userPwd
		            },
		         success:(result)=>{
		            if(result==0){
		            	alert('아이디 혹은 비밀번호를 확인해주세요.');
		            	return;
		            };
						if(result==1){
			                setTimeout("location.href='../'");
						};
		            }
		      });
	});
};
</script>
</head>
<body>
	<div class='container'>
		<div class="login-form">
			<form id="loginForm" class="form-horizontal" method='post'>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="ID"
						id='userId' name="userId" autofocus> <input
						type="password" class="form-control" placeholder="Password"
						id="userPwd" name="userPwd">
					<button id='loginBtn' type="button" class="btn btn-info btn-block"
						name='login'>login</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>