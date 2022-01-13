<%@page import="mul.camp.a.dto.BbsParam"%>
<%@page import="mul.camp.a.dto.boardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
   List<boardDto> bbslist=(List<boardDto>)request.getAttribute("bbslist");
   String spot = (String)request.getAttribute("spot");
%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
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
<div align="center" style="margin-top: 130px;">
<h1> 여행지 리뷰 게시판 </h1>

<table border="1" style="width:80%">
   <thead>
      <tr>
      <th>글 번호</th> <th>글 제목</th> <th>작성자</th> <th>날짜</th> <th>조회수</th><th>지역</th>
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
         <%-- <th><fmt:formatDate value="<%=bbs.getRegDate()%>" pattern="yyyy-MM-dd"/></th> --%>
         <th><%=bbs.getCnt()%></th>
         <th><%=bbs.getSpot()%></th>
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
</select>
<input type="text" id="search" value="">
<input type="hidden" id="spot" value="<%=spot%>">
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
   let spot = document.getElementById("spot").value;
   
   location.href = "board.do?choice="+ choice + "&search=" + search + "&spot="+spot;
}
</script>
</body>
</html>





