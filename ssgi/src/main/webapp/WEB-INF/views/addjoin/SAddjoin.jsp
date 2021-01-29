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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>일반회원 회원가입</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function(){

// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#user_id").blur(function() {
		$("#idchk").on("click", function(){
		// id = "id_reg" / name = "userId"
		var user_id = $('#user_id').val();
		var idJ = /^[a-z0-9]{4,12}$/;
		$.ajax({
			url : '${pageContext.request.contextPath}/user/idCheck?user_id='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다");
						$("#id_check").css("color", "red");
					
		
		
				} else {	
						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#id_check").css("color", "red");
	
				
						} else if(user_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							
										
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
								
							
						}
						
						//스팬에  값넣어줘서 중복확인 저지
						$("#id_check").text("사용가능한 아이디입니다.");
						$("#id_check").css("color", "blue");
						$('#idspan').text(data);
						

			
							
						
					}
				
				}, error : function() {
						console.log("실패");
				}
			});
		});
	})

		//아이디 재입력 저지용
		$("#user_id").focus(function(){
			$("#idspan").text("1");
		});

			
	

	
		//이메일
		$("#user_email").blur(function() {
			$("#emailchk").on("click", function(){
			// id = "id_reg" / name = "userId"
			var user_email = $('#user_email').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/user/emailCheck?user_email='+ user_email,
				type : 'get',
				success : function(data) {
					console.log("1 = email중복o / 0 = email중복x : "+ data);							
					
					if (data == 1) {
							// 1 : 아이디가 중복되는 문구
							$("#email_check").text("사용중인 이메일입니다");
							$("#email_check").css("color", "red");
						
			
			
					} else {	
							if(user_id){
								// 0 : 아이디 길이 / 문자열 검사
								$("#email_check").text("");
				
		
					
							} else if(user_id == ""){
								
								$('#email_check').text('이메일를 입력해주세요 :)');
								$('#email_check').css('color', 'red');
						
								
							} else {
								
								$('#email_check').text("ㅎㅎ.");
								$('#email_check').css('color', 'red');
					
								
							}
							
							
							$("#email_check").text("사용가능한 이메일입니다.");
							$('#email_check').css('color', 'blue');
							$('#emailspan').text(data);
							
						
							
						}
					
					
					
					}, error : function() {
							console.log("실패");
					}
				});
			});
		})	
		
		
		//이메일 재입력저지용
		$("#user_email").focus(function(){
			$("#emailspan").text("1");
		});
			
		


			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){

				if($("#user_name").val()==""){
					alert("성명을 입력해주세요.");
					$("#user_name").focus();
					return false;
				}
				
				if($("#user_id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#user_id").focus();
					return false;
				}
				
				if($("#idspan").text()=="1" || $("#idspan").text()==""){
					alert("중복확인을 해주세요");
					$("#user_id").focus();
					return false;
				}

				
				if($("#user_pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#user_pw").focus();
					return false;
				}
				
				if($("#user_chk").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#user_chk").focus();
					return false;
				}
				
				if($("#user_email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#user_email").focus();
					return false;
				}
				
				if($("#emailspan").text()=="1" || $("#emailspan").text()==""){
					alert("중복확인을 해주세요");
					$("#user_email").focus();
					return false;
				}
				
				if($("#user_addr").val()==""){
					alert("주소를 입력해주세요.");
					$("#user_addr").focus();
					return false;
				}
				if($("#user_addr2").val()==""){
					alert("나머지 주소를 입력해주세요.");
					$("#user_addr2").focus();
					return false;
				}
				if($("#user_ph").val()==""){
					alert("휴대폰번호를  입력해주세요.");
					$("#user_ph").focus();
					return false;
				}
				if($("#user_ph").val()==""){
					alert("휴대폰번호를  입력해주세요.");
					$("#user_ph").focus();
					return false;
				}
				
			       if (!$('#user_agree').is(':checked')) {
			           alert('약관동의를 체크해주세요');
			           return false;
			       }


			});
			
		
			
			

			//비밀번호 확인
			$('#user_chk').blur(function(){
			   if($('#user_pw').val() != $('#user_chk').val()){
			    	if($('#user_chk').val()!=''){
				    alert("비밀번호가 일치하지 않습니다.");
			    	    $('#user_chk').val('');
			          $('#user_chk').focus();
			       }
			    }
			})  		   
			


			
			
})

</script>




<style>

#b  {
	padding-right: 150px;
	padding-left: 150px;
	margin-right: auto;
	margin-left: auto;
} 

#a {
	padding-right: 120px;
	padding-left: 120px;
	margin-right: auto;
	margin-left: auto;
} 

</style>

</head>

