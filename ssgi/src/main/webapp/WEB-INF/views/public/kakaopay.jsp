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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
</head>
<body>

<script>


	$(function() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp33570661'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

		IMP.request_pay({
			pg : 'kakaopay', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : '상인이름상점이름' + new Date().getTime(),
			name : '스테이크',
			amount : 999999,
			buyer_email : 'iamport@siot.do',
			buyer_name : '유저이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			
		}, function(rsp) {
			if (rsp.success) {
			    if ( rsp.success ) {
			    	
			    }
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	jQuery.ajax({
			    		url: "insert문", 
			    		type: 'POST',
			    		dataType: 'json',
			    		async:false,
			    		data: { 
			    			
			    			//key : value
			    			imp_uid : rsp.imp_uid,
				    		merchant_uid: rsp.merchant_uid
				    		
				    		//기타 필요한 데이터가 있으면 추가 전달  
			    		} 
			    	})
											
				var msg = '결제가 완료되었습니다.';
			    msg += '   '
				msg += '상품 명 : ' + rsp.name;
				msg += '   '
				msg += '결제 금액 : ' + rsp.paid_amount;
				
		
				location.href="main";
				
				//아작스
		
				
				
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				location.href="goodsDetail?goods_num=${sgd.goodsDto.goods_num }";
				
			}
			alert(msg);
		});

	});
</script>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</body>
</html>