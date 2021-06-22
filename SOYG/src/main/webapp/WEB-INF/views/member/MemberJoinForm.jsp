<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
.blank {
	margin: auto;
	padding-top: 100px;
	padding-bottom: 30px;
	width: 600px;
	text-align: center;
}
.marjin {
	margin-top: 25px;
	margin-bottom: 25px;
}

.myButton {
	box-shadow: 0px 0px 7px 2px #9fb4f2;
	background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	background-color:#7892c2;
	border-radius:10px;
	border:2px solid #4e6096;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:14px;
	padding:10px 22px;
	text-decoration:none;
	text-shadow:0px -1px 0px #283966;
}
.myButton:hover {
	background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	background-color:#476e9e;
}
.myButton:active {
	position:relative;
	top:1px;
}
.myButton2 {
	box-shadow:inset 0px 0px 7px 2px #9fb4f2;
	background-color:#d42222;
	border-radius:10px;
	border:1px solid #4e6096;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:14px;
	padding:10px 22px;
	text-decoration:none;
	text-shadow:0px -1px 0px #283966;
	margin-left: 50px;
}
.myButton2:hover {
	background-color:#3b1212;
}
.myButton2:active {
	position:relative;
	top:1px;
}
.myButton3 {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:14px;
	font-weight:bold;
	padding:6px 17px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton3:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color:#f6f6f6;
}
.myButton3:active {
	position:relative;
	top:1px;
}

        
        

        
        
