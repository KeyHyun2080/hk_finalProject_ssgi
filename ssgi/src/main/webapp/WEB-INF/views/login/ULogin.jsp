<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>로그인</title>

<style>

#b  {
	padding-right: 400px;
	padding-left: 400px;
	margin-right: auto;
	margin-left: auto;
} 

#a {
	padding-right: 120px;
	padding-left: 120px;
	margin-right: auto;
	margin-left: auto;
} 

</style>
</head>

<header>
	<br>
	<div id="a" class="container" >
		<nav class="navbar navbar-expand-md navbar-light">
		
			<!-- 로고 이미지 -->
			<a href="main"><img id="sizzang"src="images/천년가게.png"></a>
			<!-- 로고 이미지 -->
			
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse  justify-content-end"
				id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto text-right">
					
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 회원가입 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="UAddjoin" style="text-align:right">일반 회원가입 </a> 
							<a class="dropdown-item" href="SAddjoin" style="text-align:right">사업자 회원가입</a>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	
	<hr>
	
</header>




<body>

			<br>
			<br>
			
			
			<a href="#"><img id="로고" src="images/천년가게.png" class="mx-auto d-block"></a>
           <br>
            <div id="b" class="container">
            	 <div style="text-align:center"> 

					<br/>
					<h3>로그인</h3>
					<div id="div1"></div>
             	 </div>
             	 <br>
                <form role="form" action="login" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"><br/>
                    <div class="form-group">
                        <label for="USER_ID">아이디</label>
                        <input type="text" class="form-control" id="user_id" placeholder="아이디(이메일)를 입력해주세요" name="user_id">
                    </div>
                    <div class="form-group">
                        <label for="USER_PW">비밀번호</label>
                        <input type="password" class="form-control" id="user_pw" placeholder="비밀번호를 입력해주세요" name="user_pw">
                    </div>


					<a href="UAddjoin">가입처리</a>
					<a href="#">아이디/비밀번호 찾기</a>
					<br/>

                    <div class="form-group text-center">
                        <button type="submit"  class="btn btn-primary btn-block">
                         		  로그인<i class="fa fa-check spaceLeft"></i>
                        </button>
                        
                        <!-- 카카오로그인 버튼 바꿔야됨 -->
                        
                       
                          
                        <!-- 카카오로그인 버튼 바꿔야됨 -->
      				</div>
                </form>
                
                   <a href="kakaologin1" class="btn btn-warning btn-block" >카카오계정으로 로그인</a>
            </div>
            <br>
	<br>
	<br>
	<br>
	<br>

	<br>
	<br>

			<br>
			<br>
			<br>
			<br>
			<br>
	<br> 
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
<!-- 하단-------------------------------------------------------------------------------------------------------------------- -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<a href="map">사업장 위치</a>
	</div>
	
	
	
<!-- 하단 끝------------------------------------------------------------------------------------------------------------------- -->



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	<c:choose>
		
		<c:when test="${not empty error }">  //model의 msg값이 null이 아님 (로그아웃)
			alert("로그인 실패.")	;
		</c:when>
		
	</c:choose>
});
	
</script>

</body>
</html>