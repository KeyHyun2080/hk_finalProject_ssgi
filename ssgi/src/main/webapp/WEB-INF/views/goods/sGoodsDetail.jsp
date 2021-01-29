<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x"	uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql"	uri="http://java.sun.com/jsp/jstl/sql" %>
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
img {
	width:580px;
	height:400px;
}
</style>
</head>
<body>
<div class="container" style="margin-top:30px">
<c:forEach items="${sGoodsDetail }" var="sgd">

	<!-- 이미지 및 이름, 가격 -->
	<div class="row">
		<div class="col-md-7" id="1" style="width:600px; height:400px;">
			<img src="upload/${sgd.goodsImageDto.goods_image }">
		</div>
		<div class="col-md-5" id="2">
			상품명 <br/><br/><div class="goodsData"><h3><strong>${sgd.goodsDto.goods_name }</strong></h3></div><hr/><br />
			상품 가격<br/><br/><div class="goodsData"><h3><strong><fmt:formatNumber value="${sgd.goodsDto.goods_price}" pattern="###,###,###원"/></strong></h3></div><hr /><br />
			상품 총 수량<br /><br/><div class="goodsData"><h3><strong>${sgd.goodsDto.qty }개</strong></h3></div><hr/>
		</div>
	</div>
	<br /><hr /><br />
	<!-- 상품설명 -->
	<div>상품 설명</div>
	<div class="container p-3 my-3 border">
		<p class="goodsData">${sgd.goodsDto.goods_content }</p>
	</div>
	<div style="text-align:right">
		<a href="sGoodsModify?goods_num=${sgd.goodsDto.goods_num }" class="btn btn-primary" role="button">상품 수정</a>
		<a href="sGoodsDelete" class="btn btn-danger" role="button">상품 삭제</a>
		<a href="sGoodsList" class="btn btn-info" role="button">목록으로</a>
	</div>
</c:forEach>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</body>
</html>