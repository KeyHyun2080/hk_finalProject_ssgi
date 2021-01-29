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

#topmenu {
	background: linear-gradient(to left,  #00FFFF,#9933FF, #00FFFF  );
	height: 150px;
}

.goods_ul li {
	list-style: none;
	padding-left: 30px;
	/* float: left; */
	display: inline-block;
}



</style>
</head>
<body>
<div  class="fadeIn animated">
<div id="topmenu" class="jumbotron">
<div style="text-align:center " class="text-white">
<h3>쇼핑</h3>
</div>

</div>

<br />
<br />


<div class="container " >
	<div class="row">
		<div class="col-10" id="itemList">
			<nav class="navbar navbar-expand-sm bg-white navbar-dark justify-content-end">
			</nav>
			<br /><br />
        	<div class="itIsGoods">
        		<ul class="goods_ul">
					<c:set var="count" value="1" />
					<c:forEach items="${goodsList}" var="gList">
						<li class="goods_list" id="goods_list" >
							<dl class="goods" style="height: 200px;">
								<dt class="store_image">
									<a href="goodsDetail?goods_num=${gList.goodsDto.goods_num }" class="itIsATag" style="height: 140px;">
										<img src="upload/${gList.goodsImageDto.goods_image }" style="width: 180px; height: 140px;">
									</a>
								</dt>
								<dd class="descriptions">
									<div class="goods-name" id="goods_name">${gList.goodsDto.goods_name }</div>
									<div class="price-area">
										<div class="price">
											<span class="price-info">
												${gList.goodsDto.goods_price }
											</span>
										</div>
									</div>
								</dd>
							</dl>
						</li>
						<c:if test="${count%4==0}">
							<hr /><br />
						</c:if>
						<c:set var="count" value="${count+1}" />
					</c:forEach>
				</ul>
        	</div>
		</div>
	</div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script>
$(document).ready(function(){
	$("#myInput").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#itemList h4").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
});
</script>

</body>
</html>