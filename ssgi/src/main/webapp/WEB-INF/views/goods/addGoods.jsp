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
<script type="text/javascript">
	function categoryChk(){
		
		var index = $("#g_category  option:selected").val();
		console.log('index : '  + index);
		if(index == null || index == ""){
			alert("카테고리를 선택해주세요.");
		}
		
	}
	
	
</script>
<body>
<div class="container">
	<form action="addGoodsPro?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	
		<input type="hidden" id="user_id" name="user_id" value="${user_id }" />
		<div class="form-group">
			<label for="goods_num">상품번호</label>
			<input type="text" class="form-control" id="goods_num" name="goods_num" placeholder="상품번호 입력" />
			<div class="invalid-feedback">상품 번호를 입력하세요.</div>
		</div>
		<div class="form-group">
			<label for="goods_name">상품명</label>
			<input type="text" class="form-control" id="goods_name" name="goods_name" placeholder="상품명 입력" />
			<div class="invalid-feedback">상품명을 입력하세요.</div>
		</div>
		<div class="form-group">
			<label for="goods_price">상품가격</label>
			<input type="text" class="form-control" id="goods_price" name="goods_price" placeholder="상품가격 입력" />
			<div class="invalid-feedback">상품가격을 입력하세요.</div>
		</div>
		<div class="form-group">
			<label for="goods_content">상품설명</label>
			<textarea class="form-control" rows="13" id="goods_content" name="goods_content"></textarea>
			<div class="invalid-feedback">상품설명을 입력하세요.</div>
		</div>
		<div class="form-group">
			<label for="qty">상품 수량</label>
			<input type="text" class="form-control" id="qty" name="qty" placeholder="상품 수량 입력" />
			<div class="invalid-feedback">상품명을 입력하세요.</div>
		</div>
		<div class="form-group">
			<label for="g_category">카테고리 분류</label>
			<select class="form-control" id="g_category" name="g_category" onchange="javascript:categoryChk();">
		        <option value=""></option>
		        <option value="음식">음식</option>
				<option value="기타">기타</option>
				<option value="기타2">기타2</option>
			</select>
		</div>
		
		<!-- 
		<div class="form-group">
			<label for="goods_image">상품이미지</label>
			<input type="file" id="goods_image" name="goods_image" multiple="multiple" />
		</div>
		-->
		 
		<div class="form-group">
			<div class="custom-file mb-3">
		    	<label for="goods_image">상품이미지</label>
		    	<input type="file" class="custom-file-input" id="goods_image" name="goods_image" multiple="multiple" >
		    	<label class="custom-file-label" for="goods_image"><span style="color:gray">파일을 선택하세요</span></label>
			</div>
		</div>
		
		<div class="form-group">
			<input type="submit" class="btn btn-primary" value="상품등록" />
			<input type="reset" class="btn btn-warning" value="다시작성" />
			<input type="button" class="btn btn-info" value="목록으로 이동" onclick="sGoodsListGo();"/>
		</div>
	</form>
</div>
<script>
	function sGoodsListGo() {
		location.href="sGoodsList"
	}

</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</body>
</html>