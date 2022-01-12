<%@page import="mul.camp.a.dto.MemberDto"%>
<%@page import="mul.camp.a.dto.boardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
boardDto dto = (boardDto)request.getAttribute("detail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
</head>
<body>
<h1>detail.jsp</h1>

<div align="center">
	<table class="table table-bordered" style="width:1000px">
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
	
	<%if(mem.getId().equals(dto.getId())){ %>
	<%-- <%if(dto.getId().equals("id")){ %> --%>
		<button type="button" onclick="boardUpdate(<%=dto.getIdx() %>)">수정</button>	
		<button type="button" onclick="boardDel(<%=dto.getIdx() %>)">삭제</button>
	<%} %>
</div>
<script type="text/javascript">
function boardUpdate(idx){
	location.href = "boardUpdate.do?idx="+idx;
}
function boardDel(idx){
	if (confirm("삭제하시겠습니까?") == true) {
		location.href = "boardDel.do?idx="+idx;
    }
}
	
</script>
</body>
</html>