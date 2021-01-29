<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
</head>

<body>






<jsp:include page="menu2.jsp"></jsp:include>


<div class="container" style="margin-top:30px">
	
	<c:forEach items="${storeDetail }" var="sd">
	
	<h2 align="center">점포 정보</h2>
	<br/>
	<br/>
	<br/>
	
	<!-- 이미지 및 이름, 가격 -->
	<div class="row">
		<div class="col-md-7" id="1">
			<div id="carousel-sGoodsImg" class="carousel slide" data-ride="carousel">
				
				<div class="carousel-inner">
					<c:set var="count" value="0" />
					<input type="hidden" class="form-control" id="store_seq" name="store_seq" value="${sd.storeDto.store_seq}">
					<div class="carousel-item ${count == 0?'active':''}">
						<figure>
							<img src="sUpload/${sd.siDto.store_image}" style="width:615px; height:416px;">
						</figure>
					</div>
					<c:set var="count" value="1" />
					
				</div>
			</div>
		</div>
		<div class="col-md-5" id="2">
			<div><h3>${sd.storeDto.store_name}</h3></div><br /><hr/>
			<div>${sd.storeDto.store_owner}</div><br /><hr/>
			<div>${sd.storeDto.store_ph}</div><br /><hr/>
			<div>${sd.storeDto.store_addr}&nbsp;${sd.storeDto.store_addr2}</div>
		</div>
	</div>
	
	<!-- 점포 설명 -->
	<div class="container p-3 my-3 border">
		<p>${sd.storeDto.store_intro}</p>
	</div>
	
<br/><br/><br/>

	<%-- <!-- 여기에다가 이제 상품목록 또 만들어야지 이런 -->
	<div class="itIsGoods">
		<ul class="goods_ul">
			<c:set var="count" value="1" />
			
				<li class="goods_list" id="goods_list" >
					<dl class="goods" style="height: 200px;">
						<dt class="store_image">
							<a href="goodsDetail" class="itIsATag" style="height: 140px;">
								<img src="upload/${sd.goods_image}" style="width: 180px; height: 140px;">
							</a>
						</dt>
						<dd class="descriptions">
							<div class="goods-name" id="goods_name">${sd.goods_name}</div>
							<div class="price-area">
								<div class="price">
									<span class="price-info">
										${sd.goods_price}
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
			
		</ul>
	</div>
	 --%>
<a id="detail" >주소: ${sd.storeDto.store_addr}</a>
<div class="layer">
<div  class="center" id="map" style="width:500px;height:500px; position:absolute;"></div>	

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>;
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1b3c0ead44b1b923a2b686974680661&libraries=services"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var detail = document.getElementById( '${sd.storeDto.store_addr}' ); 
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
geocoder.addressSearch( '${sd.storeDto.store_addr}', function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${sd.storeDto.store_name}</div>'
        });
        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</c:forEach>	
</div>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</body>
</html>