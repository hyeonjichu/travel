<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.center{
	margin: auto;
	width: 60%;
	border: 3px solid #0000ff;
	padding: 10px;	 
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

<h2>회원가입</h2>

<div class="center">

<form id="frm" action="regiAf.do" method="post">

<table border="1">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" id="id" size="20">&nbsp;<input type="button" id="btn" value="확인"><br>
		<p id="idcheck" style="font-size: 8px"></p>		
	</td>
</tr>
<tr>
	<th>비밀번호</th>
	<td>
		<input type="password" name="pw" id="pw" size="20">
	</td>
</tr>
<tr>
	<th>비밀번호 확인</th>
	<td>
		<input type="password" name="pw2" id="pw2" size="20">
	</td>
</tr>
<tr>
	<th>이름</th>
	<td>
		<input type="text" name="name" id="name" size="20">
	</td>
</tr>
<tr>
	<th>성별</th>
	<td>
		<input type="radio" name="gender" size="20" value="M" checked>남자
		<input type="radio" name="gender" size="20" value="F">여자
	</td>
</tr>
<tr>
	<th>생년월일</th>
	<td>
		<input type="text" name="birth" id="birth" size="20">
	</td>
</tr>
<tr>
	<th>이메일</th>
	<td>
		<input type="text" name="email" id="email" size="20">
	</td>
</tr>
<tr>
	<th>전화번호</th>
	<td>
		<input type="text" name="phone" id="phone" size="20">
	</td>
</tr>
<tr>
	<th>별명</th>
	<td>
		<input type="text" name="nickName" id="nickName" size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<button type="button" onclick="account()">회원가입</button>
	</td>
</tr>
</table>

</form>
 
</div>

<script type="text/javascript">
$(document).ready(function () {
	
	$("#btn").click(function () {
		$.ajax({
			url:"idcheck.do",
			type:"post",
			data:{ id:$("#id").val() },
			success:function( msg ){
			
				if(msg == "YES"){
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").html("사용할 수 있는 아이디입니다");
				}else{
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").html("사용 중인 아이디입니다");
					$("#id").val("");
				}			
			},
			error:function(){
				alert('error');
			}
		});
	});	
});

$(function(){
	//비밀번호 확인
	$('#pw2').blur(function(){
	   if($('#pw').val() != $('#pw2').val()){
	    	if($('#pw2').val()!=''){
		    alert("비밀번호가 일치하지 않습니다.");
	    	    $('#pw2').val('');
	          $('#pw2').focus();
	       }
	    }
	})  	   
});

function account() {
	if($("#id").val() == ''){
		alert('아이디를 입력해 주십시오');
		$("#id").focus();
	}
	else if($("#pw").val() == ''){
		alert('패스워드를 입력해 주십시오');
		$("#pw").focus();
	}
	else if($("#name").val() == ''){
		alert('이름를 입력해 주십시오');
		$("#name").focus();
	}
	else if($("#birth").val() == ''){
		alert('생년월일을 입력해 주십시오');
		$("#birth").focus();
	}
	else if($("#email").val() == ''){
		alert('이메일을 입력해 주십시오');
		$("#email").focus();
	}
	else if($("#phone").val() == ''){
		alert('전화번호를 입력해 주십시오');
		$("#phone").focus();
	}
	else if($("#nickName").val() == ''){
		alert('닉네임을 입력해 주십시오');
		$("#nickName").focus();
	}
	else{
		$("#frm").submit();
	}
}

</script>




</body>
</html>







