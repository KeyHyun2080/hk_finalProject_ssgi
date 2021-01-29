<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- <base href="https://www.w3schools.com/bootstrap4/"> -->
<title>메인페이지</title>
</head>
<!-- 스타일 태그영역-------------------------------------------------------------------------------------------------------------------------------- -->
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

<!-- 스타일 태그영역-------------------------------------------------------------------------------------------------------------------------------- -->



<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

Kakao.init("f1b3c0ead44b1b923a2b686974680661");

Kakao.Auth.login({
	
	success: function(authObj) {
		Kakao.API.request({
			url:'/v2/user/me',
			success: function(res){
				console.log(res);
				
				
				var name = res.properties['nickname']
				var html = name + ' 님 반갑습니다.' + '&nbsp;&nbsp;&nbsp;&nbsp;';
				
				$('#kakao').append(html);
			}
		})
		console.log(authObj);
		var token = authObj.access_token;
		
	},
	fail: function(err) {
		alert(JSON.stringify(err));
	}
});




		
	
		
  
   



</script>




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
				
									
				
				<li>
					<a  id="kakao"> </a>
					
				</li>
				<li>
					<a href="main">카카오 로그아웃</a>
				</li>	
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
		<ul id="menu" class="nav nav-tabs bg-light nav-justified" >
			<li class="nav-item"><a class="nav-link active" href="main" >Home</a></li>
			<li class="nav-item"><a class="nav-link " data-toggle="tab"  id="shop" href="#">Shop</a></li>
			<li class="nav-item"><a class="nav-link "  data-toggle="tab" id="About" href="#">About</a></li>
			<li class="nav-item"><a class="nav-link "  data-toggle="tab" id="Notice" href="#" >Notice</a></li>
		</ul>
	</div>

<!-- 메뉴 바 끝 ---------------------------------------------------------------------------------------------------------------------------------- -->

<div  class="fadeIn animated">
	<section id="main">
	
	<div class="container" id="b">
		

			<!-- 사진 슬라이드 ---------------------------------------------------------------------------------------------------------------------------------- -->

			<div id="demo" class="carousel slide" data-ride="carousel">

				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>

				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="https://res.cloudinary.com/frientrip/image/upload/ar_5:2,c_fill,dpr_2,f_auto,w_930/%EC%9B%B9_%EB%A9%94%EC%9D%B8%EB%B0%B0%EB%84%88_1860x744_1595486945237"
							width="1100" height="500">
					</div>
					<div class="carousel-item">
						<img
							src="https://res.cloudinary.com/frientrip/image/upload/ar_5:2,c_fill,dpr_2,f_auto,w_930/%EC%9B%B9_%EB%A9%94%EC%9D%B8%EB%B0%B0%EB%84%88_1860x744_01%20copy_1595987388631"
							width="1100" height="500">
					</div>
					<div class="carousel-item">
						<img
							src="https://res.cloudinary.com/frientrip/image/upload/ar_5:2,c_fill,dpr_2,f_auto,w_930/%EC%9B%B9_%EB%A9%94%EC%9D%B8%EB%B0%B0%EB%84%88_1860x744_01_1595559952810"
							width="1100" height="500">
					</div>
				</div>

				<!-- 슬라이드 사진 컨트롤 -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev"><span
					class="carousel-control-prev-icon"></span></a> <a
					class="carousel-control-next" href="#demo" data-slide="next"><span
					class="carousel-control-next-icon"></span></a>
			</div>

			<!-- 사진 슬라이드 끝 ---------------------------------------------------------------------------------------------------------------------------------- -->



			<br> <br> <br> 



			<!-- 점포 카드 ---------------------------------------------------------------------------------------------------------------------------------- -->

			<div class="card-deck">
				<div class="card bg-light">
					<div class="card-body text-center">
						<div class="card-body">
							<img  src="images/천년가게.png">
							<a href="#" class="btn btn-primary">See Profile</a>
						</div>
					</div>
				</div>
				<div class="card bg-light">
					<div class="card-body text-center">
						<div class="card-body">
							<img  src="images/천년가게.png">
							<a href="#" class="btn btn-primary">See Profile</a>
						</div>
					</div>
				</div>
				<div class="card bg-light">
					<div class="card-body text-center">
						<div class="card-body">
							<img  src="images/천년가게.png">
							<a href="#" class="btn btn-primary">See Profile</a>
						</div>
					</div>
				</div>
			</div>


			<br> <br>


			<div class="card-deck">
				<div class="card bg-light">
					<div class="card-body text-center">
						<div class="card-body">
							<img  src="images/천년가게.png">
							<a href="#" class="btn btn-primary">See Profile</a>
						</div>
					</div>
				</div>
				<div class="card bg-light">
					<div class="card-body text-center">
						<div class="card-body">
							<img  src="images/천년가게.png">
							<a href="#" class="btn btn-primary">See Profile</a>
						</div>
					</div>
				</div>
				<div class="card bg-light">
					<div class="card-body text-center">
						<div class="card-body">
							<img  src="images/천년가게.png">
							<a href="#" class="btn btn-primary">See Profile</a>
						</div>
					</div>
				</div>
			</div>



			<br> <br>


			<div class="card-deck">
				<div class="card bg-light">
					<div class="card-body text-center">
						<div class="card-body">
							<img  src="images/천년가게.png">
							<a href="#" class="btn btn-primary">See Profile</a>
						</div>
					</div>
				</div>
				<div class="card bg-light">
					<div class="card-body text-center">
						<div class="card-body">
							<img  src="images/천년가게.png">
							<a href="#" class="btn btn-primary">See Profile</a>
						</div>
					</div>
				</div>
				<div class="card bg-light">
					<div class="card-body text-center">
						<div class="card-body">
							<img  src="images/천년가게.png">
							<a href="#" class="btn btn-primary">See Profile</a>
						</div>
					</div>
				</div>
			</div>

			<!-- 점포 카드 끝 ---------------------------------------------------------------------------------------------------------------------------------- -->

			<br> <br>

			</div>
	</section>
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
	
