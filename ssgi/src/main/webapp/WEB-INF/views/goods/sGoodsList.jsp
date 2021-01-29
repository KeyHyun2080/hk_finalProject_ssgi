<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x"	uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql"	uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" >
<title>Insert title here</title>
</head>
<body>

<div class="container">
	
	<div>
		<a href="addGoods?${_csrf.parameterName}=${_csrf.token}">상품 등록</a>
	</div>
	<input type="hidden" value="${gDtos.goodsDto.user_id }"/>
	<table class="table">
		<thead>
			<tr>
				<th>상품 번호</th>
				<th>상품명</th>
				<th>상품 이미지</th>
				<th>상품 가격</th>
				<th>상품 수량</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${sGoodsList }" var="gDtos">
			<tr>
				<td>${gDtos.goodsDto.goods_num }</td>
				<td><a href="sGoodsDetail?goods_num=${gDtos.goodsDto.goods_num }">${gDtos.goodsDto.goods_name }</a></td>
				<td><img src="upload/${gDtos.goodsImageDto.goods_image }" width="100px" height="60px"/></td>
				<td>${gDtos.goodsDto.goods_price }</td>
				<td>${gDtos.goodsDto.qty }</td>
			</tr>
		</c:forEach>
		</tbody>
		
	</table>
	
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</body>
</html>