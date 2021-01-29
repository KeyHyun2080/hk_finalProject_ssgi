<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>내 문의글 상세보기</title>
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

	<div class="container" id="b">
		<div style="text-align:center">
			<h3>상세보기</h3>
		</div>
		<br>
		<br>
		
		<h3>문의하신 내용</h3>
		<hr>
		<div class="form-group">			
			<h5>작성 시간: <fmt:formatDate value="${dto.AS_QNA_DATE}" pattern="yyyy-MM-dd hh:mm"/></h5>
		</div>
		<div class="card ">
			<div class="card-body ">
				<input type="hidden" name="AS_QNA_NUM" class="form-control" value="${dto.AS_QNA_NUM}">
				
				<div class="form-group">
					<h3>제목</h3>
					<label for="AS_QNA_TITLE">${dto.AS_QNA_TITLE}</label>
				</div>
				<hr>
				<div class="form-group">
					<h3>내용</h3>
					<label for="AS_QNA_CONTENT">${dto.AS_QNA_CONTENT}</label>
				</div>
				<br>
				<br>
				<br> 
			</div>
		</div>
		
		<br>
		<c:choose>
			 <c:when test="${dto.AS_QNA_READ ne '답변완료'}">
				<a href="SmyQNAModify?AS_QNA_NUM=${dto.AS_QNA_NUM}" class="btn btn-success ">&nbsp;&nbsp;&nbsp;&nbsp;수정하기&nbsp;&nbsp;&nbsp;&nbsp;</a>
				<a href="SmyPage" class="btn btn-primary ">&nbsp;&nbsp;&nbsp;&nbsp;목록보기&nbsp;&nbsp;&nbsp;&nbsp;</a>
				<a href="SmyQNADelete?AS_QNA_NUM=${dto.AS_QNA_NUM}" class="btn btn-danger ">&nbsp;&nbsp;&nbsp;&nbsp;삭제하기&nbsp;&nbsp;&nbsp;&nbsp;</a>
			</c:when>
		
				
			<c:when test="${dto.AS_QNA_READ eq '답변완료'}">	
		<br>

			
		<h3>답변 내용</h3>
		<div class="card bg-light">
			<div class="card-body ">
				<input type="hidden" name="AS_QNA_NUM" class="form-control" value="${dto.AS_QNA_NUM}">
				<div class="form-group">
					<label for="AS_QNA_TITLE">문의하신 제목:&nbsp;     ${dto.AS_QNA_TITLE}</label>
				</div>
				<hr>
				<div class="form-group">
					<label for="AS_QNA_TITLE">${dto.AS_QNA_ANSWER}</label>
				</div>
				
			
				
				<br>
				<br>
				<br> 
			</div>
		</div>
		
		<br>
		<a href="SmyPage" class="btn btn-primary " style="text-align:right">&nbsp;&nbsp;&nbsp;&nbsp;확인 완료&nbsp;&nbsp;&nbsp;&nbsp;</a>
		<br>
		</c:when>
		</c:choose>
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