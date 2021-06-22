<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<x:formatDate value='${classes.start_date}' pattern='yyyy-MM-dd' var="start_date"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<style>
.wrap {
	margin-inline: 10%;
}
.course_list{
	strong: strong;
}
.textarea{
	width:500px;
	height: 200px;
}
</style>

<script>

	$(function () {
		CKEDITOR.replace('imageArea', {
			filebrowserUploadUrl: '${pageContext.request.contextPath}/fileUpload',
			height: '500px',
			width: '70%'
		});
	});
</script>
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
<form name="frm" method="post" action="adminClassUpdate.do">
<input type="hidden" name="imageArea" value="${classes.class_image }">
<div class="wrap">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="admin.do">관리자페이지</a></li>
		<li class="breadcrumb-item"><a href="adminClassList.do">스터디 리스트</a></li>
		<li class="breadcrumb-item active">class수정</li>
	</ol>
	<div class="box_general padding_bottom">
		<div class="header_box version_2">
			<h2 class="d-inline-block">Study code - ${classes.class_code}</h2>
		</div>
		<h6>[이미지]</h6>
		<textarea id="imageArea" name="imageArea" rows="300" cols="300">${classes.class_image }</textarea>				
		<div class="list_general">
			<ul>
				<li>

					<h4>${classes.class_name }
						<i name="class_startchk" class="pending">${classes.class_startchk }</i>
					</h4>
					<ul class="course_list">
						<li><h6>스터디코드</h6><input name="class_code" value="${classes.class_code }" readonly="readonly"></li>
						<li><h6>스터디명</h6><input name="class_name" value="${classes.class_name }"></li>
						<li><h6>분야분류</h6><input name="field_code" value="${classes.field_code }"></li>
						<li><h6>지역코드</h6><input name="loc_code" value="${classes.loc_code }"></li>
					</ul>
					<hr>
					<ul class="course_list">
						<li><h6>시작일</h6><input type="date" name="start_date" value="${start_date}"></li>
						<li><h6>주중/주말</h6>
							<input type="radio" ID = "rad" name="weekdays_chk" value="W" <c:if test="${classes.weekdays_chk eq 'W' }" >checked</c:if> >주중
							<input type="radio" ID = "rad" name="weekdays_chk" value="E" <c:if test="${classes.weekdays_chk eq 'E' }" >checked</c:if> >주말
						</li>
						<li><h6>스터디 시간</h6><input  name="class_time" value="${classes.class_time }"></li>
						<li><h6>활성/비활성</h6>
							<input type="radio" name="class_active" value="A" <c:if test="${classes.class_active eq 'A' }" >checked</c:if> >활성
							<input type="radio" name="class_active" value="I" <c:if test="${classes.class_active eq 'I' }" >checked</c:if> >비활성
						</li>
						<li><h6>시작여부</h6>
							<input type="radio" name="class_startchk" value="R" <c:if test="${classes.class_startchk  eq 'R' }" >checked</c:if>>모집중
							<input type="radio" name="class_startchk" value="O" <c:if test="${classes.class_startchk  eq 'O' }" >checked</c:if>>진행중
							<input type="radio" name="class_startchk"value="E" <c:if test="${classes.class_startchk  eq 'E' }" >checked</c:if>>모집종료
						</li>
						<li><h6>정원</h6><input name="class_personnel" value="${classes.class_personnel }"></li>
					</ul>
					<hr>
					<h6>스터디 설명</h6>
					<p><textarea name="class_info" class="textarea">${classes.class_info }</textarea></p>
					<ul align="right" class="buttons">
						<li><button onclick="updateClass()" class="btn_1 gray approve"><i
								class="fa fa-fw fa-check-circle-o"></i>수정완료</button></li>
						<li><button  onclick="deleteCheck('${classes.class_code }')" class="btn_1 gray delete"> 삭제</button></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>
</form>
	</c:when>
	<c:otherwise>
		<body onload="errorPage()"></body>
	</c:otherwise>
</c:choose>
		
<!-- 수정/삭제 -->
<script>
// 관리자 이외에 접근 시 에러 페이지로 이동
function errorPage() {

	location.href = "errorPage.do";
}
function updateClass(class_code){
	var week = $('input[name=weekdays_chk]:checked').val();
	var active = $('input[class_active]').val();
	var startck = $('input[class_startchk]').val();
	
	frm.weekdays_chk.value = week;
	frm.class_active.value = active;
	frm.class_startchk.value = startck;
	
	
	var value = CKEDITOR.instances['imageArea'].getData();
	${classes.class_image} = CKEDITOR.instances.imageArea.getData();
	System.out.println(class_image);
	
	frm.submit();
}

function deleteCheck(class_code){
	if(confirm("삭제하시겠습니까?") == true){
		location.href = "adminClassDelete.do?class_code=" + class_code;
	}else {
		return false;
	}
}



</script> 