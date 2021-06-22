<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.width {
	width: 600px;
	text-align: center;
	margin: auto;
	margin-top: 200px;
	margin-bottom: 100px;
}

button {
	background: black;
	color: white;
	border: none;
	position: relative;
	height: 40px;
	font-size: 1.0em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}
</style>

<div class="width">
	<form>
		<div class="step">
			<h3 class="main_question">
				<strong style="text-align: left">회원 탈퇴</strong>
			</h3>
			<div class="form-group">
				<input type="password" name="Password" id="Password"
					class="form-control required" placeholder="현재비밀번호를 입력하세요.">
			</div>
		</div>
		<div id="bottom-wizard">
			<button type="button" name="passcheck" id="passcheck" class="submit">회원
				탈퇴하기</button>
			<hr>
		</div>
	</form>
</div>
	
<script>
	$(function() {
		$('#passcheck').click(function() {
			if ($('#Password').val() == "") {
				alert('비밀번호를 입력하세요.');
				$('#Password').focus();
				return;
			}
			msg = "정말로 회원 탈퇴 하시겠습니까? 삭제하시면 복구 할 수 없습니다.";
			if(confirm(msg) != 0) {
				$.ajax({
					url : 'memberDelete.do',
					data : {
						password : $('#Password').val()
					},
					type : 'post',
					success : function(data) {
						console.log(data);
						if (data == 1) {
							location.href = "home.do";
							alert('회원탈퇴가 완료되었습니다.');
						}else {
							alert('현재비밀번호가 다릅니다.');
							$('#Password').val("");
						}
						
					},
					error : function(err) {
						console.log(err);
					}
				});
			};
			
		});
	});
</script>