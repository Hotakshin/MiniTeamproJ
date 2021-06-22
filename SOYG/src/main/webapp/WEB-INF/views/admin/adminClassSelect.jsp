<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/fmt_rt"%>
<x:formatDate value='${classes.start_date}' pattern='yyyy-MM-dd'
	var="start_date" />

<style>
.wrap {
	margin-inline: 10%;
}

.course_list {
	strong: strong;
}

.image {
	width: 60%;
	margin-bottom: 50px;
}
</style>
<c:choose>
	<c:when test = "${id eq 'admin'}">
<section id="hero_in" class="general">
	<div class="wrapper">
		<div class="container">
			<h1 class="fadeInUp">
				<span></span>스터디 관리 페이지
			</h1>
		</div>
	</div>
</section>
<!--/hero_in-->
<!--class한건 조회-->
<div class="wrap">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="admin.do">관리자페이지</a></li>
		<li class="breadcrumb-item"><a href="adminClassList.do">스터디
				리스트</a></li>
		<li class="breadcrumb-item active">스터디 조회</li>
	</ol>
	<div class="box_general padding_bottom">
		<div class="header_box version_2">
			<h2 class="d-inline-block">class code - ${classes.class_code}</h2>
		</div>
		<div class="list_general">
			<ul>
				<h4>${classes.class_name }
					<i class="pending">${classes.class_startchk }</i>
				</h4>
				<li><h6>[이미지]</h6> <img class="image" src="<spring:url value='/resources/classImage/${classes.class_image }'/>">
				
					<ul class="course_list">
					<li><h6>[스터디코드] ${classes.class_code }</h6></li>
					<li><h6>[스터디명] ${classes.class_name }</h6></li>
					<li><h6>[분야분류] ${classes.field_code }</h6></li>
					<li><h6>[지역코드] ${classes.loc_code }</h6></li>
					<li><h6>[지역명] ${classes.city }</h6></li>
					<li><h6>[스터디장] ${classes.captain }</h6></li>
				</ul>
				<hr>
				<ul class="course_list">
					<li><h6>[시작일]${start_date }</h6></li>
					<li><h6>[스터디 시간] ${classes.class_time }</h6></li>
					<li><h6>[정원]${classes.class_personnel }</h6></li>
					<li><h6>[주중/주말]</h6> <input type="radio" name="weekdays_chk"
						value="${classes.weekdays_chk }"
						<c:if test="${classes.weekdays_chk eq 'W' }" >checked</c:if>>주중
						<input type="radio" name="weekdays_chk"
						value="${classes.weekdays_chk }"
						<c:if test="${classes.weekdays_chk eq 'E' }" >checked</c:if>>주말
					</li>
					<li><h6>[활성/비활성]</h6> <input type="radio" name="class_active"
						value="${classes.class_active }"
						<c:if test="${classes.class_active eq 'A' }" >checked</c:if>>활성
						<input type="radio" name="class_active"
						value="${classes.class_active }"
						<c:if test="${classes.class_active eq 'I' }" >checked</c:if>>비활성
					</li>
					<li><h6>[시작여부]</h6> <input type="radio" name="class_startchk"
						value="${classes.class_startchk }"
						<c:if test="${classes.class_startchk  eq 'R' }" >checked</c:if>>모집중
						<input type="radio" name="class_startchk"
						value="${classes.class_startchk }"
						<c:if test="${classes.class_startchk  eq 'O' }" >checked</c:if>>진행중
						<input type="radio" name="class_startchk"
						value="${classes.class_startchk }"
						<c:if test="${classes.class_startchk  eq 'E' }" >checked</c:if>>모집종료
					</li>
				</ul>
				<hr>
				<h6>[스터디 설명]</h6>
				<p>${classes.class_info }</p>
				<ul align="right" class="buttons">
					<li><a onclick="select(${classes.class_code })"
						class="btn_1 gray approve"><i
							class="fa fa-fw fa-check-circle-o"></i> 수정하기</a></li>
					<li><a onclick="deleteCheck('${classes.class_code }')"
						class="btn_1 gray delete"><i
							class="fa fa-fw fa-times-circle-o"></i> 삭제</a></li>
				</ul>
				</li>
				

			
			</ul>
		</div>
	</div>
</div>
	</c:when>
	<c:otherwise>
	<body onload="errorPage()"></body>
	</c:otherwise>
</c:choose>
		
<script>
function select(class_code){
	location.href = "adminClassUpdateView.do?class_code=" + class_code;
	}
function deleteCheck(class_code){
	if(confirm("삭제하시겠습니까?") == true){
		location.href = "adminClassDelete.do?class_code=" + class_code;
	} else {
		return false;
	}
}
// 관리자 이외에 접근 시 에러 페이지로 이동
function errorPage() {

	location.href = "errorPage.do";
}
</script>