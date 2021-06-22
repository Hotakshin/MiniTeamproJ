<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.width {
	width: 600px;
	text-align: center;
	margin: auto;
}

button {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

button:hover {
	background: #fff;
	color: #1AAB8A;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.modify-flex {
	display: flex;
}
</style>
<!--  카카오 ADDRESS api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function() {
		$('#passcheck').click(function() {
			if ($('#pastPassword').val() == "") {
				alert('현재비밀번호를 입력해주세요.');
				$('#pastPassword').focus();
				return;
			}
			if ($('#password').val() == "" || $('#password2').val() == "") {
				alert('변경할 비밀번호를 입력해주세요.');
				$('#password').focus();
				return;
			}
			if ($('#password2').val() != $('#password').val()) {
				alert('바꾸실 비밀번호가 다릅니다. 다시한번 확인해주세요.');
				$('#password').val("");
				$('#password2').val("");
				$('#password').focus();
				return;
			}
			$.ajax({
				url : 'updatePassword.do',
				data : {
					pastPassword : $('#pastPassword').val(),
					password : $('#password').val(),
				},
				type : 'post',
				success : function(data) {
					console.log(data);
					if (data == 1) {
						location.href = "infomationUpdatepage.do";
						alert('비밀번호변경 완료!');
					} else {
						alert('현재비밀번호가 다릅니다.');
						$('#password').val("");
						$('#password2').val("");
						$('pastPassword').val("");
					}

				},
				error : function(err) {
					console.log(err);
				}
			});
		});
	});
	function addressCheck() {
		if (updateAddress.detailAddress.value == "") {
			alert("상세주소를 입력하세요.");
			updateAddress.detailAddress.focus();
			return false;
		}
		if (updateAddress.roadAddress.value == "") {
			alert("주소찾기를 눌러 주소를 추가해주세요.");
			return false;
		}
		updateAddress.submit();
	}
	
	// 카카오 E-mail API
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("roadAddress").value = roadAddr;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
<div class="width">
	<div id="form_container" class="clearfix">
		<figure>
			<a href="index.html"><img src="img/logo.png" width="149"
				height="42" alt=""></a>
		</figure>
		<div id="wizard_container">
			<div id="top-wizard">
				<div id="progressbar"></div>
			</div>
			<!-- /top-wizard -->
			<div id="middle-wizard">
				<div class="step">
					<div id="intro">
						<figure>
							<img src="img/wizard_intro_icon.svg" alt="">
						</figure>
					</div>
				</div>
				<form id="updateInfo" action="updateInfo.do" method="post">
					<div class="step">
						<h3 class="main_question">
							<strong style="text-align: left">기본정보변경</strong>
						</h3>

						<div class="form-group">
							<input type="text" name="userId" id="userId"
								class="form-control required" value="${info.userId }" readonly>
						</div>
						<div class="form-group">
							<input type="text" name="name" id="name"
								class="form-control required" value="${info.name }" readonly>
						</div>
						<div class="form-group">
							<input type="email" name="email" id="email"
								class="form-control required" value="${info.email }"
								placeholder="Your Email">
						</div>
						<div class="form-group">
							<input type="text" name="phone" id="phone" class="form-control"
								value="${info.phone }" placeholder="Your Telephone">
						</div>
						<div class="form-group">
							<input type="date" name="birth" id="birth" class="form-control"
								value="${info.birth }" placeholder="BirthDay">
						</div>
						<button type="submit" name="process" class="submit">정보수정하기!</button>

					</div>
				</form>
				<hr>
				<form id="updateAddress" action="updateAddress.do" method="post">
					<div class="form-group">
						<input type="text" class="form-control required"
							value="${info.address }" readonly>
					</div>
					<div class="modify-flex">
						<div class="form-group" style="width: 90%">
							<input type="text" style="float: left" name="postcode"
								id="postcode" class="form-control required" placeholder="우편주소"
								readonly>
						</div>
						<div>
							<input style="height: 35px;" type="button"
								onclick="execDaumPostcode()" value="주소찾기">
						</div>
					</div>
					<div class="form-group">
						<input type="text" name="roadAddress" id="roadAddress"
							class="form-control required" placeholder="도로명주소" readonly>
					</div>
					<span id="guide" style="color: #999; display: none"></span>
					<div class="form-group">
						<input type="text" name="extraAddress" id="extraAddress"
							class="form-control required" placeholder="참고주소" readonly>
					</div>
					<div class="form-group">
						<input type="text" name="detailAddress" id="detailAddress"
							class="form-control required" placeholder="상세주소를 입력해주세요">
					</div>
					&nbsp; &nbsp; &nbsp;
					<button type="button" onclick="addressCheck()" class="submit">주소수정하기!</button>
					<hr>
				</form>
				<!-- /step-->
				<form>
					<div class="step">
						<h3 class="main_question">
							<strong style="text-align: left">비밀번호 변경</strong>
						</h3>
						<div class="form-group">
							<input type="password" name="pastPassword" id="pastPassword"
								class="form-control required" placeholder="현재비밀번호를 입력하세요.">
						</div>
						<div class="form-group">
							<input type="password" name="password" id="password"
								class="form-control required" placeholder="새로운 비밀번호를 입력하세요.">
						</div>
						<div class="form-group">
							<input type="password" name="password2" id="password2"
								class="form-control required" placeholder="새로운 비밀번호를 한번더 입력하세요.">
						</div>
					</div>
					<div id="bottom-wizard">
						<button type="button" name="passcheck" id="passcheck"
							class="submit">비밀번호변경!</button>
						<hr>
					</div>
				</form>
				<!-- /step-->
			</div>
			<div style="text-align: right; margin-bottom: 25px;" >
				<a href="memberDeletepage.do"><font size="2px" color="gray">회원탈퇴</font></a>
			</div>

		</div>
	</div>
</div>