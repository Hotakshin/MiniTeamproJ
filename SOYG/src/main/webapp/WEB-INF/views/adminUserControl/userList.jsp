<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.wrap {
	margin-top: 20px;
}

/* .user_list {
	display: flex;
	flex-direction: column;
	align-content: center;
	flex-wrap: wrap;
	align-items: center;
}

.id_select_window {
	padding: 20px;
}

.user_table {
	padding: 20px;
} */

/* .check_button {
	
	cursor: pointer;
}

.check_modal {
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	top: 0;
	left: 0;
	display: none;
}

.check_modal_content {
	width: 400px;
	height: 200px;
	background: #fff;
	border-radius: 10px;
	position: relative;
	top: 50%;
	left: 50%;
	margin-top: -100px;
	margin-left: -200px;
	text-align: center;
	box-sizing: border-box;
	padding: 74px 0;
	line-height: 23px;
	cursor: pointer;
} */
</style>

<title>회원 전체 목록</title>

<script>
	// https://webruden.tistory.com/107  ~~> 같은 페이지에서만 찾음 '하나 조회' 다시 작업
	window.onload = function() {
		$("#keyword").keyup(function() {
			var k = $(this).val();
			$("#dataTable > tbody > tr").hide();
			var temp = $("#dataTable > tbody > tr > td:nth-child(8n+7):contains('"+ k + "')");
			$(temp).parent().show();
		});
	};

	function userDelete(index) {

		if (confirm("삭제하면 되돌릴 수 없습니다. 계속하시겠습니까?")) {
            // 확인 버튼 클릭 시 동작
			if(confirm("진짜로 삭제합니까?")){
				
				alert('삭제했습니다.');
				
				let user = document.getElementById('userID' + index).value;

				$.ajax({
					url : 'userDelete.do',
					data : {
						'userID' : user
					},
					type : 'post',
					success : function(resp) {
	
						location.reload();
					},
					error : function(err) {
	
						console.log(err);
					}
				});
			}
			
        } else {
            // 취소 버튼 클릭 시 동작
            alert("동작을 취소했습니다.");
        }
		
	}
	
	function goPage(page){
		
		location.href = "userListPaging.do?page=" + page;
	}

	/* 모달창 실패
	$(function() {

		$(".check_button").click(function() {
			$(".check_modal").fadeIn();
		});

		$(".check_modal_content").click(function() {
			$(".check_modal").fadeOut();
		});

	}); 
	*/
	
	// 관리자 이외에 접근 시 에러 페이지로 이동
	function errorPage(){
		
		location.href = "errorPage.do";
	}
	
</script>

<section id="hero_in" class="general">
	<div class="wrapper">
		<div class="container">
			<h1 class="fadeInUp">
				<span></span>유저 관리 페이지
			</h1>
		</div>
	</div>
</section>

<c:choose>
	<c:when test="${id eq 'admin'}">

			<div class="wrap" align="center">
				<div>
					<div class="content-wrapper">
						<div class="container-fluid">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="admin.do">관리자 페이지</a></li>
								<li class="breadcrumb-item active">회원 리스트</li>
							</ol>
							<div class="card mb-3">
								<div class="card-header">
									<i class="fa fa-table"></i> 유저 조회 창
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<div id="dataTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
											<div class="row">
												<div class="col-sm-12 col-md-6">
													<div id="dataTable_filter" class="dataTables_filter">
														<label style="display: flex;">
															<input type="search" id="keyword" class="form-fontrol form-control-sm" placeholder="생년월일로 분류" aria-controls="dataTable">
														</label>
													</div>
												</div>
												<table id="dataTable" class="table table-bordered">
													<thead>
														<tr>
															<th>아이디</th>
															<!-- <th>비밀번호</th> -->
															<th>이름</th>
															<th>주소</th>
															<th>이메일</th>
															<th>성별</th>
															<th>연락처</th>
															<th>생년월일</th>
															<th>테이블기능</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="user" items="${users}" varStatus="status">
															<tr>
																<td>
																	<a href="userSelect.do?userID=${user.userID }" class="userInfo">${user.userID }</a>
																	<input type="hidden" id="userID${status.index }" value="${user.userID }">
																</td>
																<%-- <td>${user.password }</td> --%>
																<td>${user.name }</td>
																<td>${user.address }</td>
																<td>${user.email }</td>
																<td>${user.gender }</td>
																<td>${user.phone }</td>
																<td>${user.birth }</td>
																<td><button onclick="userDelete(${status.index})" class="btn_1 gray delete">삭제</button></td>
															</tr>
														</c:forEach>
													</tbody>
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
											
											<form action="userSearch.do">
												<select id = "searchType" name="searchType" class="form-fontrol form-control-sm">
													<option value="option_id">아이디</option>
													<option value="option_name">이름</option>
												</select>
												<input name="searchKeyword" placeholder="검색어 입력" class="form-fontrol form-control-sm">
												<input type="submit" value="검색">
											</form>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

	</c:when>
	
	<c:otherwise>
		<body onload = "errorPage()"></body>
	</c:otherwise>
	
</c:choose>
<!-- 모달창 -->
<!-- <div class="check_modal">
			<div class="check_modal_content">
				<h1>삭제한다?</h1>
				<div><button onclick = "userDelete">삭제한다</button></div>
			</div>
		</div> -->