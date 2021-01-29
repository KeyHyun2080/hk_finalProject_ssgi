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
<title>myPageQNA</title>
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
<body>

	<div class="fadeIn animated">
		<div class="container" id="b">
			<br>
			<div style="text-align: center">
				<a href="#"><img id="로고" src="images/천년가게.png"
					class="mx-auto d-block"></a> <br>
				<h3>판매자 회원 문의 내역</h3>

				<div class="container" id="b"></div>
			</div>




		<!-- 문의내역 -------------------------------------------------------------------------------------->


	
			<table class="table ">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>글 제목</th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th>작성일</th>
						<th></th>
						<th>답변상태</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${list}" var="dto">
				<tbody>
					<tr>
						<td>${dto.AS_QNA_NUM }</td>
						<td><a>${dto.AS_QNA_TITLE}</a></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><fmt:formatDate value="${dto.AS_QNA_DATE}" pattern="yyyy-MM-dd hh:mm"/></td>
						<td></td>
						<td>
						<c:choose>
							<c:when test="${dto.AS_QNA_READ ne '답변완료'}"><a style="color:red;">읽지않음</a></c:when>
							<c:when test="${dto.AS_QNA_READ eq '답변완료'}"><a style="color:green;">답변완료</a></c:when>
						</c:choose>	
						</td>
						<td>
						<c:choose>
							<c:when test="${dto.AS_QNA_READ ne '답변완료'}"><a href="SAdminAnswerWrite?AS_QNA_NUM=${dto.AS_QNA_NUM}"  style="color:blue;">답변 하기</a></c:when>
							<c:when test="${dto.AS_QNA_READ eq '답변완료'}"><a href="#" style="color:blue;">답변수정</a></c:when>
						</c:choose>	
						</td>
						
					</tr>

				</tbody>
				</c:forEach>
			
			</table>
		
			<hr>
			<form action="#" method="post" >
			<div style="text-align: right">
				
			</div>
			</form>
		</div>
	</div>


	<!-- 문의내역 -------------------------------------------------------------------------------------->
	
	

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>