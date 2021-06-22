<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function LoginCheck() {
		if (frm.userId.value == "") {
			alert("아이디를 입력하세요");
			frm.userId.focus();
			return false;
		}
		if (frm.password.value == "") {
			alert("비밀번호를 입력하세요");
			frm.password.focus();
			return false;
		}
		frm.submit();
	}
</script>
<div id="login_bg">

	<div id="login" style="margin-top: 83px;">
		<aside>
			<form id="frm" action="memberLogin.do" method="post">
				<ul style="text-align: center; ">
					<li onclick="kakaoLogin();"><a id="custom-login-btn"
						href="javascript:loginWithKakao()"> <img
							src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
							width="222" />
					</a></li>
				</ul>
				<div class="divider">
					<span>Or</span>
				</div>
				<div class="form-group">
					<span class="input"> <input class="input_field" type="text"
						autocomplete="off" name="userId" id="userId"> <label
						class="input_label"> <span class="input__label-content">아이디</span>
					</label>
					</span> <span class="input"> <input class="input_field"
						type="password" autocomplete="new-password" name="password" id="password">
						<label class="input_label"> <span
							class="input__label-content">비밀번호</span>
					</label>
					</span> <small><a href="memberPassFinder.do">비밀번호를 잊어먹었니?</a></small>
				</div>
				<button type="button" onclick="LoginCheck()" class="btn_1 rounded full-width add_top_60">시작하기!</button>
				<div class="text-center add_top_10">
					아이디가없어!? <strong><a href="memberJoin.do">그럼만들어!</a></strong>
				</div>
			</form>
			<div class="copy">© 2021 hotakshin</div>
		</aside>
	</div>
	<!-- /login -->
</div>
