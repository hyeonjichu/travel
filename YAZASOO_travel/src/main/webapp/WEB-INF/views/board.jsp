<%@page import="mul.camp.a.dto.boardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
   List<boardDto> bbslist=(List<boardDto>)request.getAttribute("bbslist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>
<body>
<div align="center">
<h1> 여행지 리뷰 게시판 </h1>

<table border="1">
   <thead>
      <tr>
      <th>글 번호</th> <th>글 제목</th> <th>작성자</th> <th>날짜</th> <th>조회수</th>
      </tr>
   </thead>
      <%
         if(bbslist == null || bbslist.size()==0){    //bbslist를 controller 에서 가져와야함
            
      %>
      <tr>
         <td colspan="5">작성된 글이 없습니다 !! 글을 제일먼저 작성해보세요!</td>
      </tr>
      <%
         }
         else{
            for(int i=0;i < bbslist.size();i++)
            {
            	boardDto bbs=bbslist.get(i);
         
      %>
      <tr>
         <th><%=i+1 %></th>
         <th><a href="detail.do?idx=<%=bbs.getIdx()%>"><%=bbs.getTitle()%></a></th>
         <th><%=bbs.getId() %></th>
         <th><%=bbs.getRegDate()%></th>
         <%-- <th><fmt:formatDate value="<%=bbs.getRegDate() %>" pattern="yyyy-MM-dd HH:mm"/></th> --%>
         
         <th><%=bbs.getCnt()%></th>
      </tr>
      <%
            }
         }
      %>
</table>
<select id="choice">
   <option value="title">제목</option>   
   <option value="content">내용</option>   
   <option value="writer">작성자</option>
   <option value="location">지역</option>   
</select>
<input type="text" id="search" value="">
<button type="button" onclick="searchBbs()">검색</button>
<br>
<hr>

</div>
<br>
<div align="center">
   <a href="write.do">글쓰기</a>


</div>

<script type="text/javascript">
function searchBbs(){
   let choice = document.getElementById("choice").value;
   let search = document.getElementById("search").value;
   
   location.href = "board.do?choice="+ choice + "&search=" + search;
}
</script>
</body>
</html>