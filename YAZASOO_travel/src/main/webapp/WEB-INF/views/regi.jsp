<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link rel="stylesheet" type="text/css" href="css/regi.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="image/YAZASOO.png">
</head>
<body>
<div class="main">
    <div class="register">
      <h1>YAZASOO</h1>
      <form id="frm" action="regiAf.do" method="post">
        <label>아이디</label><br>
        <input type="text" class="put" name="id" id="id" placeholder="아이디를 입력해주세요">&nbsp;<input type="button" id="btn" value="확인"><br>
        <p id="idcheck" style="font-size: 8px"></p>   
        <br>
        <label>비밀번호</label>
        <br>
        <input type="password" class="put" name="pw" id="pw" placeholder="비밀번호를 입력해주세요">
        <br><br>
        <label>비밀번호 확인</label>
        <br>
        <input type="password" class="put" name="pw2" id="pw2" placeholder="비밀번호를 다시 입력해주세요">
        <br><br>
        <label>이름</label>
        <br>
        <input type="text" class="put" name="name" id="name" placeholder="이름을 입력해주세요">
        <br><br>
        <label>성별</label>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="gender" id="male" value="남">
        &nbsp;
        <span id="male">남</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="gender" id="female" value="여">
        &nbsp;
        <span id="female">여</span>
        <br><br>
        <label>생년월일</label>
        <br>
        <input type="date" class="put" name="birth" id="birth">
        <br><br>
        <label>이메일</label>
        <br>
        <input type="email" class="put" name="email" id="email" placeholder="이메일을 입력해주세요">&nbsp;<input type="button" id="btnEmail" value="확인"><br>
        <p id="emailcheck" style="font-size: 8px"></p>
        <br><br>
        <label>전화번호</label>
        <br>
        <input type="text" class="put" name="phone" id="phone" placeholder="전화번호를 입력해주세요">
        <br><br>
        <label>별명</label>
        <br>
        <input type="text" class="put" name="nickName" id="nickName" placeholder="별명을 입력해주세요">
        <br><br>
        <button type="button" onclick="account()">회원가입</button>
      </form>
    </div>
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
               $("#id").attr("readonly", true);
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
   $("#btnEmail").click(function () {
      $.ajax({
         url:"emailcheck.do",
         type:"post",
         data:{ email:$("#email").val() },
         success:function( msg ){
         
            if(msg == "YES"){
               $("#emailcheck").css("color", "#0000ff");
               $("#emailcheck").html("사용할 수 있는 이메일입니다");
               $("#email").attr("readonly", true);
            }else{
               $("#emailcheck").css("color", "#ff0000");
               $("#emailcheck").html("사용 중인 이메일입니다");
               $("#email").val("");
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
//   alert('account');

   if($("#id").val() == ''){
      alert('아이디를 입력해 주십시오');
      $("#id").focus();
   }
   else if($("#pw").val() == ''){
      alert('패스워드를 입력해 주십시오');
      $("#pw").focus();
   }
   else if($("#pw2").val() == ''){
      alert('패스워드를 확인해 주십시오');
      $("#pw2").focus();
   }
   else if($("#name").val() == ''){
      alert('이름을 입력해 주십시오');
      $("#name").focus();
   }
   else if($("#gender").val() == ''){
      alert('성별을 입력해 주십시오');
      $("#gender").focus();
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