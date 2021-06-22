<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
/*
 * FilePond Custom Styles
 */
.filepond--drop-label {
	color: #4c4e53;
}

.filepond--label-action {
	text-decoration-color: #babdc0;
}

.filepond--panel-root {
	background-color: #edf0f4;
}

/**
 * Page Styles
 */
html {
	padding: 20vh 0 0;
}

.filepond--root {
	width: 170px;
	margin: 0 auto;
}

.myButton {
	box-shadow: inset 0px 1px 0px 0px #54a3f7;
	background: linear-gradient(to bottom, #007dc1 5%, #0061a7 100%);
	background-color: #007dc1;
	border-radius: 3px;
	border: 1px solid #124d77;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 20px;
	padding: 9px 10px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #154682;
}

.myButton:hover {
	background: linear-gradient(to bottom, #0061a7 5%, #007dc1 100%);
	background-color: #0061a7;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script text="javascript/text">
	$(document)
			.ready(
					function() {

						$('.box')
								.each(
										function() {
											var content = $(this).children(
													'.content');
											var content_txt = content.text();
											var content_txt_short = content_txt
													.substring(0, 200)
													+ "...";
											var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');

											$(this).append(btn_more);

											if (content_txt.length >= 100) {
												content.html(content_txt_short)

											} else {
												btn_more.hide()
											}

											btn_more.click(toggle_content);
											// 아래 bind가 안 되는 이유는??
											// btn_more.bind('click',toggle_content);

											function toggle_content() {
												if ($(this).hasClass('short')) {
													// 접기 상태
													$(this).html('더보기');
													content
															.html(content_txt_short)
													$(this)
															.removeClass(
																	'short');
												} else {
													// 더보기 상태
													$(this).html('접기');
													content.html(content_txt);
													$(this).addClass('short');

												}
											}
										});
					});
</script>
<script>
function classcheck(classcode) {

	console.log(classcode);

	$.ajax({
		url : 'updateClass.do',
		data : {
			class_code : $('#class_code'+classcode).val(),
			class_name : $('#class_name'+classcode).val(),
			class_info : $('#class_info'+classcode).val(),
			class_time : $('#class_time'+classcode).val(),
			class_personnel : $('#class_personnel'+classcode).val(),
			class_startchk : $('#class_startchk'+classcode).val(),					
		},
		type : 'post',
		success : function(data) {
			alert("수정이완료되었습니다. 페이지를 새로 호출합니다.");
			location.href = "mymenu.do";
		},
		error : function(err) {
			console.log(err);
			alert("수정이 실패했습니다. 공백을 채워주시거나 계속되면 관리자에게 문의하십시요.");
		}
	});
}
// 스터디탈퇴
function classdrop(classcode) {

		msg = "정말 탈퇴 하시겠어요?";
		if(confirm(msg) != 0) {
			$.ajax({
				 
				url : 'dropClass.do',
				data : {
					class_code : $('#class_code'+classcode).val(),
				},
				type : 'post',
				success : function(data) {
					alert("모임 탈퇴가 완료되었습니다.")
					location.href = "mymenu.do";
				},
				error : function(err) {
					console.log(err);
					alert("탈퇴에 실패했습니다. 실패가 계속되면 관리자에게 문의해주세요.");
				}
			})
		
	};
}
//좋아요 클릭시 실행
$('body').on('click','#likeIt' ,function(){
        let c_code = $(this).closest(".wrapper_indent").find(".c_class_code").val();
        let icon = $(this).closest(".wrapper_indent").find(".likeIcon");
        console.log(icon);
           $.ajax({
              url: 'likeItEdit.do',
              type: "POST",
              data: {
                 id: '${id}',
                 c_code: c_code
              },
              success: function(result) {
                 console.log("Good!");
                 console.log(result);
                 if(result == 1){
                	 $(icon).empty();
                	 $(icon).append("💗");
                } else  {
                	$(icon).empty();
                	$(icon).append("🤍");
                }
            }
       });
  });
</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<section id="hero_in" class="general">
	<div class="wrapper">
		<div class="container">
			<h1 class="fadeInUp">
				<span></span>내 정보보기
			</h1>
		</div>
	</div>
</section>
<!--/hero_in-->
<div class="container margin_60_35">
	<div class="row">
		<aside class="col-lg-3" id="sidebar">
			<div class="profile">
				<figure>
					<img
						src="http://via.placeholder.com/150x150/ccc/fff/teacher_2_small.jpg"
						alt="Teacher" class="rounded-circle">
				</figure>
				<ul>
					<li>Name<span class="float-right">${info.name }</span>
					</li>
					<li>BirthDay <span class="float-right">${info.birth }</span>
					<li>MYPHONE <span class="float-right">${info.phone }</span></li>
					<li style="text-align: center">
						<a href="infomationUpdatepage.do">정보수정하기</a>
					</li>
					<li style="text-align: center;">
						<a href="classCreateForm.do">클래스 만들기</a>
					</li>
				</ul>
			</div>
		</aside>
		<!--/aside -->

		<div class="col-lg-9">
			<div class="box_teacher">
				<div class="indent_title_in">
					<i class="pe-7s-user"></i>
					<h3>내가 바로 스터디장!</h3>
				</div>
				<form>
					<c:forEach var="classlist" items="${classlist }">
						<div style="padding-bottom: 50">
							<div class="wrapper_indent">
								<h5>${classlist.class_name }</h5>
								<input type="hidden" id="class_code${classlist.class_code }"
									name="class_code" value="${classlist.class_code }"> <strong
									style="float: left; margin-top: 35px;">스터디 설명</strong> <a
									class="btn" href="#ex1_${classlist.class_code }"
									rel="modal:open" style="margin-left: 500px">수정하기</a>
								<div id="ex1_${classlist.class_code }" class="modal">
									<h1>${classlist.class_code }</h1>
									<h4>스터디의 정보를 수정할수있어요</h4>
									<div class="step">
										<div class="form-group">
											<p style="margin-bottom: 0px; margin-top: 20px">스터디이름</p>
											<input type="text" name="class_name"
												id="class_name${classlist.class_code }"
												class="form-control required"
												value="${classlist.class_name }">
										</div>
										<div class="form-group">
											<p style="margin-bottom: 0px;">${classlist.class_name }의
												소개를 해주세요.</p>
											<textarea style="width: 440" rows="20" cols="62"
												id="class_info${classlist.class_code }" name="class_info">${classlist.class_info }</textarea>

										</div>
										<div class="form-group">
											<select name="class_startchk"
												id="class_startchk${classlist.class_code }"
												class="form-control required">
												<c:choose>
													<c:when test="${classlist.class_startchk eq 'R' }">
														<option value="${classlist.class_startchk }"
															selected="selected">모집하기</option>
														<option value="O">진행중</option>
														<option value="E">모집완료</option>
													</c:when>
													<c:when test="${classlist.class_startchk eq 'O' }">
														<option value="${classlist.class_startchk }"
															selected="selected">진행중</option>
														<option value="R">모집하기</option>
														<option value="E">모집완료</option>
													</c:when>
													<c:otherwise>
														<option value="${classlist.class_startchk }"
															selected="selected">모집완료</option>
														<option value="O">진행중</option>
														<option value="R">모집하기</option>
													</c:otherwise>
												</c:choose>
											</select>
										</div>
										<div class="form-group">
											<p style="margin-bottom: 0px;">활동시간</p>
											<input type="text" name="class_time"
												id="class_time${classlist.class_code }" class="form-control"
												value="${classlist.class_time }" placeholder="활동시간">
										</div>
										<div class="form-group">
											<p style="margin-bottom: 0px;">정원(숫자로만적어주세요.)</p>
											<input type="text" name="class_personnel"
												id="class_personnel${classlist.class_code }"
												class="form-control" value="${classlist.class_personnel }"
												placeholder="정원">
										</div>
									</div>
									<a href="#" onclick="classcheck('${classlist.class_code }')">정보수정하기!</a>
									<a href="#" rel="modal:close" style="margin-left: 300px;">닫기</a>

								</div>
								<hr>
								<div class="box">
									<div class="content">
										<p>${classlist.class_info }</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-md-6">
										<ul class="list_3">

											<li><strong>모집 여부</strong> <c:choose>
													<c:when test="${classlist.class_startchk eq 'R' }">
														<p>
															<font color="red">모집중</font>
														</p>
													</c:when>
													<c:when test="${classlist.class_startchk eq 'O' }">
														<p>
															<font color="blue">진행중</font>
														</p>
													</c:when>
													<c:otherwise>
														<p>
															<font color="black">모집완료</font>
														</p>
													</c:otherwise>
												</c:choose></li>

											<li><strong>스터디 개설날짜</strong>
												<p>${classlist.start_date }</p></li>
											<li><strong>활동시간</strong>
												<p>${classlist.class_time }</p></li>
										</ul>
									</div>
									<div class="col-md-6">
										<ul class="list_3">
											<li><strong>활동지역</strong>
												<p>${classlist.city }</p></li>
											<li><strong>주중활동여부</strong> <c:choose>

													<c:when test="${classlist.weekdays_chk eq 'W' }">
														<p>주중에도 활동</p>
													</c:when>
													<c:otherwise>
														<p>주말에만 활동</p>
													</c:otherwise>
												</c:choose></li>
											<li><strong>정원</strong>
												<p>${classlist.class_personnel}</p></li>
										</ul>
									</div>
								</div>
								<!-- End row-->
							</div>
						</div>
						<hr class="styled_2" style="border-color: #b36060;">
					</c:forEach>
				</form>


				<!--wrapper_indent -->
				<hr class="styled_2">
				<div class="indent_title_in">
					<i class="pe-7s-display1"></i>
					<h3>내가 가입한 스터디!</h3>
					<p>내가 모임에 가입한 내역들이에요.</p>
				</div>
				<c:forEach var="memberlist" items="${memberlist }">
					<div style="padding-bottom: 50">
						<div class="wrapper_indent">
							<h5>${memberlist.class_name }</h5>
							<input type="hidden" id="class_code${memberlist.class_code }"
								name="class_code" value="${memberlist.class_code }"> <strong
								style="margin-top: 35px; float: left;">스터디 설명</strong><a
								class="btn" href="#ex1_${memberlist.class_code }"
								rel="modal:open" style="margin-left: 500px">삭제하기</a>
							<hr>
							<div id="ex1_${memberlist.class_code }" class="modal"
								style="height: 300px; text-align: center;">
								<H1 style="margin-top: 50px; margin-bottom: 50px">정말 탈퇴
									하시겠어요?</H1>
								<a onclick="classdrop('${memberlist.class_code }')"
									class="myButton" type="button" id="classdrop">응 ! 탈퇴할거야</a> <a
									href='#' class="myButton" type="button" id="cancle"
									rel="modal:close">아니..아직 더해야돼!</a>

							</div>
							<div class="box">
								<div class="content">
									<p>${memberlist.class_info }</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-6">
									<ul class="list_3">

										<li><strong>모집 여부</strong> <c:choose>
												<c:when test="${memberlist.class_startchk eq 'R' }">
													<p>
														<font color="red">모집중</font>
													</p>
												</c:when>
												<c:when test="${memberlist.class_startchk eq 'O' }">
													<p>
														<font color="blue">진행중</font>
													</p>
												</c:when>
												<c:otherwise>
													<p>
														<font color="black">모집완료</font>
													</p>
												</c:otherwise>
											</c:choose></li>

										<li><strong>스터디 개설날짜</strong>
											<p>${memberlist.start_date }</p></li>
										<li><strong>활동시간</strong>
											<p>${memberlist.class_time }</p></li>
									</ul>
								</div>
								<div class="col-md-6">
									<ul class="list_3">
										<li><strong>활동지역</strong>
											<p>${memberlist.city }</p></li>
										<li><strong>주중활동여부</strong> <c:choose>

												<c:when test="${memberlist.weekdays_chk eq 'W' }">
													<p>주중에도 활동</p>
												</c:when>
												<c:otherwise>
													<p>주말에만 활동</p>
												</c:otherwise>
											</c:choose></li>
										<li><strong>정원</strong>
											<p>${memberlist.class_personnel}</p></li>
									</ul>
								</div>
							</div>
							<!-- End row-->
						</div>
					</div>
					<hr class="styled_2" style="border-color: #b36060;">
				</c:forEach>
				<!--wrapper_indent -->
				<!--wrapper_indent -->
<hr class="styled_2">
	<div class="indent_title_in">
		<i class="pe-7s-display1"></i>
		<h3>내가 좋아요한 스터디</h3>
		<p>${id }님이 관심있는 스터디들을 모아 봤어요.</p>
	</div>
		<c:forEach var="ml" items="${myLikeList }">
			<div style="padding-bottom: 50">
				<div class="wrapper_indent">
					<h5>${ml.class_name }</h5>					<!--      ┌>하트 위치 이걸로 조정 -->
						<div style="display:flex; justify-content: flex-end; margin-bottom: -5px">
							<a href="javascript:void(0);" id="likeIt">
								<c:choose>
									<c:when test="${empty ml.like_check }">
									       <span style="font-size: 18pt" class="likeIcon">🤍</span>
									       <input type="hidden" class="c_class_code" value="${ml.class_code}">
									</c:when>
									<c:otherwise>
									       <span style="font-size: 18pt" class="likeIcon">💗</span>
									       <input type="hidden" class="c_class_code" value="${ml.class_code}">
									</c:otherwise>
								</c:choose>
							</a>
						</div>
					<strong style="margin-top: 35px;">스터디 설명</strong>
					<hr>
						<div class="box">
							<div class="content">
								<p>${ml.class_info }</p>
							</div>
						</div>
					<hr>
						<div class="row">
							<div class="col-md-6">
								<ul class="list_3">
									<li><strong>모집 여부</strong>
									<c:choose>
										<c:when test="${ml.class_startchk eq 'R' }">
											<p>
												<font color="red">모집중</font>
											</p>
										</c:when>
										<c:when test="${ml.class_startchk eq 'O' }">
											<p>
												<font color="blue">진행중</font>
											</p>
										</c:when>
										<c:otherwise>
											<p>
												<font color="black">모집완료</font>
											</p>
										</c:otherwise>
									</c:choose>
									</li>

									<li><strong>스터디 개설날짜</strong>
										<p>${ml.start_date }</p></li>
									<li><strong>활동시간</strong>
										<p>${ml.class_time }</p></li>
								</ul>
							</div>
							<div class="col-md-6">
								<ul class="list_3">
									<li><strong>활동지역</strong>
										<p>${ml.city }</p></li>
									<li><strong>주중활동여부</strong>
									<c:choose>
										<c:when test="${ml.weekdays_chk eq 'W' }">
											<p>주중에도 활동</p>
										</c:when>
										<c:otherwise>
											<p>주말에만 활동</p>
										</c:otherwise>
									</c:choose>
									</li>
									<li><strong>정원</strong>
										<p>${ml.class_personnel}</p></li>
								</ul>
							</div>
						</div>
						<!-- End row-->
					</div>
				</div>
			<hr class="styled_2" style="border-color: #b36060;">
		</c:forEach>
<!--wrapper_indent -->
			</div>
		</div>
		<!-- /col -->
	</div>
	<!-- /row -->
</div>
<!-- /container -->