<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
		-webkit-appearance: none;
	}
	
	input[type="date"]::before {content:attr(data-placeholder);width:100%}
	input[type="date"]:focus::before,
	input[type ="date"]:valid::before {
		display: none;
	}
	
/* 	.info_update_window {
	    padding-top: 100px;
	    display: flex;
	    flex-direction: column;
	    align-content: center;
	    flex-wrap: wrap;
	    align-items: center;
	}
	
	.btn_group {
		text-align : center;
		padding : 20px;
	}
	
 	.header { display : none; }
	footer { display : none !important; }
	.modal-backdrop { display: none; }

	.btn_1.medium {
	    float: right;
	}
*/
    .row {
    	display: flex;
    	flex-wrap : nowrap;
    }
    
    .container-fluid {
    	display: flex;
	    align-items: center;
	    flex-direction: column;
    }
    
	#phoneNumber1, #phoneNumber2 {
    	margin-top: 11px;
    }
    
    .make-flex div {
    	display: flex;
    }
    
    .make-flex div input:nth-child(2n) {
		margin-left: 10px;
	}
    
	
</style>

<script>

	function numberLength(e) {
		if(e.value.length > e.maxLength){
			e.value = e.value.slice(0, e.maxLength);
		}
	}
	
	function checkThePwd(){
		
		let modiPwd = document.getElementsByName('mPwd')[0].value;	// 수정 비번
		let idenPwd = document.getElementsByName('iPwd')[0].value;	// 확인 비번
		
		console.log('수정 비번 : ' + modiPwd);
		console.log('확인 비번 : ' + idenPwd);
		
		if(modiPwd === "" && idenPwd === ""){
			
			alert('변경할 비밀번호가 입력되어 있지 않습니다.');
			document.getElementById('mPwd').focus();
			return;
			
		} else if (modiPwd != idenPwd){
			
			alert('비밀번호가 일치하지 않습니다.');
			document.getElementById('iPwd').focus();
			return;
			
		} else {
			
			alert('일치합니다.');
			document.getElementById('pwdCheck').value = "checked";
			
		}
		
	}
	
	function submitBtn(){
		
		let modiPwd = document.getElementsByName('mPwd')[0].value;				// 수정 비번
		let idenPwd = document.getElementsByName('iPwd')[0].value;
		let checkPwd = document.getElementsByName('pwdCheck')[0].value;			// 비번 확인 버튼
		let emailWrite = document.getElementsByName('new_email')[0].value;		// 입력 이메일
		let emailSelect = document.getElementsByName('localEmail')[0].value;	// 선택 이메일
		let frontNumber = document.getElementsByName('phoneNumber1')[0].value;	// 전번 앞번호
		let backNumber = document.getElementsByName('phoneNumber2')[0].value;	// 전번 뒷번호
		
		if (modiPwd != "" && checkPwd == "unChecked") {
			
			alert('비밀번호 일치 여부를 확인해 주세요.');
			document.getElementById('iPwd').focus();
			return;
			
		}else if (modiPwd != idenPwd){
			
			alert('비밀번호를 확인해 주세요.');
			document.getElementById('iPwd').focus();
			document.getElementById('pwdCheck').value = "unChecked";
			return;
			
		} else if (modiPwd != idenPwd && checkPwd == "unChecked"){
			 
			alert("비밀번호를 한번 더 체크하시오.");
			document.getElementById('iPwd').focus();
			return;
			
		} else if((frontNumber != "" || backNumber != "") && (frontNumber.length < 4 || backNumber.length < 4)){
		
			alert('수정할 전화번호를 8자리 모두 입력하시오.');
			document.getElementById('phoneNumber1').focus();
			return;
		
		} else if(emailWrite != "" && emailSelect == '선택'){
			
			alert('이메일 주소를 선택하시오.');
			document.getElementById('new_email').focus();
			return;
			
		} else {
			
			alert('수정됐습니다.\n미입력 정보는 기존값으로 넣어집니다.');	// 안 돼도 됐다고 함.
			frm.submit();
			
		}
	}
	
	function randomPassword(){
		
		alert('랜덤 비밀번호 생성!');
		
		var newPwd = document.getElementsByName('randomPwd')[0].value;
		var randomValue = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
							+ "abcdefghijklmnopqrstuvwxyz"
							+ "0123456789!@#$%^&*()_-+=~`,.";
		
		for (i = 1; i <= 8; i++) {
			
			randomPoint = Math.round(Math.random() * randomValue.length + 1);
			Pwdchar = randomValue.charAt(randomPoint);
			
			if (i == 1) {
				
				newPwd = Pwdchar;
			} else {
				
				newPwd += Pwdchar;
			}
		}
		randomPwd.value = newPwd;
		alert ('새로이 생성된 비밀번호는 뒤에서 확인 바랍니다.');
		frm.submit();
	}
	
	// 주소 api ~>> http://postcode.map.daum.net/guide
	function findPostCode(){
		
		new daum.Postcode({
			
			oncomplete: function(data){
				// 팝업에서 검색 결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.
				
				// 내려오는 변수가 값이 없는 경우 공백('') 값을 가지므로, 참고하여 분기한다.
				var roadAddress = data.roadAddress;		// 도로명 주소 변수
				var extraRoadAddress = '';				// 참고 항목 변수
				
				// 법정 동명이 있을 경우 추가. 단, 법정리는 제외.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					
					extraRoadAddress += data.bname;
				}
				
				// 건물명이 있고 공동 주택일 경우 추가
				if (data.buildngName !== '' && data.apartment === 'Y'){
					
					extraRoadAddress += (extraRoadAddress !== ''? ', ' + data.buildingName : data.buildingName);
				}
				
				// 표시할 참고 항목이 있을 경우 괄호까지 추가한 최종 문자열을 만든다.
				if(extraRoadAddress !== ''){
					
					extraRoadAddress = ' (' + extraRoadAddress + ')';
				}
				
				// 우편 번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postCode').value = data.zonecode;
				document.getElementById('roadAddr').value = roadAddress;
				document.getElementById('bunAddr').value = data.jibunAddress;
				
				// 참고 항목 문자열이 있을 경우 해당 필드에 넣는다.
				if(roadAddr !== ''){
					
					document.getElementById('extraAddr').value = extraRoadAddress;
				} else {
					
					document.getElementById('extraAddr').value = '';
				}
				
				var guideTextBox = document.getElementById("guide");
				
				// 사용자가 '선택 안 함'을 클릭할 경우, 예상 주소라는 표시를 해 준다.
				if(data.autoRoadAddress){
					
					var expRoadAddr = data.autoRoadAddress + extraRoadAddress;
					guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
					guideTextBox.style.display = 'block';
					
				} else if(data.autoJibunAddress) {
					
					var expJibunAddr = data.autoJibunAddress;
					guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
					guideTextBox.style.display = 'block';
					
				} else {
					
					guideTextBox.innerHTML = '';
					guideTextBox.style.display = 'none';
				}
			}
		
		}).open();
	}
	
	
	// 관리자 이외에 접근 시 에러 페이지로 이동
	function errorPage(){
		
		location.href = "errorPage.do";
	}
