<%@page import="mul.camp.a.dto.BbsParam"%>
<%@page import="mul.camp.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
<h1>write.jsp</h1>
<div align="center">
	<form action="writeAf.do" method="post" id="frm">
		<table border="1" style="width:1000px">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" size="70px" value="<%=mem.getId() %>" readonly>
					<!-- <input type="text" name="id" size="70px" value="" readonly> -->
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" id="title" name="title" size="70px" >
				</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>
					<select name="spot" id="spot">
						<option value="서울" selected>서울</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청도">충청도</option>
						<option value="경상도">경상도</option>
						<option value="전라도">전라도</option>
						<option value="제주도">제주도</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="20" cols="80" id="content" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="boardWrite()">글쓰기</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
<script type="text/javascript">
function boardWrite(){
	if($("#title").val() == ''){
		alert("제목을 입력해주세요");
		$("#title").focus();
	}else if($("#content").val() == ''){
		alert("내용을 입력하세요.");
		$("#content").focus();
	}else{
		if (confirm("글을 등록하시겠습니까?") == true) {
			$("#frm").submit();
        }
	}
}
</script>
</html>