<!-- 하단-------------------------------------------------------------------------------------------------------------------- -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<a href="map">사업장 위치</a>
	</div>
	
	
	
<!-- 하단 끝------------------------------------------------------------------------------------------------------------------- -->








<script>



$(document).ready(function(){
	$("#shop").click(function(e){
		e.preventDefault();
		$.ajax({
			url : "shop", 	//요청경로 데이타 스프링 mvc에서는 localhost:8080/ajax_ex02/data
			cache : false,	//브라우저의 캐시여부 디폴트는 true
 			data : "", 		//서버로 보내는 데이터
			dataType : "html",	//서버에서 반환되는 데이터
			success : function(data){	//data 파라메터는 서버에서 성공시에 받는 데이터.
				$("#main").html(data);	//jquery 의 html(html문서)는 선택된 엘리먼트에 로딩. 글자일땐 text
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
	$("#About").click(function(e){
		e.preventDefault();
		$.ajax({
			url : "about", 	//요청경로 데이타 스프링 mvc에서는 localhost:8080/ajax_ex02/data
			cache : false,	//브라우저의 캐시여부 디폴트는 true
 			data : "", 		//서버로 보내는 데이터
			dataType : "html",	//서버에서 반환되는 데이터
			success : function(data){	//data 파라메터는 서버에서 성공시에 받는 데이터.
				$("#main").html(data);	//jquery 의 html(html문서)는 선택된 엘리먼트에 로딩. 글자일땐 text
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
	$("#Notice").click(function(e){
		e.preventDefault();
		$.ajax({
			url : "Notice", 	//요청경로 데이타 스프링 mvc에서는 localhost:8080/ajax_ex02/data
			cache : false,	//브라우저의 캐시여부 디폴트는 true
 			data : "", 		//서버로 보내는 데이터
			dataType : "html",	//서버에서 반환되는 데이터
			success : function(data){	//data 파라메터는 서버에서 성공시에 받는 데이터.
				$("#main").html(data);	//jquery 의 html(html문서)는 선택된 엘리먼트에 로딩. 글자일땐 text
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

<script>
function logout(){
	if(confirm("로그아웃 하시겠습니까?")) {
		alert("로그아웃 하였습니다.");
		return true;
	}else {
		alert("로그아웃 취소 되었습니다.");
		return false;
	}
}

</script>











</body>

</html>