<header>
	<br>
	<div id="a" class="container" >
		<nav class="navbar navbar-expand-md navbar-light">
		
			<!-- 로고 이미지 -->
			<a href="main"><img id="sizzang"src="images/천년가게.png"></a>
			<!-- 로고 이미지 -->
			
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse  justify-content-end"
				id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto text-right">
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 회원가입 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="UAddjoin" style="text-align:right">일반 회원가입 </a> 
							<a class="dropdown-item" href="SAddjoin" style="text-align:right">사업자 회원가입</a>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="ULogin?log=start" style="text-align:right"> 로그인 </a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	
	<hr>
	
</header>


<body>




			
			
			<a href="#"><img id="로고" src="images/천년가게.png" class="mx-auto d-block"></a>
           <br>
            <div  id="b" class="container">
            	 <div style="text-align:center"> 
					<h3>사업자 회원가입</h3>
             	 </div>
                <form role="form" action="Sjoin" method="post" id="reg_submit">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"><br/>
                    <div class="form-group">
                        <label for="inputName">성명</label>
                        <input type="text" class="form-control" name="user_name" id="user_name" placeholder="이름을 입력해 주세요">
                        
                    </div>
                    <div class="form-group">
                        <label for="InputId">아이디</label>
                        <input type="text" class="form-control" name="user_id" id="user_id"placeholder="아이디를 입력해주세요">
                       	<div class="check_font" id="id_check"></div>
                       	<span hidden="text" id="idspan"></span>
                       	<input  type="button" class="btn btn-primary" id="idchk" value="아이디 중복확인"><br>

                    </div>
                    <div class="form-group">
                        <label for="inputPassword">비밀번호</label>
                        <input type="password" class="form-control" name="user_pw" id="user_pw"placeholder="비밀번호를 입력해주세요">
                    </div>
                    
                    <div class="form-group">
                        <label for="inputPassword">비밀번호 확인</label>
                        <input type="password" class="form-control" name="user_chk" id="user_chk"placeholder="비밀번호를 한번더 입력해주세요">
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="inputMobile">이메일</label>
                        <input type="email" class="form-control" name="user_email" id="user_email" placeholder="이메일을 정확하게 입력해주세요">
                        <input  type="button" class="btn btn-primary" id="emailchk" value="이메일 중복 확인"><br>
                      	<div class="check_font" id="email_check"></div> 
                      	<span hidden="text" id="emailspan"></span>                     
                    </div>

                    <div class="form-group">
                  
                        <input  type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
                        <input type="text" class="form-control"name="user_addr" id="user_addr" placeholder="주소를 입력해주세요">   
                        <input type="tel" class="form-control" name="user_addr2"  id="user_addr2" placeholder="상세주소를 입력해주세요">                 
                    </div> 
                      
        
      	
                        
                    <div class="form-group">
                        <label for="inputMobile">휴대폰 번호</label>
                        <input type="tel" class="form-control" name="user_ph"  id="user_ph" placeholder="휴대폰번호를 입력해 주세요">
                    </div>
                    

<!--                     <div class="form-group">
                    <label for="inputGender" class="cform-control">성별</label>
                        <select class="form-control" id="gender">
                            <option value="M">남</option>
                            <option value="F">여</option>
                    </select>
               		 </div> -->


                    <div class="form-group">
                    <label>약관 동의</label>
                    <br/>
                    
                  
                    이용약관에 동의하시겠습니까? <input name="user_agree" id="user_agree" value="Y" type="checkbox" required="required"/> <br/>
							<button type="button"  class="btn modal_Btn btn-primary"> 이용약관</button>
                   
                    
                  
                    </div>

                     <div class="form-group text-center">
                        <button type="submit"  class="btn btn-primary btn-block" id="submit">
                           입력 완료<i class="fa fa-check spaceLeft"></i>
                        </button>
                        
                         
                          
                 
      				</div>
                </form>
                
            </div>
 
<input hidden="text" id="sample6_postcode" placeholder="우편번호">
<input hidden="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input hidden="text" id="sample6_address" placeholder="주소"><br>
<input hidden="text" id="sample6_detailAddress" placeholder="상세주소">
<input hidden="text" id="sample6_extraAddress" placeholder="참고항목">

 
  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("user_addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_addr2").focus();
            }
        }).open();
    }
    
    $(function(){
    	$(".modal_Btn").click(function(){
    		$("div.modal").modal();
    	});
    });    
</script>

<div class="modal fade" id="myModal" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">  
  		<!-- Modal content-->
   		<div class="modal-content" >
     		<div class="modal-header"> 
     			<span style="font-size:30px;">회원가입 이용약관</span>| 시행일자 : 기원전 69년 - 신라, 박혁거세 탄생해
     			<button type="button" class="btn btn-default" data-dismiss="modal" style="float:right;margin-top:5px;">확인</button>
     		</div>
     		<div class="modal-body">  
				
				이것은 이용약관..<br/>
				<br/>
				나는 아이즈원이 좋다<br/>
				
				
				
				
     		</div>
   		</div>  
	</div> 
</div>
</body>
</html>