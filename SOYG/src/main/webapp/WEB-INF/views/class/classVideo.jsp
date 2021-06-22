<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="resources/css/classSelectCss.css" />

<div class="fwOMOq">
	<div class="jsBTxA cpwbLB">
		<!-- 왼쪽 화면 -->
		<div class="jRWIfd keWanL">
			<!-- 제목입력하는 div -->
			<div class="jsBTxA eKvFfG">
				<div class="eKAso">
					<div class="iOAIAu drtUTF">
						<!-- 소제목 -->
						<span class="gFdGWH">소제목</span>
					</div>
					<div class="kKmOqD">
						<div class="dhctQS">
							<!-- 본제목 -->
							<h3 class="dESgDx kWuYjl">본제목</h3>
						</div>
					</div>
				</div>
			</div>
			<!-- 비디오보여주는 div -->
			<div class="BmvdK eKAso">
				<div class="jkBvmH">
					<div class="embed-container">
						<iframe width="788" height="443"
							src="https://www.youtube.com/embed/6aGMNDjsG18"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
				</div>
			</div>
			<!-- 목표 칸 -->
			<div class="iMidLA">
				<div class="cIWwXB">
					<div class="jezlMN">
						<span class="bqAhow"> <svg
								xmlns="http://www.w3.org/2000/svg" width="10" height="10"
								fill="none" viewBox="0 0 24 24">
								<path fill-rule="evenodd"
									d="M7.673 19.972c-1.03.542-1.706.051-1.51-1.096l.827-4.819-3.501-3.413c-.834-.813-.575-1.607.577-1.774l4.837-.703 2.165-4.384c.515-1.044 1.35-1.044 1.865 0l2.164 4.384 4.838.703c1.152.167 1.41.961.577 1.774l-3.501 3.413.826 4.819c.196 1.147-.478 1.638-1.509 1.096L12 17.697l-4.327 2.275z"
									fill="#FFF"></path>
							</svg>
						</span>
						<div class="gvNmDm jEcBiJ">오늘의 목표!</div>
					</div>
					<div class="dqmWOd iokukx">목표내용</div>
				</div>
			</div>
			<!-- 댓글창 -->
			<div>
				<div class="uBRMc">
					<div class="ersubg">
						<h4 class="ersubg jhzFzM">댓글</h4>
						<div class="dhnoNX .iokukx">댓글갯수</div>
					</div>
					<hr
						style="border-bottom: 1px solid rgba(16, 22, 26, 0.15); box-sizing: content-box; height: 0px; overflow: visible; border-top: none; border-right: none; border-left: none; border-image: initial;" />
				</div>
				<!-- 반복문 foreach 시작 -->
				<div>
					<div width="100%" class="dELPiW">
						<div class="ktbFdU">
							<div class="bRFhLZ">
								<div class="hhRQON">
									<div font-weight="600" color="#3a3a3a" class="crkaSe">
										닉네임
									</div>
								</div>
								<div class="btbfZZ dhxlc">댓글 단 시간</div>
							</div>
						</div>
						<div class="fQcRNu">
							<div class="fumiqu">
								<div class="jpDNdc">
									댓글내용
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 반복문 끝 -->
			</div>
		</div>
		<!-- 오른쪽 화면 -->
		<div class="jjrwFD jRWIfd fUWVOi">
			<div class="btIWEC">
				<div class="hZPraK">오늘의 도전과제</div>
			</div>
			<!-- foreach로 돌릴부분 -->
			<div class="col-xl3 col-md6 mb4">
				<div class="card border-left-warning shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-warning text-uppercase mb-1">
									도전과제 제목</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">내용</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 여기까지 -->
		</div>
	</div>

</div>