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
        <h1></h1>
        <div class="header-tag">
            <nav>
            <ul>
                <li><a href="#">날씨</a>
                    <ul>
                        <li><a href="https://weather.naver.com/">오늘의 날씨</a></li>
                    </ul>
                </li>   
                <li><a href="board.do">지역별게시판</a>
                     <ul>
                        <li><a href="board.do">전체</a></li>
                        <li><a href="board.do?spot=seoul">서울</a></li>
                        <li><a href="board.do?spot=gyeonggi">경기도</a></li>
                        <li><a href="board.do?spot=gangwon">강원도</a></li>
                    </ul>
                </li>    
                <li><a href="#">지역별게시판</a>
                     <ul>
                        <li><a href="board.do?spot=chungcheong">충청도</a></li>
                        <li><a href="board.do?spot=gyeongsang">경상도</a></li>
                        <li><a href="board.do?spot=jeolla">전라도</a></li>
                        <li><a href="board.do?spot=jeju">제주도</a></li>
                    </ul>
                </li>    
                <li><a href="mypage.do">MyPage</a></li>
                <li><a href="logout.do">Log-out</a></li>
            </ul>
            <div class="header-search">
            <form class="header-search-bar">
                <input type="serach" class="text">
                <input type="submit" class="submit" value="search">
            </form>
        </div>
        </nav>
        <div></div>
        </div>
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
	댓글
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
         <%-- <th><fmt:formatDate value="<%=bbs.getRegDate()%>" pattern="yyyy-MM-dd"/></th> --%>
         <th><%=comment.getText()%></th>
         <th>
         <%if(mem.getId().equals(comment.getId())){ %>
			<%-- <button type="button" onclick="commentUpdate(<%=comment.getIdx()%>, <%=comment.getBidx()%>)">수정</button> --%>         
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
<script type="text/javascript">
function board(){
	location.href = "board.do";
}
function boardUpdate(idx){
	if (confirm("수정하시겠습니까?") == true) {
		location.href = "boardUpdate.do?idx="+idx;
	}
}
function boardDel(idx){
	if (confirm("삭제하시겠습니까?") == true) {
		location.href = "boardDel.do?idx="+idx;
    }
}
/* function commentUpdate(idx, bidx){
	if (confirm("수정하시겠습니까?") == true) {
		location.href = "commentUpdate.do?idx="+idx+"&bidx="+bidx;
	}
} */
function commentDel(idx, bidx){
	if (confirm("삭제하시겠습니까?") == true) {
		location.href = "commentDel.do?idx="+idx+"&bidx="+bidx;
    }
}
function commentWrite(){
	let text= document.getElementById("text").value;
	let id = document.getElementById("id").value;
	let bidx = document.getElementById("idx").value;
	if (confirm("댓글을 등록하시겠습니까?") == true) {
		location.href="commentWrite.do?bidx="+bidx+"&text="+text+"&id="+id;
    }
}

</script>
</body>
</html>