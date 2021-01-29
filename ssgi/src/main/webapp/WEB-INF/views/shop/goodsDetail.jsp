<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x"	uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql"	uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" >
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 
<script type="text/javascript" src="../js.jquery.form.js"></script>
<script type="text/javascript">
	$(function() {
		$("#wishBtn").click(function() {
			//location.href="goodsWishAdd.gd?num=${goods.goodsNum}";
			$.ajax({
				type: "post",
				url: "goodsLike",
				data: "goods_num=${gd.goodsDto.goods_num }",
				dataType: "html",
				success: wish_ok, // ajax는 호출 시 괄호 쓰면 에러가 생긴다.
				error: function(){
					alert('서버오류 입니다. 잠시 후 다시 해주세요.');
					return;
				}
			});
		});
	});
	function wish_ok(responseText, statusText, xhr, $form) {
		var i = responseText.trim();
		if(statusText == "success"){
			if( i == 1){
				alert("관심상품에 등록되었습니다.")
			}else{
				alert("관심상품에서 삭제되었습니다.")
			} 
		}
	}
</script>
 -->
<title>Insert title here</title>
<style>
img#1{
	width:580px;
	height:400px;
}

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
.store_ul li {
	list-style: none;
	padding-left: 70px;
	/* float: left; */
	display: inline-block;
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

<body>

					<!-- 로그인시 보여줄 로그아웃 태그 시작-->
					
				

					
<div class="container" style="margin-top:30px">

<c:forEach items="${goodsDetail }" var="gd">

<sec:authorize access="hasRole('ROLE_USER')">
<form action="kakaopay?${_csrf.parameterName}=${_csrf.token}&&${gd.goodsDto.goods_num }" method="post">
	<!-- 이미지 및 이름, 가격 -->
	<div class="row">
		<div class="col-md-7" id="1" style="width:600px; height:400px;">
			<img  style="width:600px; height:400px;" src="upload/${gd.goodsImageDto.goods_image }">
		</div>
		<div class="col-md-5" id="2">
			상품명 <br/><br/><div class="goodsData"><h3><strong>${gd.goodsDto.goods_name }</strong></h3></div><hr/><br />
			상품 가격<br/><br/><div class="goodsData"><h3><strong><fmt:formatNumber value="${gd.goodsDto.goods_price}" pattern="###,###,###원"/></strong></h3></div><hr /><br />
			
			
			<a href="goodsCartAdd?goods_num=${gd.goodsDto.goods_num }" class="btn btn-info" id="addCart" role="button">장바구니 담기</a>
			<button class="btn btn-primary" type="submit" >구매</button>
			
		</div>
	</div>
	<br /><hr /><br />
	<!-- 상품설명 -->
	<div>상품 설명</div>
	<div class="container p-3 my-3 border">
		<p class="goodsData">${gd.goodsDto.goods_content }</p>
	</div>

</form>


</sec:authorize>

<sec:authorize access="isAnonymous()">
<form action="kakaopay?${_csrf.parameterName}=${_csrf.token}&&${gd.goodsDto.goods_num }" method="post">
	<!-- 이미지 및 이름, 가격 -->
	<div class="row">
		<div class="col-md-7" id="1" style="width:600px; height:400px;">
			<img style="width:600px; height:400px;" src="upload/${gd.goodsImageDto.goods_image }">
		</div>
		<div class="col-md-5" id="2">
			상품명 <br/><br/><div class="goodsData"><h3><strong>${gd.goodsDto.goods_name }</strong></h3></div><hr/><br />
			상품 가격<br/><br/><div class="goodsData"><h3><strong><fmt:formatNumber value="${gd.goodsDto.goods_price}" pattern="###,###,###원"/></strong></h3></div><hr /><br />
			
			
		<h4>로그인 구매 사용가능합니다.</h4>
			
		</div>
	</div>
	<br /><hr /><br />
	<!-- 상품설명 -->
	<div>상품 설명</div>
	<div class="container p-3 my-3 border">
		<p class="goodsData">${gd.goodsDto.goods_content }</p>
	</div>

</form>


</sec:authorize>

</c:forEach>

</div>



				
					<!-- 로그인시 보여줄 로그아웃 태그 시작-->
					
				




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</body>
</html>