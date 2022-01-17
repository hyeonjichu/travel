<%@page import="mul.camp.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
MemberDto mem = (MemberDto) request.getSession().getAttribute("login");
MemberDto member = (MemberDto) request.getAttribute("member");
%>
<html>
   <head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/qwe.css" />
    <script type="text/javascript" src="js/write.js"></script>
   <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">-->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
     <!-- Bootstrap Icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    
    <!-- SimpleLightbox plugin CSS-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/qwe.css" rel="stylesheet" />
    
    
    <link rel="shortcut icon" type="image/x-icon" href="image/YAZASOO.png">
    
    <title>회원 수정</title>
   </head>
   <body>
      <section id="container">
         <form action="memberUpdate.do" method="post" id="frm">
            <div class="form-group has-feedback">
               <label class="control-label" for="userId">아이디</label>
               <input type="text" name="id" value="<%= member.getId() %>" readonly="readonly"/>
            </div>
            <div class="form-group has-feedback">
               <label class="control-label" for="userPass">현재비밀번호</label>
               <input type="hidden" value="<%=member.getPw() %>" id="pw">
               <input class="form-control" type="password" id="pw2" name="pw">
            </div>
            <div class="form-group has-feedback">
               <label class="control-label" for="userPass">새비밀번호</label>
               <input class="form-control" type="password" id="pwnew" name="pwnew">
            </div>
            <div class="form-group has-feedback">
               <label class="control-label" for="userPass">새비밀번호 확인</label>
               <input class="form-control" type="password" id="pwnewchk" name="pwnewchk">
            </div>
            <div class="form-group has-feedback">
               <label class="control-label" for="userName">이름</label>
               <input class="form-control" type="text" id="name" name="name" value="<%=member.getName() %>">
            </div>
            <div class="form-group has-feedback">
               <label class="control-label" for="userEmail">이메일</label>
               <input class="form-control" type="text" id="email" name="email" value="<%=member.getEmail() %>">
            </div>
            
            <div class="form-group has-feedback">
               <label class="control-label" for="userPhone">전화번호</label>
               <input class="form-control" type="text" id="phone" name="phone" value="<%=member.getPhone() %>">
            </div>
            
            <div class="form-group has-feedback">
               <label class="control-label" for="userNickname">닉네임</label>
               <input class="form-control" type="text" id="nickName" name="nickName" value="<%=member.getNickName() %>">
            </div>
            <div>
               <button type="button" onclick="memberUpdateBtn()">회원정보수정</button>
            </div>
         </form>
      </section>
   </body>
   <script type="text/javascript">
   function memberUpdateBtn(){
	   var pw = document.getElementById("pw").value;
	   var pw2 = document.getElementById("pw2").value;
	   var pwnew = document.getElementById("pwnew").value;
	   var pwnewchk = document.getElementById("pwnewchk").value;
		   if($("#pw2").val() == ''){
		      alert('현재 패스워드를 입력해 주십시오');
		      $("#pw2").focus();
		   }
		   else if($("#name").val() == ''){
		      alert('이름을 입력해 주십시오');
		      $("#name").focus();
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
			   if($("#pwnew").val() != ''){
				     if(pwnew != pwnewchk){
				    	alert("새 비밀번호를 확인해주세요.");	
				    	$("#pwnew").val('');
				    	$("#pwnewchk").val('');
				    	$("#pwnew").focus();
				     }else{
				    	 if(pw == pw2){
							   if(confirm("정보를 수정하시겠습니까?") == true){
								   //location.href="memberUpdate.do";
								   $("#frm").submit();
							   }
					   }else{
						   alert("현재 비밀번호가 올바르지 않습니다.");
						   $("#pw2").val('');
						   $("#pw2").focus();
					   }
				    }
				}else{
					if(pw == pw2){
						   if(confirm("정보를 수정하시겠습니까?") == true){
							   //location.href="memberUpdate.do";
							   $("#frm").submit();
						   }
				   }else{
					   alert("현재 비밀번호가 올바르지 않습니다.");
					   $("#pw2").val('');
					   $("#pw2").focus();
				   }
				}
			   
		   }
   }
   </script>
</html>