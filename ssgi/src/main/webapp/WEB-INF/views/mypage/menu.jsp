 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>마이페이지</title>
</head>
<style>



.animated {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}


/*the animation definition*/
@-webkit-keyframes fadeIn {
  0% {
    opacity: 0
  }
  100% {
    opacity: 1
  }
}
@keyframes fadeIn {
  0% {
    opacity: 0
  }
  100% {
    opacity: 1
  }
}
.fadeIn {
  -webkit-animation-name: fadeIn;
  animation-name: fadeIn
}



#a {
	padding-right: 120px;
	padding-left: 120px;
	margin-right: auto;
	margin-left: auto;
} 

 #b {
	padding-right: 120px;
	padding-left: 120px;
	margin-right: auto;
	margin-left: auto;
	
} 

.carousel-inner img {
	width: 100%;
	height: 100%;
}

ul#menu > li > a {
	font-size : 25 px;
}

</style>



<!-- 상단고정 바 ---------------------------------------------------------------------------------------------------------------------------------- -->

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
				
				
				
				
					<!-- 로그인시 보여줄 로그아웃 태그 시작-->
					
				
					<sec:authorize access="hasRole('ROLE_USER')">
					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<li class="nav-item"><a class="nav-link text-primary">안녕하세요 회원님</a></li>	
					<li class="nav-item"><a class="nav-link"  href="myPage">U마이페이지</a></li>				
					
					<form action="logout" method="post" onclick="return logout()">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input class="nav-link bg-white border-0  text-danger" type="submit"  value="로그아웃"/>
					</form>
				
							
					
					
					</sec:authorize>
					
					
					<sec:authorize access="hasRole('ROLE_SELLER')">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<li class="nav-item"><a class="nav-link text-primary">안녕하세요 사업자님</a></li>	
					<li class="nav-item"><a class="nav-link"  href="SmyPage">S마이페이지</a></li>
					
						
					<a class="nav-link" href="addStore" style="text-align:right">상점 등록 </a>
					
					<form action="logout" method="post" onclick="return logout()">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input class="nav-link bg-white border-0  text-danger" type="submit"  value="로그아웃"/>
					</form>
				
								
				
					</sec:authorize>
					<!-- 로그인시 보여줄 로그아웃 태그 끝-->
					
					
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					
					<li class="nav-item"><a class="nav-link text-primary" >관리자페이지입니다.</a></li>
						<li class="nav-item"><a class="nav-link"  href="AdminMyPage">관리자 마이페이지</a></li>
						<form action="logout" method="post" onclick="return logout()">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input class="nav-link bg-white border-0  text-danger" type="submit"  value="로그아웃"/>
					</form>	
					</sec:authorize>
					<!-- 로그인시 보여줄 로그아웃 태그 끝-->
					
					
					
					
					
					
					<!-- 비 로그인시 보여줄 상단 시작 -->
					<sec:authorize access="isAnonymous()">
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 회원가입 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="UAddjoin" style="text-align:right">일반 회원가입 </a> 
							<a class="dropdown-item" href="SAddjoin" style="text-align:right">사업자 회원가입</a>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="ULogin?log=start" style="text-align:right"> 로그인 </a>
					</li>
					
					
					</sec:authorize>
					<!-- 비 로그인시 보여줄 상단 끝 -->
				</ul>
			</div>
		</nav>
	</div>
	
	<hr>
	
</header>

<!-- 상단고정 바 끝  ---------------------------------------------------------------------------------------------------------------------------------- -->



<body>
<!-- 메뉴 바 ---------------------------------------------------------------------------------------------------------------------------------- -->

	<div class="container" id="b">
		<ul id="menu" class="nav nav-pills bg-light nav-justified" >
			<li class="nav-item"><a class="nav-link "  href="authmanage" id="authmanage" >계정관리</a></li>
			<li class="nav-item"><a class="nav-link "  data-toggle="tab" id="myPay" href="#">구매내역</a></li>
			<li class="nav-item"><a class="nav-link " data-toggle="tab"  id="myRv" href="#">내 글 보기</a></li>
			<li class="nav-item"><a class="nav-link active "  data-toggle="tab" id="myPageQNA" href="#" >문의내역</a></li>
		</ul>
	</div>

<!-- 메뉴 바 끝 ---------------------------------------------------------------------------------------------------------------------------------- -->




</body>
</html>