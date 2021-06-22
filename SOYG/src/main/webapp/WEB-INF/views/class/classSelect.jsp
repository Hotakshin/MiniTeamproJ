<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="resources/js/classPang.js"></script>

<script>
	$(function() {
		// 	이미지 클릭시 해당 이미지 모달
		$(".imgC").click(function() {
			$(".modal").show();
			// 해당 이미지 가져오기
			var imgSrc = $(this).children("img").attr("src");
			var imgAlt = $(this).children("img").attr("alt");
			$(".modalBox img").attr("src", imgSrc);
			$(".modalBox img").attr("alt", imgAlt);

			// 해당 이미지 텍스트 가져오기
			var imgTit = $(this).children("p").text();
			$(".modalBox p").text(imgTit);

			// 해당 이미지에 alt값을 가져와 제목으로
			//$(".modalBox p").text(imgAlt);
		});

		//.modal안에 button을 클릭하면 .modal닫기
		$(".modal button").click(function() {
			$(".modal").hide();
		});

		//.modal밖에 클릭시 닫힘
		$(".modal").click(function(e) {
			if (e.target.className != "modal") {
				return false;
			} else {
				$(".modal").hide();
			}
		});
	});
	
</script>

<main>
	<section id="hero_in" class="courses">
		<div class="wrapper">
			<div class="container2">
				<div style="width: 48.8%; height: 100%;" class="imgC">
					<!-- 메인이미지 -->
					<img class="image-set"
						src="resources/classImage/${study.class_Image }">
				</div>
				<div style="width: 48.8%; height: 50%;" class="imgC">
					<!-- 부가 설명이미지 foreach 4개 -->
					<div class="container2_inner imgC">
						<img class="image-set"
							src="resources/classImage/${image.main_image2 }">
					</div>
					<div class="container2_inner imgC">
						<img class="image-set"
							src="resources/classImage/${image.main_image3 }">
					</div>
					<div class="container2_inner imgC">
						<img class="image-set"
							src="resources/classImage/${image.main_image4 }">
					</div>
					<div class="container2_inner imgC">
						<img class="image-set"
							src="resources/classImage/${image.main_image5 }">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/hero_in-->

	<div class="bg_color_1">
		<nav class="secondary_nav sticky_horizontal">
			<div class="container">
				<ul class="clearfix">
					<li><a href="#description" class="active">학습의 의의</a></li>
					<li><a href="#lessons">과정</a></li>
					<li><a href="#reviews">커뮤니티</a></li>
				</ul>
			</div>
		</nav>
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-lg-8">

					<section id="description">
						<h2>학습의 의의</h2>
						<p>${study.class_Info }</p>
						<!-- /row -->
					</section>
					<!-- /section -->

					<section id="lessons">
						<div class="intro_title">
							<h2>과정</h2>
							<ul>
								<li>18 lessons</li>
								<li>01:02:10</li>
							</ul>
						</div>
						<div id="accordion_lessons" role="tablist" class="add_bottom_45">
							<div class="card">
								<div class="card-header" role="tab" id="headingOne">
									<h5 class="mb-0">
										<a data-toggle="collapse" href="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne"><i
											class="indicator ti-minus"></i> Introdocution</a>
									</h5>
								</div>

								<div id="collapseOne" class="collapse show" role="tabpanel"
									aria-labelledby="headingOne" data-parent="#accordion_lessons">
									<div class="card-body">
										<div class="list_lessons">
											<ul>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">Health Science</a><span>00:59</span></li>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">Health and Social Care</a><span>00:59</span></li>
												<li><a href="#0" class="txt_doc">Audiology</a><span>00:59</span></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!-- /card -->
							<div class="card">
								<div class="card-header" role="tab" id="headingTwo">
									<h5 class="mb-0">
										<a class="collapsed" data-toggle="collapse"
											href="#collapseTwo" aria-expanded="false"
											aria-controls="collapseTwo"> <i class="indicator ti-plus"></i>Generative
											Modeling Review
										</a>
									</h5>
								</div>
								<div id="collapseTwo" class="collapse" role="tabpanel"
									aria-labelledby="headingTwo" data-parent="#accordion_lessons">
									<div class="card-body">
										<div class="list_lessons">
											<ul>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">Health Science</a><span>00:59</span></li>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">Health and Social Care</a><span>00:59</span></li>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">History</a><span>00:59</span></li>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">Healthcare Science</a><span>00:59</span></li>
												<li><a href="#0" class="txt_doc">Audiology</a><span>00:59</span></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!-- /card -->
							<div class="card">
								<div class="card-header" role="tab" id="headingThree">
									<h5 class="mb-0">
										<a class="collapsed" data-toggle="collapse"
											href="#collapseThree" aria-expanded="false"
											aria-controls="collapseThree"> <i
											class="indicator ti-plus"></i>Variational Autoencoders
										</a>
									</h5>
								</div>
								<div id="collapseThree" class="collapse" role="tabpanel"
									aria-labelledby="headingThree" data-parent="#accordion_lessons">
									<div class="card-body">
										<div class="list_lessons">
											<ul>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">Health Science</a><span>00:59</span></li>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">Health and Social Care</a><span>00:59</span></li>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">History</a><span>00:59</span></li>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">Healthcare Science</a><span>00:59</span></li>
												<li><a href="#0" class="txt_doc">Audiology</a><span>00:59</span></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!-- /card -->

							<div class="card">
								<div class="card-header" role="tab" id="headingFourth">
									<h5 class="mb-0">
										<a class="collapsed" data-toggle="collapse"
											href="#collapseFourth" aria-expanded="false"
											aria-controls="collapseFourth"> <i
											class="indicator ti-plus"></i>Gaussian Mixture Model Review
										</a>
									</h5>
								</div>
								<div id="collapseFourth" class="collapse" role="tabpanel"
									aria-labelledby="headingFourth"
									data-parent="#accordion_lessons">
									<div class="card-body">
										<div class="list_lessons">
											<ul>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">Health Science</a><span>00:59</span></li>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">Health and Social Care</a><span>00:59</span></li>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">History</a><span>00:59</span></li>
												<li><a
													href="https://www.youtube.com/watch?v=LDgd_gUcqCw"
													class="video">Healthcare Science</a><span>00:59</span></li>
												<li><a href="#0" class="txt_doc">Audiology</a><span>00:59</span></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!-- /card -->
						</div>
						<!-- /accordion -->
					</section>
					<!-- /section -->

					<section id="reviews">
						<h2 style="display: inline-block;">커뮤니티</h2>
						<h6 style="display: inline-block;">ㅇ댓글갯수</h6>
						<button class="btn btn-dark fDnpvW ckDfJz">글 쓰기</button>
						<div class="kGkZYm">
							<div
								class="swiper-container sc-fvhGYg gLQA-Dh cAvXRp swiper-container-horizontal">
								<h5>공지사항</h5>
								<div class="swiper-wrapper">
									<div class="swiper-slide dSmJXp" style="height: 180px;">
										<div>
											<div width="100%" class="dELPiW">
												<div class="ktbFdU">
													<div class="bRFhLZ">
														<div class="hhRQON">
															<div font-weight="600" color="#3a3a3a" class="crkaSe">
																닉네임</div>
														</div>
														<div class="btbfZZ dhxlc">공지 날짜</div>
													</div>
												</div>
												<div class="fQcRNu">
													<div class="fumiqu">
														<div class="jpDNdc">공지내용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅋ</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="swiper-slide">Slide 2</div>
									<div class="swiper-slide">Slide 3</div>
								</div>
								<div class="swiper-pagination"></div>
								<div class="swiper-prev"></div>
								<div class="swiper-next"></div>
								<div class="swiper-scrollbar"></div>
							</div>
						</div>
						<div class="reviews-container">
							<div class="row">
								<div class="col-lg-3">
									<div id="review_summary">
										<strong>4.7</strong>
										<div class="rating">
											<i class="icon_star voted"></i><i class="icon_star voted"></i><i
												class="icon_star voted"></i><i class="icon_star voted"></i><i
												class="icon_star"></i>
										</div>
									</div>
								</div>
								<div class="col-lg-9">
									<div class="row">
										<div class="col-lg-10 col-9">
											<div class="progress">
												<div class="progress-bar" role="progressbar"
													style="width: 90%" aria-valuenow="90" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
										<div class="col-lg-2 col-3">
											<small><strong>5 stars</strong></small>
										</div>
									</div>
									<!-- /row -->
									<div class="row">
										<div class="col-lg-10 col-9">
											<div class="progress">
												<div class="progress-bar" role="progressbar"
													style="width: 95%" aria-valuenow="95" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
										<div class="col-lg-2 col-3">
											<small><strong>4 stars</strong></small>
										</div>
									</div>
									<!-- /row -->
									<div class="row">
										<div class="col-lg-10 col-9">
											<div class="progress">
												<div class="progress-bar" role="progressbar"
													style="width: 60%" aria-valuenow="60" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
										<div class="col-lg-2 col-3">
											<small><strong>3 stars</strong></small>
										</div>
									</div>
									<!-- /row -->
									<div class="row">
										<div class="col-lg-10 col-9">
											<div class="progress">
												<div class="progress-bar" role="progressbar"
													style="width: 20%" aria-valuenow="20" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
										<div class="col-lg-2 col-3">
											<small><strong>2 stars</strong></small>
										</div>
									</div>
									<!-- /row -->
									<div class="row">
										<div class="col-lg-10 col-9">
											<div class="progress">
												<div class="progress-bar" role="progressbar"
													style="width: 0" aria-valuenow="0" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
										<div class="col-lg-2 col-3">
											<small><strong>1 stars</strong></small>
										</div>
									</div>
									<!-- /row -->
								</div>
							</div>
							<!-- /row -->
						</div>

						<hr>

						<div class="reviews-container">
							<!-- /review-box -->
							<div class="review-box clearfix">
								<figure class="rev-thumb">
									<img
										src="http://via.placeholder.com/150x150/ccc/fff/avatar1.jpg"
										alt="">
								</figure>
								<div class="rev-content">
									<div class="rating">
										<i class="icon_star voted"></i><i class="icon_star voted"></i><i
											class="icon_star voted"></i><i class="icon_star voted"></i><i
											class="icon_star"></i>
									</div>
									<div class="rev-info">닉네임 – 날짜</div>
									<div class="rev-text">
										<p>내용</p>
									</div>
								</div>
							</div>
							<!-- /review-box -->
						</div>
						<!-- /review-container -->
					</section>
					<!-- /section -->
				</div>
				<!-- /col -->

				<aside class="col-lg-4" id="sidebar">
					<div class="box_detail">
						<div class="iYUinv">${study.field_Name }</div>
						<div class="jhzFzM">${study.class_Name }</div>
						<div class="cJDaSl">
							<div class="ePrSEx">바로수강가능</div>
						</div>
						<c:if test="${empty id }">
							<a onclick="$videoBtnFnc('emp')" class="btn_1 full-width outline" style="margin-top: 10px;">신청하기</a>
						</c:if>
						<c:if test="${!empty id }">
							<a onclick="$videoBtnFnc('nonEmp')" class="btn_1 full-width outline" style="margin-top: 10px;">신청하기</a>
						</c:if>
						<a href="home.do" class="btn_1 full-width outline">
							목록
						</a>
						<c:if test="${study.captain eq id || id eq 'admin'}">
							<a class="btn_1 full-width" onclick="$delBtnFnc('${study.class_Code }')">
								삭제
							</a>
							<a class="btn_1 full-width" href="studyUpdateForm.do?class_code=${study.class_Code }">수정</a>
						</c:if>
						<div id="list_feat">
							<h3>클래스 정보</h3>
							<ul>
								<li>
									<c:if test="${study.class_Active eq 'A'.charAt(0) }">
										활성화
									</c:if>
									<c:if test="${study.class_Active eq 'I'.charAt(0) }">
										비활성화
									</c:if>
								</li>
								<li>
									<c:if test="${study.class_StartChk eq 'R'.charAt(0) }">
										모집중
									</c:if>
									<c:if test="${study.class_StartChk eq 'O'.charAt(0) }">
										진행중
									</c:if>
									<c:if test="${study.class_StartChk eq 'E'.charAt(0) }">
										모집종료
									</c:if>
								</li>
								<li>
									<c:if test="${study.weekdays_Chk eq 'W'.charAt(0) }">
										주중
									</c:if>
									<c:if test="${study.weekdays_Chk eq 'E'.charAt(0) }">
										주말
									</c:if>
								</li>
								<li>
									모집인원: ${study.class_Personnel }
								</li>
								<li>
									시간: ${study.class_Time }
								</li>
								<li>
									도시: ${study.city }
								</li>
								<li>
									클래스장 아이디: ${study.captain }
								</li>
							</ul>
						</div>
					</div>
				</aside>
			</div>	
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /bg_color_1 -->
	<!-- 팝업 될 곳 -->
	<div class="modal">
		<button>&times;</button>
		<div class="modalBox">
			<img src="" alt="">
			<p></p>
		</div>
	</div>

	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script>
		const swiper = new Swiper('.swiper-container', {
			loop : true,
			pagination : {
				el : '.swiper-pagination'
			},
			navigation : {
				nextEl : '.swiper-next',
				prevEl : '.swiper-prev'
			}
		})
	</script>
</main>
<!--/main-->