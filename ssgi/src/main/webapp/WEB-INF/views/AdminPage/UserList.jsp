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
<title>공지사항</title>
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





</style>
</head>
<body>



<div  class="fadeIn animated">
	<div class="container" id="b">
		<br>
		<div style="text-align: center">
		<br>
			<h3>공지사항 페이지</h3>
			<hr>
			
			<table class="table ">
				<thead>
					<tr>
						<th>회원 아이디</th>
						<th>회원 이름</th>
						<th>회원 이메일</th>
						<th></th>
						<th>회원 정지여부 </th>
						<th></th>
						<th></th>
						<th></th>
						<th>회원 강퇴</th>
					</tr>
				</thead>
				<c:forEach items="${list}" var="dto">
				<tbody>
					<tr>
						<td>${dto.user_id }</td>
						<td>${dto.user_name }</td>
						<td>${dto.user_email }</td>
						<td></td>
						<td><a href="UserListUpdate?user_id=${dto.user_id}&&user_key=${dto.user_key}" onclick="return Update()" id="Update">${dto.user_key }</a></td>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="UserListDelete?user_id=${dto.user_id}" onclick="return Delete()" id="Delete">X</a></td>
					</tr>

				</tbody>
				</c:forEach>
			
			</table>

		</div>
		<hr>
		<form action="AdminNoticeWrite" method="post" >
			<div style="text-align: right">
			
			</div>
			</form>
	
	</div>
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


<script>
function Delete() {
	if(confirm("삭제하시겠습니까?")) {
		alert("삭제되었습니다");
		return true;
	}else {
		alert("삭제취소되었습니다");
		return false;
	}
	
}


function Update() {
	if(confirm("회원활동을 중지시키겠습니까??")) {
		alert("확인되었습니다");
		return true;
	}else {
		alert("취소되었습니다");
		return false;
	}
	
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>