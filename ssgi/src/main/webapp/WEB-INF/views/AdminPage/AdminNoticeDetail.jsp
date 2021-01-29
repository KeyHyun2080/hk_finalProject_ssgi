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
<title>관리자 공지사항 상세보기</title>
<style>
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

</style>
</head>
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
					
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 회원가입 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="UAddjoin" style="text-align:right">일반 회원가입 </a> 
							<a class="dropdown-item" href="SAddjoin" style="text-align:right">사업자 회원가입</a>
						</div>
					</li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 로그인 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="ULogin" style="text-align:right">일반 로그인 </a> 
							<a class="dropdown-item" href="SLogin" style="text-align:right">사업자 로그인</a>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="myPage">마이페이지</a></li>
				</ul>
			</div>
		</nav>
	</div>
	
	<hr>
	
</header>

<!-- 상단고정 바 끝  -->

<body>

	<div class="container " id="b">
		<div style="text-align:center"><h3>공지사항</h3></div>
		<br>
		<br>
		
		<div class="card">
			<div class="card-body ">
				<input type="hidden" name="NOTICE_NUM" class="form-control" value="${dto.NOTICE_NUM}">
				
				<div class="form-group">
					<label for="AS_QNA_TITLE">작성자:&nbsp;     ${dto.NOTICE_NAME}</label>
				</div>
				<hr>
				<div class="form-group">
					<label for="AS_QNA_TITLE">제목:&nbsp;     ${dto.NOTICE_TITLE}</label>
				</div>
				<hr>
				<div class="form-group">
					<label for="AS_QNA_TITLE">내용: ${dto.NOTICE_CONTENT }</label>
				</div>
				
			
				
				<br>
				<br>
				<br> 
			</div>
		</div>
		<br>
		<a href="AdminMyPage" class="btn btn-success " style="text-align:right">&nbsp;&nbsp;&nbsp;&nbsp;확인완료&nbsp;&nbsp;&nbsp;&nbsp;</a>
		<a href="NoticeModify?NOTICE_NUM=${dto.NOTICE_NUM }" class="btn btn-warning " style="text-align:right">&nbsp;&nbsp;&nbsp;&nbsp;수정하기&nbsp;&nbsp;&nbsp;&nbsp;</a>
		<br>
		<br>
				
	</div>




<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>



<!-- 하단-------------------------------------------------------------------------------------------------------------------- -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<a href="map">사업장 위치</a>
	</div>
	
	
	
<!-- 하단 끝------------------------------------------------------------------------------------------------------------------- -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>