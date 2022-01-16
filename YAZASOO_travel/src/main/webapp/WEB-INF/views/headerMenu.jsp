<%@page import="mul.camp.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%
   MemberDto mem = (MemberDto) request.getSession().getAttribute("login");
%>
<h1></h1>
<div class="header-tag">
    <nav>
    <ul>
    	<li><a href="MainPage.do">홈으로</a></li> 
    
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
        <li><a href="mypage.do">MyPage</a></li>
        <li><a href="logout.do">Log-out</a></li>
    </ul>
</nav>
<div></div>
</div>