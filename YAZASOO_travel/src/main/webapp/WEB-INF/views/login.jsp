<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
	<html lang="ko">
		<head>
		  <meta charset="UTF-8">
		  <meta http-equiv="X-UA-Compatible" content="IE=edge">
		  <meta name="viewport" content="width=device-width, initial-scale=1.0">
		  <link rel="stylesheet" type="text/css" href="css/login.css" />
		  <script type="text/javascript" src="js/def.js"></script>
		  <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
		  
		  <link href="css/bootstrap.min.css" rel="stylesheet">
    
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
	   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> 
	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	   
	   <link rel="shortcut icon" type="image/x-icon" href="image/YAZASOO.png">
		  <title>login</title>
		</head>
		
			<body>
			  <section class="login-form">
			  <h1>YAZASOO</h1>
			  <form id="frm" class="form" action="loginAf.do" method="post">
			    <div class="int-area">
			        <input type="text" name="id" id="id" autocomplete="off" required>
			        <label for="id">USER NAME</label>
			    </div>
			    <div class="int-area">
			        <input type="password" name="pw" id="pw" autocomplete="off" required>
			        <label for="pw">PASSWORD</label>
			    </div>
			    <div class="btn-area">
			        <button id="btn" type="button" onclick="login()">LOGIN</button>
			    </div>		
			  </form>
			      <div class="caption">
			          <a href="regi.do">register here</a>
			      </div>
			  </section>
			  
			 
			  </body>
  </html>
  















