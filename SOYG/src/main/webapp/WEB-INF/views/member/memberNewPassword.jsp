<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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


.step {
    height: 600px;
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    margin-top : 83px;
}

</style>

<script>
	function checkThePwd(){
		
		if(mPwd.value === "" && iPwd.value === ""){
			
			alert('변경할 비밀번호가 입력되어 있지 않습니다.');
			mPwd.focus();
			return;
			
		} else if (mPwd.value != iPwd.value){
			
			alert('비밀번호가 일치하지 않습니다.');
			iPwd.focus();
			return;
			
		} else {
			
			alert('일치합니다.');
			pwdCheck.value = "checked";
			console.log("체크 박스 변경 후 값 : " + pwdCheck.value);
			
		}
		
	}
	
	function submitBtn(){
		
		if(mPwd.value === ""){
			
			alert('변경할 비밀번호를 입력해 주세요!');
			
			mPwd.focus();
			return;
			
		} else if(iPwd.value === ""){
			
			alert('비밀번호를 한번 더 입력해 주세요!');
			
			iPwd.focus();
			return;
			
		} else if(pwdCheck.value == "unChecked"){
			
			alert('비밀번호 일치 여부를 확인해 주세요.');
			
			iPwd.focus();
			return;
			
		} else if (mPwd.value != iPwd.value) {
			
			alert('입력하신 비밀번호가 기존과 다르게 바뀌었습니다. 다시 한번 확인해 주세요.');
			
			pwdCheck.value = "unChecked";
			iPwd.focus();
			return;
			
		} else {
			
			alert("비밀번호가 수정되었습니다.");
			frm.submit();
		}
			
	}
</script>

<div class="width">
	<div id="form_container" class="clearfix">
				
		<form name = "frm" action="passRedefine.do" method="post">
		
			<input type = "hidden" name = "userId" value = "${user.userId }">
		
			<div class="step">
			
				<h3 class="main_question">
					<strong style="text-align: left">비밀번호 재설정 페이지</strong>
				</h3>

				<div class="form-group">
					<input type="password" name="mPwd" id="mPwd" class="form-control" placeholder = "새 비밀번호를 입력해 주세요" maxlength = "15">
				</div>
				
				<div class="form-group">
					<input type="password" id="iPwd" class="form-control" placeholder = "비밀번호를 확인해 주세요" maxlength = "15">
				</div>
				
				<button type = "button" onclick="checkThePwd()" class="btn_1 gray approve" value = "unChecked" id = "pwdCheck">
					<i class="fa fa-fw fa-check-circle-o"></i>일치 여부 확인
				</button>
				
				<button type="button" onclick = "submitBtn()">확인!</button>
				
			</div>
			
		</form>
				
	</div>
</div>