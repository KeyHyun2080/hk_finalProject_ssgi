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
<title>문의글 작성</title>
</head>
<style>
textarea {
	textarea: none;

}


</style>
<body>

	<div style="text-align: center">
		<a href="#"><img id="로고" src="images/천년가게.png" class="mx-auto d-block"></a> <br>
		<h3>문의 글 작성</h3>
		<hr>
	</div>
	<h3 align="center">글작성</h3>

	<div class="container">
		
		<form action="SmyQNAWriteYes" method="post" class="needs-validation" novalidate>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="USER_ID"  class="form-control"  value="${user_id }">
			<div class="form-group">
				<label >제목 입력</label> 
				<input type="text" name="AS_QNA_TITLE" placeholder="제목입력" onkeyup="chkword(this,40)" class="form-control" required>
				<div class="invalid-feedback">제목을 입력해주세요!</div>
			</div>
			<div class="form-group">
				<label >내용 입력</label>
				<textarea  cols="300" rows="25" class="form-control" name="AS_QNA_CONTENT" onkeyup="chkword(this,500)" placeholder="내용입력" required></textarea>
				<div class="invalid-feedback">내용을 입력해주세요!</div>
			</div>
			<button type="submit" class="btn btn-success ">전송</button>	
			<a href="SmyPage" class="btn btn-primary " >목록보기</a>
			
			
			
			
		</form>
			
			
	</div>
	
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