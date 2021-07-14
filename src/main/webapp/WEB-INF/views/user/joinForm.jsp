<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(()=>{
	userReg();
});

function userReg(){
	$('#regBtn').click(()=>{ 
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
		         url:"join",
		         data:{
		            userId: userId,
		            userPwd: userPwd,
		            },
		         success: () =>{
		            alert("회원가입이 완료되었습니다.");
		            
		            setTimeout("location.href='../'",500);
		         },
		         error: () =>{
		             alert("회원가입이 실패하였습니다.");
		         }
		      });
	});
};

</script>
</head>
<body>
	<div class = 'container'>
		<form name ='joinForm' method ='post'>
		<br>
		<div class = 'form-group'><input type='text' class='form-control' name='userId' id='userId' placeholder='아이디를 입력해주세요' autofocus></div>
		<div class = 'form-group'><input type='password' class='form-control' name='userPwd' id='userPwd' placeholder='비밀번호를 입력해주세요'></div>
		<br>
		    <div class="text-center">
	       	<button id ='regBtn' type=button class = 'btn btn-info'>회원가입</button>
       </div>
		</form>
	</div>
</body>
</html>