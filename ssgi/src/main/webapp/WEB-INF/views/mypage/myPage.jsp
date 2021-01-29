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
			<li class="nav-item"><a class="nav-link active"  href="authmanage" id="authmanage" >계정관리</a></li>
			<li class="nav-item"><a class="nav-link "  data-toggle="tab" id="myPay" href="#">구매내역</a></li>
			<li class="nav-item"><a class="nav-link " data-toggle="tab"  id="myRv" href="#">내 글 보기</a></li>
			<li class="nav-item"><a class="nav-link "  data-toggle="tab" id="myPageQNA" href="#" >문의내역</a></li>
		</ul>
	</div>

<!-- 메뉴 바 끝 ---------------------------------------------------------------------------------------------------------------------------------- -->
<div  class="fadeIn animated">
<section id="myPage">

	<div class="container" id="b">
	
		<br>
		<div style="text-align: center">
			<a href="#"><img id="로고" src="images/천년가게.png" class="mx-auto d-block"></a> <br>
			<h3>계정관리</h3>
			<hr>
			<div class="container" id="b"></div>

		</div>
		
		
		<br> <a>아이디 : ${dto.user_id }</a><br>
		<br> <a>이름: ${dto.user_name }</a><br>
		<br> <a>비밀번호:</a><br>
		<br> <a>비밀번호 확인: </a><br>
		<br> <a>연락처: ${dto.user_ph } </a><br>
		<br> <a>집주소: ${dto.user_addr } ${dto.user_addr2 } </a><br>
		<br> <a>이메일: ${dto.user_email }</a><br>
		
		<hr>
		<br>
		<br>
		<div style="text-align: right">
		
		<a class="btn btn-primary" href="myPageModifyView?user_id=${dto.user_id }">개인정보 수정</a>
		</div>
		
		




	

	<br><br>
<br><br>
<br><br>
<form action="userDelete" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
		<div style="text-align: right">
			<button type="submit" class="btn btn-warning" >회원탈퇴</button>
		</div>
</form>			
	</div>


	
	
	</section>
	</div>
	
	
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>

<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
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

<script>
$(document).ready(function(){
	$("#myRv").click(function(e){
		e.preventDefault();
		$.ajax({
			url : "myRv", 	//요청경로 데이타 스프링 mvc에서는 localhost:8080/ajax_ex02/data
			cache : false,	//브라우저의 캐시여부 디폴트는 true
 			data : "", 		//서버로 보내는 데이터
			dataType : "html",	//서버에서 반환되는 데이터
			success : function(data){	//data 파라메터는 서버에서 성공시에 받는 데이터.
				$("#myPage").html(data);//jquery 의 html(html문서)는 선택된 엘리먼트에 로딩. 글자일땐 text
				
			},
			error : function(){
				console.log(" fail : ");
			},
			complete : function(){
				console.log(" always : ");
			} 
			
		});
	}).stop();
});



$(document).ready(function(){
	$("#myPay").click(function(e){
		e.preventDefault();
		$.ajax({
			url : "myPay", 	//요청경로 데이타 스프링 mvc에서는 localhost:8080/ajax_ex02/data
			cache : false,	//브라우저의 캐시여부 디폴트는 true
 			data : "", 		//서버로 보내는 데이터
			dataType : "html",	//서버에서 반환되는 데이터
			success : function(data){	//data 파라메터는 서버에서 성공시에 받는 데이터.
				$("#myPage").html(data);	//jquery 의 html(html문서)는 선택된 엘리먼트에 로딩. 글자일땐 text
				
			},
			error : function(){
				console.log(" fail : ");
			},
			complete : function(){
				console.log(" always : ");
			} 
			
		});
	}).stop();
});

 $(document).ready(function(){
	$("#myPageQNA").click(function(e){
		e.preventDefault();
		$.ajax({
			url : "myPageQNA", 	//요청경로 데이타 스프링 mvc에서는 localhost:8080/ajax_ex02/data
			cache : false,	//브라우저의 캐시여부 디폴트는 true
 			data : "", 		//서버로 보내는 데이터
			dataType : "html",	//서버에서 반환되는 데이터
			success : function(data){	//data 파라메터는 서버에서 성공시에 받는 데이터.
				$("#myPage").html(data);	//jquery 의 html(html문서)는 선택된 엘리먼트에 로딩. 글자일땐 text
			},
			error : function(){
				console.log(" fail : ");
			},
			complete : function(){
				console.log(" always : ");
			} 
			
			
		});
		
	
	}).stop();
}); 


</script>
<c:if test="${sessionScope.val eq 'qna'}">
	<script type="text/javascript">
		$(function(){
			$("#myPageQNA").trigger("click");
			
		});
	</script>
</c:if>

<c:if test="${sessionScope.val eq 'manage'}">
	<script type="text/javascript">
		$(function(){
			
			$("#authmanage").trigger("click");
			
		});
	</script>
</c:if>
<c:if test="${sessionScope.val eq 'myRv1'}">
	<script type="text/javascript">
		$(function(){
			
			$("#myRv").trigger("click");
			
		});
	</script>
</c:if>
<c:if test="${sessionScope.val eq 'myPay1'}">
	<script type="text/javascript">
		$(function(){
			
			$("#myPay").trigger("click");
			
		});
	</script>
</c:if>



</body>

</html>