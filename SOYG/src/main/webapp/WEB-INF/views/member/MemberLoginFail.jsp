<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.failh3 {
	margin-top: 200px;
}

.bigdiv {
	text-align: center;
	margin-bottom: 100px;
}

.marjina {
	margin-left: 100px;
}
.join {
	margin-bottom: 15px;
}
</style>
<div>
	<div class="bigdiv">
		<h3 class="failh3">로그인에 실패했습니다.</h3>
		<div class="join">
			<p>아이디 및 비밀번호가 일치하지 않습니다.</p>
			<a href="memberJoin.do">아직 회원이 아니시라면 여기를 눌러 회원가입!</a>
		</div>

		<a href="memberLoginpage.do">다시 로그인하러가기</a> <a href="home.do"
			class="marjina">홈으로</a>

	</div>
</div>