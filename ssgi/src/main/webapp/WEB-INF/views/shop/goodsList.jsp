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
</head>
<body>

<div class="container">
	<ul>
		<c:forEach items="${goodsList }" begin="0" end="3" var="gList" varStatus="status">
		<li class="goods_list" id="goods_list" >
			<a href="goodsDetail" class="" style="height: 450px;">
				<dl class="goods" style="height: 428px;">
					<dt class="store_image">
						<img src="upload/${gList.goods_image }" style="width: 300px;">
					</dt>
					<dd class="descriptions">
						<div class="goods-name" id="goods_name">${gList.goods_name }</div>
						<div class="price-area">
							<div class="price-wrap">
								<div class="price">
									<span class="price-info">
										<del class="base-price">${gList.goods_price }</del>
									</span>
								</div>
							</div>
						</div>
					</dd>
				</dl>
			</a>
		</li>
		<c:if test="${status.end eq 3 }">
			<br /><hr /><br />
		</c:if>
		</c:forEach>
	</ul>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</body>
</html>