</style>
<script>
	//아이디 중복체크
	$(function() {
		$('#idCheck').click(function() {
			if ($('#userId').val() == "") {
				alert('아이디를 입력하세요.');
				$('#userId').focus();
				return;
			}
			$.ajax({
				url : 'UserIdCheck.do',
				data : {
					userId : $('#userId').val()
				},
				type : 'post',
				success : function(data) {
					console.log(data);
					if (data == 1) {
						alert('아이디가 존재합니다. 다른 아이디를 입력하세요.');
						$('#userId').val("");
						$('#userId').focus();
					} else {
						alert('사용가능한 아이디 입니다.');
						$('#idCheck').val('checked');
						$('#password').focus();
					}
				},
				error : function(err) {
					console.log(err);
					console.log("중복검사 에러");
				}
			});
		});
	});
	$(function() {
		$('#passwordCheck').click(function() {
			if ($('#password').val() == "" || $('#password2').val() == "") {
				alert('비밀번호를 입력하세요.');
				$('#password').focus();
				return;
			}
			if ($('#password').val() != $('#password2').val()) {
				alert('입력한 비밀번호가 다릅니다. 다시 확인해주세요.');
				$('#password2').val("");
				$('#password2').focus();
			} else {
				alert('비밀번호가 일치합니다!');
				$('#passwordCheck').val('checked');
			}
		});

		// 속성 탐색 선택자
		// 입력이 변경되었을때 체크값을 unChecked로 변경

		$('#memberId').change(function() {
			$('#idCheck').val('unChecked');
		});

		//'input[type=password]' 를 입력한이유는
		// password 입력을 받는곳이 2개가 있기때문에 2개 중에 체인지가 발생하면 이벤트를 실행시키기 위해서이다.//

		$('input[type=password]').change(function() {
			$('#passwordCheck').val('unChecked');
		});
	});

	// 회원가입 클릭시 빈칸입력 및 재확인
	function formCheck() {
		if (frm.userId.value == "") {
			alert("아이디를 입력하세요.");
			frm.userId.focus();
			return false;
		}
		if (frm.password.value == "") {
			alert("비밀번호를 입력하세요.");
			frm.password.focus();
			return false;
		}
		if (frm.password2.value == "") {
			alert("비밀번호를 재입력하세요.");
			frm.password.focus();
			return false;
		}
		if (frm.name.value == "") {
			alert("이름를 입력하세요.");
			frm.name.focus();
			return false;
		}
		if (frm.email.value == "") {
			alert("이메일를 입력하세요.");
			frm.email.focus();
			return false;
		}
		if (frm.detailAddress.value == "") {
			alert("상세주소를 입력하세요.");
			frm.detailAddress.focus();
			return false;
		}
		if (frm.roadAddress.value == "") {
			alert("주소찾기를 눌러 주소를 추가해주세요.");
			return false;
		}
		if(frm.phone.value =="") {
			alert("전화번호를 입력해주세요.");
			frm.phone.focus();
			return false;
		}
		if(frm.gender.value=="") {
			alert("성별 확인 해주세요.");
			frm.gender.focus();
		}
		if (frm.idCheck.value == 'unChecked') {
			alert("중복체크를 하세요.");
			frm.memberId.focus();
			return false;
		}

		if (frm.passwordCheck.value == 'unChecked') {
			alert("비밀번호 확인을 해주세요.");
			frm.password2.focus();
			return false;
		}
		frm.submit();
	}
	// 주소
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
	//비밀번호 실시간체크
	$(function() {
		var password = $('input[type=password]');
		var chkNotice = $('#chkNotice');
		var pswd = $('#password');
		var pswd2 = $('#password2');

		password.keyup(function() {
			if (pswd2.val() == "") {
				chkNotice.html('');
			} else {
				if (pswd2.val() != pswd.val()) {
					chkNotice.html('비밀번호 일치하지 않음<br><br>').attr('color',
							'#f82a2aa3');
				} else {
					chkNotice.html('비밀번호 일치함<br><br>').attr('color',
							'#199894b3');
				}
			
			}

		});

	});
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="blank">
<h1 style="margin-top: 30px; margin-bottom: 30px"> 회원가입을 위한 페이지YE요.</h1>
	<form id="frm" action="memberInsert.do" method="post">
		<div>
			<div style="display: flex;" >
				<input type="text" id="userId" name="userId"
					class="form-control required" style="width: 500px" placeholder="사용하실 아이디를 적어주세요.">
				<button class="myButton3" style="margin: auto; " type="button" id="idCheck" value="unChecked">중복체크</button>
			</div>
			<div>

				<input type="password" id="password" name="password"
					class="form-control required" style="width: 500px; margin-top: 50px;" placeholder="비밀번호를 입력해주세요.">
			</div>
			<div style="display: flex;">

				<input type="password" id="password2" name="password2"
					class="form-control required" style="width: 500px" placeholder="비밀번호를 다시 입력해주세요.">
				<button type="button" class="myButton3" id="passwordCheck" style="margin: auto;" value="unChecked">확인하기</button>
				
			</div>
			<div style="text-align: left">
			<font id="chkNotice" size="2"></font>
			</div>
			<div>

				<input type="text" id="name" name="name" style="margin-top: 50px;"
					class="form-control required" placeholder="이름을 입력해주세요.">
			</div>
			<div>

				<input type="email" id="email" name="email" style="margin-top: 50px;"
					class="form-control required" placeholder="이메일을 입력해주세요.">
			</div>
			<div>

				<input type="tel" id="phone" name="phone" style="margin-top: 50px;"
					class="form-control required" placeholder="핸드폰번호를 입력해주세요..">
			</div>
			<div>

				<input type="date" id="birth" name="birth" style="margin-top: 50px;"
					class="form-control required" placeholder="생년월일을 입력해주세요.">
			</div>
			<div class="marjin">
				남자 <input type="radio" id="gender" name="gender" value="male" style="margin-right: 50px;margin-left: 10px">
				<input type="radio" id="gender" name="gender" value="female" style="margin-right: 15px;">여자
			</div>
			<div>
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"
					class="form-control required"
					style="color: #8054c5; background-color: #ffd888;"> <input
					type="text" id="postcode" name="postcode" placeholder="우편번호"
					readonly class="form-control required"> <input type="text"
					id="roadAddress" name="roadAddress" placeholder="도로명주소" readonly
					class="form-control required"> <input type="text"
					id="extraAddress" name="extraAddress" placeholder="참고항목" readonly
					class="form-control required"> <input type="text"
					id="detailAddress" name="detailAddress" placeholder="상세주소"
					class="form-control required"> <span id="guide"
					style="color: #999; display: none"></span>
			</div>

			<div style="margin-top: 50px">
				<button type="button" class="myButton" onclick="formCheck()">회원가입</button>
				<button type="button" class="myButton2" onclick="location.href='home.do'">홈으로
				</button>
			</div>
		</div>
	</form>
</div>