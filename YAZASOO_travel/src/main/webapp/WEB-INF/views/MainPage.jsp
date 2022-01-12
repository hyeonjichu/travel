<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                        <li><a href="#">계절별 추이</a></li>
                        <li><a href="#">제철 음식</a></li>
                    </ul>
                </li>   
                <li><a href="#">맛집리스트</a>
                    <ul>
                        <li><a href="#">오늘의 트렌드</a></li>
                        <li><a href="#">당일 세일~</a></li>
                        <li><a href="#">상품리스트</a></li>
                    </ul>
                </li>   
                <li><a href="#">랜드마크</a>
                    <ul>
                        <li><a href="#">오늘의 집</a></li>
                        <li><a href="#">꼭 가봐야 할 곳</a></li>
                        <li><a href="#">야경 10선</a></li>
                    </ul>
                </li>    
                <li><a href="board.do">지역별게시판</a>
                     <ul>
                        <li><a href="#">방명록</a></li>
                        <li><a href="#">자료실</a></li>
                        <li><a href="#">분실물센터</a></li>
                    </ul>
                </li>    
                <li><a href="#">MyPage</a></li>
                <!-- <li><a href="Join.html">Sing up</a></li> -->
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
        <div class="main-word">마! 여 가봤나?!</div>
        <div class="visual">
           <div class="map-responsive">
               <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3313549.811850496!2d125.63025728029189!3d35.80267081192936!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356455ebcb11ba9b%3A0x91249b00ba88db4b!2z64yA7ZWc66-86rWt!5e0!3m2!1sko!2skr!4v1641902423026!5m2!1sko!2skr" width="1100" height="550" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
            
        </div>

        
       <!--  <div class="menu">
            <ul>
                <li><a href="https://weather.naver.com/">날씨</a></li>
                <li><a href="#">맛집리스트</a></li>
                <li><a href="#">랜드마크</a></li>
                <li><a href="#">지역별 게시판</a></li>
                <li><a href="#">나의 정보</a></li>
            </ul>
        </div>  -->
    </header>
        <footer>
            <ul>
                <li><span>개인정보처리방침</span> &nbsp;|&nbsp; YAZASOO 회원약관 &nbsp;| &nbsp;이메일무단수집거부&nbsp;&nbsp;오시는길 &nbsp;|&nbsp;부산광역시 금정구</li><br>
                <li>주소 : 부산광역시 금정구 OOO OOO &nbsp;|&nbsp;대표 OOO</li>
                <li>1:1문의&nbsp;|&nbsp;OOO OOO OOO</li>
                <li>이용해 주셔서 감사합니다</li>
            </ul>
        </footer>
    </body>
    </html>