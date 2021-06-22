<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.wrap {
	margin-top: 50px;
}

.row2 {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: nowrap;
	margin-right: -15px;
	margin-left: -15px;
	justify-content: space-evenly;
	/* flex-direction: row; */
}
</style>

<script>
	// 관리자 이외에 접근 시 에러 페이지로 이동
	function errorPage() {

		location.href = "errorPage.do";
	}
</script>

<c:choose>
	<c:when test="${id eq 'admin'}">
		<main>
			<section id="hero_in" class="general">
				<div class="wrapper">
				<!-- <img class = "image-set" src = "https://images.pexels.com/photos/261719/pexels-photo-261719.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"> -->
					<div class="container">
						<h1 class="fadeInUp">
							<span></span>관리자 페이지
						</h1>
					</div>
				</div>
			</section>
			<!--/hero_in-->

			<div align="center" class="container margin_60_35">
				<div class="main_title_2">
					<span><em></em></span>
					<h2>관리자</h2>
					<p>.</p>
				</div>
				<div class="row2">
					<div class="col-lg-4 col-md-6">
						<a class="box_topic" href="adminClassList.do"> <span><i class="pe-7s-notebook"></i></span>
							<h3>스터디모임 관리</h3>
							<p>스터디모임조회/수정/삭제</p>
						</a>
					</div>
					<div class="col-lg-4 col-md-6">
						<a class="box_topic" href="userListPaging.do"> <i class="pe-7s-study"></i>
							<h3>회원 관리</h3>
							<p>회원 조회/수정/삭제</p>
						</a>
					</div>

				</div>
				<!--/row-->
			</div>
			<!--/row-->
		</main>
	</c:when>
	<c:otherwise>
		<body onload="errorPage()"></body>
	</c:otherwise>
</c:choose>
