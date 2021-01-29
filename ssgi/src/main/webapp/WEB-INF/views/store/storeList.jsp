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
<title>Insert title here</title>
<style>
.store_ul li {
	list-style: none;
	padding-left: 50px;
	/* float: left; */
	display: inline-block;
}

</style>
</head>
<body>

					
					<!-- 로그인시 보여줄 로그아웃 태그 시작-->
					<sec:authorize access="hasRole('ROLE_SELLER')">
					<form action="logout" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input type="submit" value="LOGOUT"/>
					</form>
				
					<li class="nav-item"><a class="nav-link"  href="SmyPage">S마이페이지</a></li>


								
					</sec:authorize>




<div class="container">
	<p><a href="addStore">상점 등록쓰</a></p>
	
	<ul class="store_ul">
		<c:set var="count" value="1" />
		<c:forEach items="${storeList }" var="sList">
			<li class="store_list" id="store_list" >
				<dl class="stores" style="height: 200px;">
					<dt class="store_image">
						<a href="storeDetail?store_seq=${sList.storeDto.store_seq }" class="store_detail" style="height: 200px;">
							<img src="sUpload/${sList.siDto.store_image }" style="height:160px; width:200px;">
						</a>
					</dt>
					<dd class="descriptions">
						<div class="store-name" id="store_name">${sList.storeDto.store_name }</div>
					</dd>
				</dl>
			</li>
		<c:if test="${count%4==0}">
			<hr /><br />
		</c:if>
		<c:set var="count" value="${count+1 }" />
		</c:forEach>
	</ul>
	
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</body>
</html>