</script>


<body class="fixed-nav sticky-footer" id="page-top">

	<c:choose>
		<c:when test = "${id eq 'admin'}">
	
			<!-- Navigation-->
			<nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
				<a class="navbar-brand" href="home.do"><img src="/soyg/resources/udema_v_1.9/admin_section/img/logo.png" data-retina="true" alt="" width="163" height="36"></a>
				<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
			  	</button>
				<div class = "collaps navbar-collapse" id = "navbar-Responsive">
					<ul class="navbar-nav ml-auto">
			   			<li class="nav-item">
				      	<a class="nav-link" data-toggle="modal" data-target="#exampleModal">
							<i class="fa fa-fw fa-sign-out"></i>로그아웃
						</a>
			  			</li>
					</ul>
				</div>
			</nav>
			
			<!-- /Navigation-->
			<div class="content-wrapper">
				<div class="container-fluid">
					<ol class="breadcrumb" style = "width : 832px; margin-top : 30px;">
						<li class="breadcrumb-item">
							<a href="admin.do">관리자 페이지</a>
						</li>
						<li class = "breadcrumb-item">
							<a href = "userListPaging.do">회원 리스트</a>
						</li>
						<li class="breadcrumb-item active">회원 정보 수정 페이지</li>
					</ol>
		      
					<form id = "frm" action = "userUpdate.do" method = "POST">
				
					<!-- 미수정 시 받아갈 값들 -->
					<input type = "hidden" name = "exID" value = "${user.userID }">
					<input type = "hidden" name = "exName" value = "${user.name }">
					<input type = "hidden" name = "exGender" value = "${user.gender }">
				
					<div class="box_general padding_bottom">
						<div class="header_box version_2">
							<h2><i class="fa fa-user"></i>회원 ${user.userID }의 상세 정보</h2>
						</div>
						
						<div class="row">
						
							<!-- 
							<div class="col-md-4">
								<div class="form-group">
								<label>Your photo</label>
									<form action="/file-upload" class="dropzone"></form>
							    </div>
							</div>
							 -->
						
							<div class="col-md-8 add_top_30">
							
								<!-- 이름 -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>이름</label>
											<input type="text" class="form-control" name = "userName" value = "${user.name }" placeholder="${user.name }">
										</div>
									</div>
								</div>
								
								<!-- 생년월일 & 성별-->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>생년월일</label>
											<input type = "text" name = "exBirth" class = "form-control" placeholder="${user.birth }" readonly value = "${user.birth }">
										</div>
									</div>
									<div class = "col-md-6">
										<div class = "form-group">
											<label>변경할 생년월일</label>
											<input type="date" class="form-control" name = "birth" data-placeholder = "우측 아이콘 클릭" required aria-required="ture">
										</div>
									</div>
								</div>
								<div class = "row">
									<div class="col-md-6">
										<div class="form-group">
											<label>성별 : ${user.gender }</label>
											<div>
												<c:if test= "${user.gender eq 'male' }">
													<input type = "radio" name = "gender" value = "male" checked>남자
													<input type = "radio" name = "gender" value = "female">여자
												</c:if>
												<c:if test= "${user.gender eq 'female' }">
													<input type = "radio" name = "gender" value = "male">남자
													<input type = "radio" name = "gender" value = "female" checked>여자
												</c:if>
												<c:if test= "${user.gender ne 'female' && user.gender ne 'male' }">
													<input type = "radio" name = "gender" value = "male">남자
													<input type = "radio" name = "gender" value = "female">여자
													<input type = "hidden" name = "gender" value = "">
												</c:if>
											</div>
											<%-- <input type="text" class="form-control" name = "gender" placeholder="${user.gender }"> --%>
										</div>
									</div>
								</div>
								
								<!-- 주소 -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>주소</label>
											<!-- <textarea style="height:100px;" class="form-control" placeholder="소개말"></textarea> -->
											<input type="text" class="form-control" readonly name = "exAddr" value = "${user.address }" placeholder="${user.address }">
										</div>
									</div>
								</div>
								
								<!-- 변경할 주소 -->
								<div class = "row">
									<div class = "col-md-4">
										<div class = "form-group">
											<label>변경할 주소</label>
											<input type = "text" id = "postCode" name = "postCode" placeholder = "우편번호">
										</div>
									</div>
									<div class = "col-md-4" style = "left : 17px; top : 22px;">
										<div class = "form-group">
											<label></label>
											<input class="btn btn-outline-dark mt-auto" type = "button" onclick = "findPostCode()" value = "우편번호 찾기">
										</div>
									</div>
								</div>
								
								<!-- 주소 검색 -->
								<div class = "row">
									<div class = "col-md-3">
										<div class = "form-group">
											<div class="make-flex">
												<div>
													<input type = "text" id = "roadAddr" name = "roadAddr" placeholder = "도로명 주소" readonly>
													<input type = "text" id = "bunAddr" name = "bunAddr" placeholder = "지번 주소" readonly>
													<span id = "guide" style = "color:#999; display:none"></span>
												</div>
												<br>
												<div>
													<input type = "text" id = "detailAddr" name = "detailAddr" placeholder = "상세 주소" maxlength="40">
													<input type = "text" id = "extraAddr" name = "extraAddr" placeholder = "참고 항목" readonly>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<!-- 연락처 -->
								<div class="row">
								
									<div class="col-md-6">
										<div class="form-group">
											<label>연락처</label>
											<!-- <textarea style="height:100px;" class="form-control" placeholder="소개말"></textarea> -->
											<input type="text" class="form-control" name = "exPhone" value = "${user.phone }" readonly placeholder="${user.phone }">
										</div>
									</div>
									
									<div class="col-md-3">
										<div class="form-group">
											<label>변경할 연락처</label>
											<select name = "localPhoneNumber" class = "form-control">
												<option value = "010">010</option>
												<option value = "053">053</option>
											</select>
										</div>
									</div>
									<div class = "col-md-3">
										<div class = "form-group">
											<label></label>
											<input type = "number" name = "phoneNumber1" id = "phoneNumber1" class = "form-control" maxlength = "4" placeholder= "숫자 4자리" oninput = "numberLength(this);">
										</div>
									</div>
									<div class = "col-md-3">
										<div class = "form-group">
											<label></label>
											<input type = "number" name = "phoneNumber2" id = "phoneNumber2" class = "form-control" maxlength = "4" placeholder = "숫자 4자리" oninput = "numberLength(this);">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<!-- /box_general-->
					<div class="row">
					
						<!-- 비밀번호 박스 -->
						<div class="col-md-6">
							<div class="box_general padding_bottom">
								<div class="header_box version_2">
									<h2><i class="fa fa-lock"></i>비밀번호 변경</h2>
								</div>
								<!-- <div class="form-group">
									<label>현재 비밀번호</label> -->
									<input class="form-control" type="hidden" name = "exPwd" value = "${user.password }">
								<!-- </div> -->
								<div class="form-group">
									<label>새로운 비밀번호</label>
									<input class="form-control" type="password" maxlength = "20" id = "mPwd" name = "mPwd">
								</div>
								<div class="form-group">
									<label>새 비밀번호 확인</label>
									<button type = "button" onclick="checkThePwd()" class="btn_1 gray approve" value = "unChecked" id = "pwdCheck" name = "pwdCheck">
										<i class="fa fa-fw fa-check-circle-o"></i>일치 여부 확인
									</button>
									<input class="form-control" type="password" maxlength = "20" id = "iPwd" name = "iPwd">
								</div>
								<div class="form-group">
									<button type = "button" onclick="randomPassword()" class="btn_1 gray approve">
										<i class="fa fa-fw fa-check-circle-o"></i>귀찮아? 귀찮으면 눌러!
									</button>
									<input type = "hidden" name = "randomPwd" id = "randomPwd">
								</div>
							</div>
						</div>
						
						<!-- 이메일 박스 -->
						<div class="col-md-6">
							<div class="box_general padding_bottom">
							
								<div class="header_box version_2">
									<h2><i class="fa fa-envelope"></i>이메일 변경</h2>
								</div>
								
								<div class="form-group">
									<label>현재 이메일</label>
									<input class="form-control" name="old_email" id="old_email" value = "${user.email }" readonly placeholder = "${user.email }">
								</div>
								
								<div class = "row">
									<div class = "col-md-6">
										<div class="form-group">
											<label>새로운 이메일</label>
											<input class="form-control" name="new_email" id="new_email" type="text" maxlength="30">
										</div>
									</div>
									<div class = "col-md-6">
										<div class = "form-group">
											<label></label>
											<select name = "localEmail" class = "form-control">
												<option>이메일 선택</option>
												<option value = "@naver.com">naver.com</option>
												<option value = "@gmail.com">gmail.com</option>
												<option value = "@daum.net">daum.net</option>
												<option value = "@nate.net">nate.net</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					
					</form>
				
					<p><button type = "submit" onclick = "submitBtn()" class="btn_1 medium">저장</button></p>
					
				</div>
			  
			</div>
		
		
		    <footer class="sticky-footer">
		      <div class="container">
		        <div class="text-center">
		          <small>Copyright © UDEMA 2018</small>
		        </div>
		      </div>
		    </footer>
		    
		    
		    
		    <!-- Scroll to Top Button 누르면 정상 작동은 하는데 무한 에러남. 그래서 주석처리했고 script도 다 뺌-->
		   <!--  <a class="scroll-to-top rounded" href="#page-top">
		      <i class="fa fa-angle-up"></i>
		    </a> -->
		    
		    
		    <!-- Logout Modal-->
		    <!-- 
		    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		      <div class="modal-dialog" role="document">
		        <div class="modal-content">
		          <div class="modal-header">
		            <h5 class="modal-title" id="exampleModalLabel">정말로 로그아웃 하시겠습니까?</h5>
		            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		              <span aria-hidden="true">×</span>
		            </button>
		          </div>
		          <div class="modal-body">로그아웃 하시려면 '로그아웃'을 클릭해 주십시오.</div>
		          <div class="modal-footer">
		            <a class="btn btn-primary" href="login.html">로그아웃</a>
		            <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
		          </div>
		        </div>
		      </div>
		    </div>
    		 -->
   		</c:when>
   		
		<c:otherwise>
			<body onload = "errorPage()"></body>
		</c:otherwise>
		
	</c:choose>

</body>
</html>