<%@page import="mul.camp.a.dto.commentDto"%>
<%@page import="java.util.List"%>
<%@page import="mul.camp.a.dto.MemberDto"%>
<%@page import="mul.camp.a.dto.boardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
boardDto dto = (boardDto)request.getAttribute("detail");
List<commentDto> list = (List<commentDto>)request.getAttribute("commentlist");
%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/abc.css" />
    <link rel="stylesheet" type="text/css" href="css/qwe.css" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/detail.js?ver=1"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    
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

<div style="margin-top:130px">
<div align="center">
	<table class="table table-bordered" style="width:80%" border="1">
		<tr>
			<th>작성자</th>
			<td><%=dto.getId() %></td>
		</tr>	
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>	
		<tr>
			<th>지역</th>
			<td><%=dto.getSpot() %></td>
		</tr>	
		<tr>
			<th>작성일</th>
			<td><%=dto.getRegDate() %></td>
		</tr>	
		<tr>
			<th>조회수</th>
			<td><%=dto.getCnt() %></td>
		</tr>	
		<tr>
			<th>내용</th>
			<td align="center"><textarea rows="15" cols="100" readonly><%=dto.getContent() %></textarea></td>
		</tr>	
	</table>
	
	
	<%
	MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
	%>
	<br><br>
	<button type="button" onclick="board()">목록</button>	
	<%if(mem.getId().equals(dto.getId())){ %>
	<%-- <%if(dto.getId().equals("id")){ %> --%>
		<button type="button" onclick="boardUpdate(<%=dto.getIdx() %>)">수정</button>	
		<button type="button" onclick="boardDel(<%=dto.getIdx() %>)">삭제</button>
	<%} %>
	
	<br><br><hr><br><br>
	댓글쓰기
	<input type="hidden" value="<%=mem.getId()%>" id="id">
	<input type="hidden" value="<%=dto.getIdx()%>" id="idx">
	<textarea type="text" id="text" name="text" rows="5" cols="100"></textarea>
	<button type="button" onclick="commentWrite()">등록</button>
	
	
	
<table border="1" style="width:80%">
   <thead>
      <tr>
      <th>글 번호</th> <th>작성자</th> <th>날짜</th> <th>내용</th><th>비고</th>
      </tr>
   </thead>
      <%

         if(list == null || list.size()==0){    //bbslist를 controller 에서 가져와야함
            
      %>
      <tr>
         <td colspan="5">작성된 댓글이 없습니다 !! 댓글을 제일먼저 작성해보세요!</td>
      </tr>
      <%
         }
         else{
            for(int i=0;i < list.size();i++)
            {
               commentDto comment = list.get(i);
      %>
      <tr>
         <th><%=i+1 %></th>
         <th><%=comment.getId() %></th>
         <th><%=comment.getRegDate()%></th>
         <th><%=comment.getText()%></th>
         <th>
         <%if(mem.getId().equals(comment.getId())){ %>       
			<button type="button" onclick="commentDel(<%=comment.getIdx() %>, <%=comment.getBidx() %>)">삭제</button>   
		<%} %>      
         </th>
      </tr>
      <%
            }
         }
      %>
</table>
</div>
</div>
<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>
