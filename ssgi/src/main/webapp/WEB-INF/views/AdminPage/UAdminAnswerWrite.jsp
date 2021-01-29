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


textarea {
	textarea: none;

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
		<h3>상세보기</h3>
		<br>
		<br>
		
		<h3>문의하신 내용</h3>
		<div class="card bg-light">
			<div class="card-body ">
				<input type="hidden" name="AU_QNA_NUM" class="form-control" value="${dto.AU_QNA_NUM}">
				<div class="form-group">
					<h5>제목</h5>
					<label for="AU_QNA_TITLE">${dto.AU_QNA_TITLE}</label>
				</div>
				<hr>
				<div class="form-group">
					<h5>내용</h5>
					<label for="AU_QNA_CONTENT">${dto.AU_QNA_CONTENT}</label>
				</div>
				<br>
				<br>
				<br> 
			</div>
		</div>
		
		<br>
	
		<br>
		<br>
		
		<h3>답변 내용</h3>
		<%-- <div class="card ">
			<div class="card-body ">
				<form action="UAdminAnswerWriteOK" method="post"
					class="needs-validation" novalidate>
					<input type="hidden" name="AU_QNA_NUM" class="form-control" value="${dto.AU_QNA_NUM}">
					<div class="form-group">
						<label for="AU_QNA_TITLE">문의하신
							제목:&nbsp;${dto.AU_QNA_TITLE}</label>
					</div>
					<hr>
					<div class="form-group">
						<!-- <label for="AS_QNA_TITLE"><input type="text" name="AU_QNA_ANSWER">여기에 답변한거 쓸거임</label> -->
						<textarea cols="300" rows="20" class="form-control" name="AU_QNA_ANSWER" placeholder="내용입력"  onkeyup="chkword(this,500)" required></textarea>
					</div>
					<div class="form-group">
						<label>답변완료라고 입력해주세요</label> <input id="OKCeck" type="text" name="AU_QNA_READ" placeholder="'답변완료'라고 입력해주세요" class="form-control"  onkeyup="chkword(this,4)" required>
						<div class="invalid-feedback">'답변완료'라고 입력해주세요</div>
					</div>
					<br> 
					<br> 
					<br>
					<button type="submit" class="btn btn-primary "
						style="text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;답변
						완료&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</form>
				<br>
				
				<a href="SAnswer" class="btn btn-warning " style="text-align:right">&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;</a>
				
				
			</div>
		</div> --%>


		<div class="card ">
			<div class="card-body ">
				<form action="UAdminAnswerWriteOK" method="post" class="needs-validation" novalidate>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" name="AU_QNA_NUM" class="form-control" value="${dto.AU_QNA_NUM}">
					<div class="form-group">
						<label for="AU_QNA_TITLE">문의하신
							제목:&nbsp;${dto.AU_QNA_TITLE}</label>
					</div>
					<hr>
					<div class="form-group">
						<!-- <label for="AS_QNA_TITLE"><input type="text" name="AU_QNA_ANSWER">여기에 답변한거 쓸거임</label> -->
						<textarea cols="300" rows="20" class="form-control" name="AU_QNA_ANSWER" placeholder="내용입력"  onkeyup="chkword(this,500)" required></textarea>
						<!-- <div class="check_font" id="titleOKCheck"></div> -->
					</div>
					<div class="form-group">
						<label>답변완료라고 입력해주세요</label>
					    <input  type="text" id="AU_QNA_READ" placeholder="'답변완료'라고 입력해주세요"  name="AU_QNA_READ"  class="form-control"  onkeyup="chkword(this,4)" required>
						<div class="check_font" id="check_OKCKeck"></div>
					</div> 
					<br> 
					<br> 
					<br>
					<button type="submit" id="submit" class="btn btn-primary " style="text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;답변완료&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</form>
				<br>
				
				<a href="SAnswer" class="btn btn-warning " style="text-align:right">&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;</a>
				
				
			</div>
		</div>
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



<script>

(function() {
  'use strict';
  window.addEventListener('load', function() {
    var forms = document.getElementsByClassName('needs-validation');
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        
        form.classList.add('was-validated');
      }, false);
    });
  }, false);

  
})();
</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
$(document).ready(function(){

// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#AU_QNA_READ").blur(function() {
		// id = "id_reg" / name = "userId"
		var AU_QNA_READ = $('#AU_QNA_READ').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/UAdminQNA/OKCheck?AU_QNA_READ='+ AU_QNA_READ,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 0) {
						// '답변완료'불일치
						$("#check_OKCKeck").text("'답변완료'가 일치하지 않습니다.");
						$("#check_OKCKeck").css("color", "red");
						$("#submit").attr("disabled", true);
		
		
				} else if (data == data) {
					// '답변완료'일치
					$("#check_OKCKeck").text("정확합니다");
					$("#check_OKCKeck").css("color", "green");
					$("#submit").attr("disabled", false);
	
	
				}return AU_QNA_READ;
					
						
					
				
				}, error : function() {
						console.log("실패");
				}
			});
		});
		
})		
</script>

<script>
//글자수 제한 스크립트
function chkword(obj, maxlength) {
    var str = obj.value; // 이벤트가 일어난 컨트롤의 value 값
    var str_length = str.length; // 전체길이
 
    // 변수초기화
    var max_length = maxlength; // 제한할 글자수 크기
    var i = 0; // for문에 사용
    var ko_byte = 0; // 한글일경우는 2 그밗에는 1을 더함
    var li_len = 0; // substring하기 위해서 사용
    var one_char = ""; // 한글자씩 검사한다
    var str2 = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
 
    for (i = 0; i < str_length; i++) {
        // 한글자추출
        one_char = str.charAt(i);
            ko_byte++;
        }
 
        // 전체 크기가 max_length를 넘지않으면
        if (ko_byte <= max_length) {
            li_len = i + 1;
        }
    
 
    // 전체길이를 초과하면
    if (ko_byte > max_length) {
        alert(max_length + " 글자 이상 입력할 수 없습니다. \n 초과된 내용은 자동으로 삭제 됩니다. ");
        str2 = str.substr(0, max_length);
        obj.value = str2;
    }
    obj.focus();
 
	}


</script>

</body>
</html>