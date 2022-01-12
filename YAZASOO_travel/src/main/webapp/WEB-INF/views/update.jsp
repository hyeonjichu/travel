<%@page import="mul.camp.a.dto.boardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
boardDto dto = (boardDto)request.getAttribute("detail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>update.jsp</h1>
<div align="center">
	<form action="boardUpdateAf.do" method="post" id="frm">
		<table border="1" style="width:1000px">
			<input type="hidden" id="idx" name="idx" value="<%=dto.getIdx() %>">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" size="70px" value="<%= dto.getId() %>" readonly>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" id="title" name="title" size="70px" value="<%= dto.getTitle()%>">
				</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>
					<input type="text" id="date" name="date" size="70px" value="<%= dto.getRegDate()%>" readonly>
				</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>
					<select name="spot" id="spot">
						<option value="서울" <%if(dto.getSpot().equals("서울")){ %>selected<%} %>>서울</option>
						<option value="경기도" <%if(dto.getSpot().equals("경기도")){ %>selected<%} %>>경기도</option>
						<option value="강원도" <%if(dto.getSpot().equals("강원도")){ %>selected<%} %>>강원도</option>
						<option value="충청도" <%if(dto.getSpot().equals("충청도")){ %>selected<%} %>>충청도</option>
						<option value="경상도" <%if(dto.getSpot().equals("경상도")){ %>selected<%} %>>경상도</option>
						<option value="전라도" <%if(dto.getSpot().equals("전라도")){ %>selected<%} %>>전라도</option>
						<option value="제주도" <%if(dto.getSpot().equals("제주도")){ %>selected<%} %>>제주도</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="20" cols="80" id="content" name="content" ><%=dto.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="boardUpdate()">수정하기</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
<script type="text/javascript">
function boardUpdate(){
	if($("#title").val() == ''){
		alert("제목을 입력해주세요");
		$("#title").focus();
	}else if($("#content").val() == ''){
		alert("내용을 입력하세요.");
		$("#content").focus();
	}else{
		if (confirm("글을 수정하시겠습니까?") == true) {
			$("#frm").submit();
        }
	}
}
</script>
</html>