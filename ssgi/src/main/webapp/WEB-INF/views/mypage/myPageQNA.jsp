<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
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

<!-- 여기서 부터 수정 2020-08-11 페이징-->


<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		//location.href="myPageQNA?nowPage=${paging.nowPage}&cntPerPage="+sel;
		 if(sel == 5) {
			location.href="myPage";
		}else {
			location.href="myPageQNA?nowPage=${paging.nowPage}&cntPerPage="+sel;
		}  
	}
</script>




<body>
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="URI" value="${pageContext.request.requestURI}" />
<c:choose>
	<c:when test="${paging.nowPage > 1}">
		<jsp:include page="menu.jsp"></jsp:include>
	</c:when> 
	<c:when test="${paging.nowPage > 1 and cntPerPage > 5 }">
		<jsp:include page="menu.jsp"></jsp:include>
	</c:when> 
		<c:when test="${URI eq '/myPageQNA'  }"> 
	</c:when>
</c:choose>


<c:choose>
	<c:when test="${paging.cntPerPage eq 10  }">
		<jsp:include page="menu.jsp"></jsp:include>
	</c:when> 
	<c:when test="${paging.cntPerPage eq 15  }">
		<jsp:include page="menu.jsp"></jsp:include>
	</c:when> 
	<c:when test="${paging.cntPerPage eq 20  }">
		<jsp:include page="menu.jsp"></jsp:include>
	</c:when> 
	
	

	
		<c:when test="${URI eq '/myPageQNA'  }"> 
	</c:when>
</c:choose>



	<div class="fadeIn animated">
		<div class="container" id="b">
			<br>
			<div style="text-align: center">
				<a href="#"><img id="로고" src="images/천년가게.png"
					class="mx-auto d-block"></a> <br>
				<h3>문의 내역</h3>

				<div class="container" id="b"></div>
			</div>


<div id="outter">
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5" 
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
	
	
	
	
<!-- 여기 까지 수정 2020-08-11 페이징-->








		<!-- 문의내역 -------------------------------------------------------------------------------------->
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="USER_ID"  class="form-control"  value="${user_id }">

		<form action="myQNADelete" method="post">
		
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
						<th>답변여부</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${viewAll }" var="dto">
				<tbody>
					<tr>
						<td>${dto.AU_QNA_NUM }</td>
						<td><a href="myQNADetail?AU_QNA_NUM=${dto.AU_QNA_NUM}">${dto.AU_QNA_TITLE}</a></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><fmt:formatDate value="${dto.AU_QNA_DATE}" pattern="yyyy-MM-dd hh:mm"/></td>
						<td></td>					
						<td>
						<c:choose>
						<c:when test="${dto.AU_QNA_READ ne '답변완료'}"><a  style="color:red">읽지않음</a></c:when>
						</c:choose>
						<c:choose>
						<c:when test="${dto.AU_QNA_READ eq '답변완료'}"><a  href="myQNADetail?AU_QNA_NUM=${dto.AU_QNA_NUM}" style="color:green">답변완료</a></c:when>
						</c:choose>
						</td>
						<td><a  href="myQNADelete?AU_QNA_NUM=${dto.AU_QNA_NUM}" onclick="return UQNADelete()">X</a></td>
					</tr>

				</tbody>
				</c:forEach>
				

			
			</table>
			
		</form>
		
<!-- 여기서부터 수정 2020-08-11 페이징-->	

<!-- 페이징 -->
			<hr>
			<form action="myQNAWrite" method="post" >
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div style="text-align: right">
				<button type="submit" class="btn btn-primary">문의 하기</button>
			</div>
			</form>
		</div>
	</div>
	
	<div style="display: block; text-align: center;" >		
		<c:if test="${paging.startPage != 1 }">
			<%-- <a  href="myPageQNA?nowPage=${paging.startPage - 3 }&cntPerPage=${paging.cntPerPage}">&lt;&lt;</a> --%>
			<a  href="myPage">&lt;&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p  }</b>
				</c:when>
				<c:when test="${p == paging.startPage }">
					<a href="myPage">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a id="page" href="myPageQNA?nowPage=${p  }&cntPerPage=${paging.cntPerPage}" >${p }</a>
				</c:when>
				
			
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a  href="myPageQNA?nowPage=${paging.endPage + 1 }&cntPerPage=${paging.cntPerPage}">&gt;&gt;</a>
		</c:if>
	</div>

<!-- 여기 까지 수정 2020-08-11 페이징-->	
	
	
	
</div>






	<!-- 문의내역 -------------------------------------------------------------------------------------->
	
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
function UQNADelete() {
	if(confirm("삭제하시겠습니까?")) {
		alert("삭제되었습니다");
		return true;
	}else {
		alert("삭제취소되었습니다");
		return false;
	}
	
}



</script>

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
	<br>	<br>
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
	
<!-- 하단-------------------------------------------------------------------------------------------------------------------- -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<a href="map">사업장 위치</a>
	</div>
	
	
	
<!-- 하단 끝------------------------------------------------------------------------------------------------------------------- -->


</body>
</html>