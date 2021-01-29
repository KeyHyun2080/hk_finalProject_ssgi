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
<title>문의 글 수정</title>
</head>
<style>

textarea {
	resize: none;

}
</style>
<body>


<div style="text-align: center">
			<a href="#"><img id="로고" src="images/천년가게.png" class="mx-auto d-block"></a> <br>
			<hr>
		</div>
<h3 align="center">글 수정</h3>

	<div class="container">

		<form action="SmyQNAModifyOK?" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="form-group">
			<input type="hidden" name="AS_QNA_NUM"  class="form-control"  value="${dto.AS_QNA_NUM}" >
				<label>제목</label> 
				<input type="text" name="AS_QNA_TITLE" class="form-control" value="${dto.AS_QNA_TITLE}" onkeyup="chkword(this,40)">
			</div>
			<div class="form-group">
				<label >내용</label>
				<textarea cols="300"rows="25" class="form-control" name="AS_QNA_CONTENT" onkeyup="chkword(this,500)">${dto.AS_QNA_CONTENT}</textarea>
			</div>
			<button type="submit" class="btn btn-primary">&nbsp;&nbsp; 전송 &nbsp;&nbsp;</button>	
			<a href="SmyPage" class="btn btn-warning">취소</a>
		</form>
		

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