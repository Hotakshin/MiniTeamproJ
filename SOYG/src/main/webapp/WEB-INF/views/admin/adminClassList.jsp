<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
.wrap {
	margin-top: 20px;
}
</style>
<script>
function select(class_code){
	location.href = "adminClassSelect.do?class_code=" + class_code;
	}
function goPage(page){
	
	location.href = "adminClassList.do?page=" + page;
}	
// 관리자 이외에 접근 시 에러 페이지로 이동
function errorPage() {

	location.href = "errorPage.do";
}
//검색기능 - 스터디명
window.onload = function(){
	$("#keyword").keyup(function(){
		var k = $(this).val();
		$("#dataTable > tfoot > tr").hide();
		var temp = $("#dataTable > tfoot > tr > td:nth-child(6n+4):contains('" + k + "')");
		
		$(temp).parent().show();
	});
};


</script>
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

<!-- 스터디 전제조회 테이블 -->
<body>
	<div align="center" class="wrap">
		<div>
			<div class="content-wrapper">
				<div class="container-fluid">
					<!-- 상단바-->
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="admin.do">관리자페이지</a></li>
						<li class="breadcrumb-item active">스터디 리스트</li>
					</ol>
					<c:choose>
						<c:when test="${id eq 'admin'}">
							<!-- 테이블 데이터-->
							<div class="card mb-3">
								<div class="card-header">
									<i class="fa fa-table"></i> 스터디 전체 조회
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<div id="dataTable_wrapper"
											class="dataTables_wrapper container-fluid dt-bootstrap4">
											<div class="row">
												<div class="col-sm-12 col-md-6">
													<div id="dataTable_filter" class="dataTables_filter">

													</div>
													<!-- 검색기능 -->
													<form action="adminClassSearch.do">
														<select id="searchType" name="searchType"
															class="form-fontrol form-control-sm">
															<option value="option_name">스터디명</option>
															<option value="option_city">지역명</option>
															<option value="option_field">분야별</option>
														</select> <input name="searchKeyword" placeholder="검색어 입력"
															class="form-fontrol form-control-sm"><input
															type="submit" value="검색">
													</form>
												</div>
												<table class="table table-bordered" id="dataTable"
													width="100%" role="grid" aria-describedby="dataTable_info"
													cellspacing="0">
													<thead>
														<tr>
															<th>스터디 코드</th>
															<th>지역명</th>
															<th>분야분류</th>
															<th>스터디명</th>
															<th>활성/비활성 여부</th>
															<th>시작여부</th>
														</tr>
													</thead>
													<tfoot>
														<c:forEach var="clas" items="${classes }">
															<tr onclick="select(${clas.class_code })">
																<td>${clas.class_code }</td>
																<td>${clas.city }</td>
																<td>${clas.field_code }</td>
																<td>${clas.class_name }</td>
																<td>${clas.class_active }</td>
																<td>${clas.class_startchk }</td>
															</tr>
														</c:forEach>
													</tfoot>
												</table>
											</div>
											<!-- 페이징처리 -->
											<jsp:include page="../common/paging.jsp" flush="true">
												<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
												<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
												<jsp:param name="startPageNo" value="${paging.startPageNo}" />
												<jsp:param name="pageNo" value="${paging.pageNo}" />
												<jsp:param name="endPageNo" value="${paging.endPageNo}" />
												<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
												<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
											</jsp:include>
										</div>
									</div>
								</div>
								<!-- /tables-->
							</div>
							<!-- /container-fluid-->
				</div>
				<!-- /container-wrapper-->
			</div>
		</div>
	</div>
	</c:when>
	<c:otherwise>
		<body onload="errorPage()"></body>
	</c:otherwise>
	</c:choose>
</body>
</html>