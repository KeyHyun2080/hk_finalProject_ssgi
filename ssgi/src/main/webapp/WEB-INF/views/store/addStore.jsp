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
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete:function(data) {
				jQuery("#postcode1").val(data.postcode1);
				jQuery("#postcode2").val(data.postcode2);
				jQuery("#zonecode").val(data.zonecode);
				jQuery("#store_addr").val(data.address);
				jQuery("#store_addr2").focus();
				console.log(data);
			}
		}).open();
	}
</script>

<style>
#overflow {
	padding: 15px;
	width: 100%;
	height: 300px;
	overflow: scroll;
	border: 1px solid #ccc;
}
</style>

</head>
<body>

			
					



<div class="container">
	<form action="addStorePro?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"><br/> --%>
	
		<input type="hidden" id="user_id" name="user_id" value="${user_id}" />
		<div class="form-group">
			<label for="store_name">점포 이름</label>
			<input type="text" class="form-control" id="store_name" name="store_name" placeholder="점포 이름 입력" />
			<div class="invalid-feedback">점포 이름을 입력하세요.</div>
		</div>
		<div class="form-group">
			<label for="store_owner">대표명</label>
			<input type="text" class="form-control" id="store_owner" name="store_owner" placeholder="대표명 입력" />
			<div class="invalid-feedback">대표명을 입력하세요.</div>
		</div>
		
		<div class="form-group">
			<label for="store_image">점포 이미지</label>
			<div class="custom-file mb-3">
	    		<input type="file" class="custom-file-input" id="store_image" name="store_image" multiple="multiple" >
	    		<label class="custom-file-label" for="store_image"><span style="color:gray">파일 선택</span></label>
			</div>
		</div>
		
		<div class="form-group">
			<label for="store_intro">점포 소개</label>
			<textarea class="form-control" rows="5" id="store_intro" name="store_intro"></textarea>
		</div>
		<div class="form-group">
			<label for="store_ph">점포 전화번호</label>
			<input type="text" class="form-control" id="store_ph" name="store_ph" placeholder="점포 전화번호 입력" />
			<div class="invalid-feedback">점포 전화번호를 입력하세요.</div>
		</div>
		<div class="form-group">
			<input id="postcode1" type="hidden" value="" style="width:50px;" disabled/>
			
			<input id="postcode2" type="hidden" value="" style="width:50px;" disabled/>
			
			<input id="zonecode" type="hidden" value="" style="width:50px;" disabled/>
			
			<input type="button" class="btn btn-primary" onClick="openDaumZipAddress();" value="주소 찾기" />
			<br/>
			<input type="text" class="form-control" id="store_addr" name="store_addr" value="" style="width:100%;" placeholder="주소 찾기를 눌러 주소 검색" readonly/>
			<input type="text" class="form-control" id="store_addr2" name="store_addr2" value="" style="width:100%;" placeholder="상세주소 입력"/>
		</div>
		<div class="form-group">
			<label for="store_open">영업 시작 시간</label>
			<input type="time" class="form-control" id="store_open" name="store_open" placeholder="영업 시작 시간 입력" />
			<div class="invalid-feedback">영업 시작 시간을 입력하세요.</div>
		</div>
		<div class="form-group">
			<label for="store_close">영업 마감 시간</label>
			<input type="time" class="form-control" id="store_close" name="store_close" placeholder="영업 마감 시간 입력" />
			<div class="invalid-feedback">영업 마감 시간을 입력하세요.</div>
		</div>
		<div class="form-group">
			<label for="store_state">영업 상태</label>
			<select class="form-control" id="store_state" name="store_state">
		        <option value=""></option>
		        <option value="운영중">운영중</option>
				<option value="폐업">폐업</option>
			</select>
		</div>
		<div class="form-group">
			<label for="t24h">특이사항</label>
			<input type="text" class="form-control" id="t24h" name="t24h" placeholder="기타 특이사항 입력   예시) '주말 쉽니다.' / '토,일,공휴일 휴무' 등" />
		</div>
		<div class="form-group">
			<label for="store_category">상점 카테고리</label>
			<select class="form-control" id="store_category" name="store_category" >
		        <option value=""></option>
		        <option value="음식">음식</option>
				<option value="기타">기타</option>
				<option value="기타2">기타2</option>
			</select>
		</div>
		<br />
		<hr />
		<br />
		<div class="form-group">
			<label for="store_bank">은행명</label>
			<select class="form-control" id="store_bank" name="store_bank">
		        <option value=""></option>
		        <option value="국민은행">국민은행</option>
		        <option value="우리은행">우리은행</option>
		        <option value="IBK기업은행">IBK기업은행</option>
		        <option value="신한은행">신한은행</option>
		        <option value="하나은행">하나은행</option>
		        <option value="씨티은행">씨티은행</option>
		        <option value="카카오뱅크">카카오뱅크</option>
		        <option value="경남은행">경남은행</option>
		        <option value="농협">농협</option>
		        <option value="우체국">우체국</option>
			</select>
		</div>
		
		<div class="form-group">
			<label for="store_account">계좌번호</label>
			<input type="text" class="form-control" id="store_account" name="store_account" placeholder="계좌번호 입력" />
		</div>
		<br />
		<hr />
		<br />
		<div class="form-group">
			<label for="s_license_b_img">사업자등록증</label>
			<div class="custom-file mb-3">
	    		<input type="file" class="custom-file-input" id="s_license_b_img" name="s_license_b_img">
	    		<label class="custom-file-label" for="s_license_b_img"><span style="color:gray">파일 선택</span></label>
			</div>
		</div>
		
		<div class="form-group">
			<label for="s_license_s_img">영업신고증</label>
			<div class="custom-file mb-3">
	    		<input type="file" class="custom-file-input" id="s_license_s_img" name="s_license_s_img">
	    		<label class="custom-file-label" for="s_license_s_img"><span style="color:gray">파일 선택</span></label>
			</div>
		</div>
		
		<div class="form-group">
			<label for="s_license_num">사업자등록번호</label>
			<input type="text" class="form-control" id="s_license_num" name="s_license_num" placeholder="사업자등록번호 입력" />
		</div>
		<br />
		<hr />
		<br />
		<input type="hidden" id="s_admin_state" name="s_admin_state" value="N" />
		<div class="form-group">
			<label for="overflow">약관</label>
			<div id="overflow">
				<strong>제1조(서비스의 제공 및 변경)</strong><br />
				① "몰"은 다음과 같은 업무를 수행합니다.<br />
					&nbsp;&nbsp;&nbsp;1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br />
					&nbsp;&nbsp;&nbsp;2. 구매계약이 체결된 재화 또는 용역의 배송<br />
					&nbsp;&nbsp;&nbsp;3. 기타 “몰”이 정하는 업무<br /><br />
	
				② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 
	 			  이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br /><br />
		
				③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 
				   그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br /><br />
							
				④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br /><br /><br />
				
				<strong>제2조(서비스의 중단)</strong><br />
				① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br /><br />
				
				② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 
				   단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br /><br />
					
				③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고  
				   당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 
				  “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.<br /><br /><br />
							
				<strong>제3조(개인정보보호)</strong><br />
				① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.<br /><br />
							
				② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 
				   최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br /><br />
							
				③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.<br /><br />
							
				④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서  
				   당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br /><br />
							
				⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처),  
				   정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등  
				   「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br /><br />
							
				⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 
				   이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br /><br />
							
				⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를  최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실,  
				   도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br />
							
				⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br /><br />
							
				⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 
				   제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 
				   거절하지 않습니다.<br />
			</div>
			<div class="form-check" style="text-align:right">
				<label class="form-check-label" for="s_agreement">
					<input type="checkbox" class="form-check-input" id="s_agreement" name="s_agreement" value="Y">위 약관을 읽었으며, 약관에 동의 합니다.
				</label>
			</div>
		</div>
		
		<div class="form-group">
			<button type="submit" class="btn btn-primary"  >점포등록</button>
			<a  href="addStore" class="btn btn-warning"  >다시작성</a>
			<a  href="main" class="btn btn-info"  >메인으로</a>
		</div>
	</form>
</div>
<br />
<br />
<script>
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</body>
</html>