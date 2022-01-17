<%@page import="mul.camp.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto) request.getSession().getAttribute("login");
%>
<!DOCTYPE html>
<html lang="ko">
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
                        <!-- <li><a href="#">계절별 추이</a></li>
                        <li><a href="#">제철 음식</a></li> -->
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
                <li><a href="board.do">지역별게시판</a>
                     <ul>
                        <li><a href="board.do?spot=chungcheong">충청도</a></li>
                        <li><a href="board.do?spot=gyeongsang">경상도</a></li>
                        <li><a href="board.do?spot=jeolla">전라도</a></li>
                        <li><a href="board.do?spot=jeju">제주도</a></li>
                    </ul>
                </li>    
                 <li><a href="oneOone.do?auth=<%=mem.getAuth()%>&id=<%=mem.getId()%>">1:1문의</a>
                </li> 
				<%if(mem.getAuth() == 1){ %>
	                <li><a href="memberList.do">회원관리</a></li>
				<%}else{ %>                
	                <li><a href="mypage.do?id=<%=mem.getId()%>">MyPage</a></li>
				<%} %>                
                <li><a href="logout.do">Log-out</a></li>
            </ul>
            <!--  <div class="header-search">
            <form class="header-search-bar">
                <input type="serach" class="text">
                <input type="submit" class="submit" value="search">
            </form>
        </div>-->
        </nav>
        <div></div>
        </div>
        <div class="main-word">마! 여 가봤나?!</div>
        <div class="visual">
           <div class="map-responsive">
               <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3313549.811850496!2d125.63025728029189!3d35.80267081192936!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356455ebcb11ba9b%3A0x91249b00ba88db4b!2z64yA7ZWc66-86rWt!5e0!3m2!1sko!2skr!4v1641902423026!5m2!1sko!2skr" width="1100" height="550" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
            
        </div>
    </header>
<jsp:include page="./footer.jsp"></jsp:include>
    </body>
    </html>