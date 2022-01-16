<%@page import="java.util.List"%>
<%@page import="mul.camp.a.dto.MemberDto"%>
<%@page import="mul.camp.a.dto.oneOoneDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%List<oneOoneDto> olist= (List<oneOoneDto>)request.getAttribute("onelist"); %>
<% MemberDto mem = (MemberDto)request.getSession().getAttribute("login"); %>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/abc.css" />
    <link rel="stylesheet" type="text/css" href="css/qwe.css" />
    <script type="text/javascript" src="js/board.js"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Bootstrap core CSS -->
   <!-- <link href="/webjars/bootstrap/4.5.3/css/bootstrap.css" rel="stylesheet"> -->
    
    <!-- Bootstrap Icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    
    <!-- SimpleLightbox plugin CSS-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/abc.css" rel="stylesheet" />
    
    <link rel="shortcut icon" type="image/x-icon" href="image/YAZASOO.png">
    <title>YAZASOO</title>
</head>
<body>
<header id="main-header">
<jsp:include page="./headerMenu.jsp"></jsp:include>
</header>
<br><br><br><br>
<h1>문의 내역</h1>
<table border="1px" solid black>
<thead>
	<tr>
	<th>　　</th><th>문의 제목</th><th>문의 날짜</th><th>문의 유형</th><th>답변 현황</th>
	</tr>
</thead>
<%
	if(olist == null || olist.size()==0){ 
%>
<tr>
	<td colspan="4" style="text-align:center">문의 내용이 없습니다.</td>
</tr>
<%
}
	else{
		for(int i=0;i<olist.size();i++){
			oneOoneDto ood=olist.get(i);
			int idx = ood.getIdx();
%>
<tr>
	<th>Q : </th> 
	<th><a href="qdetail.do?idx=<%=ood.getIdx()%>"><%=ood.getQtitle()%></a></th>
	<th><%=ood.getRegdate()%></th>
	<th><%=ood.getQtype() %></th>
	<th><%=ood.getAnswerYn() %></th>
</tr>
<%
			}
		}
%>
</table>
<div style="text-align:center">
<%if(mem.getAuth() == 0){ %>
<button type="button" onclick="location.href='oneOone.do?auth=<%=mem.getAuth()%>&id=<%=mem.getId()%>'">질문하기</button>
<%} %>
</div>
<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>