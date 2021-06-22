<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script src="resources/js/classPang.js"></script>
	
<div class="theia-exception">
	<main>
		<section id="hero_in" class="courses">
			<div class="wrapper">
				<div class="container2">
				<div style="width: 48.8%; height: 100%;" class="imgC">
					<!-- 메인이미지 -->
					<img class="image-set" id="previewImage1">
				</div>
				<div style="width: 48.8%; height: 50%;" class="imgC">
					<!-- 부가 설명이미지 foreach 4개 -->
					<div class="container2_inner imgC">
						<img class="image-set" id="previewImage2">
					</div>
					<div class="container2_inner imgC">
						<img class="image-set" id="previewImage3">
					</div>
					<div class="container2_inner imgC">
						<img class="image-set" id="previewImage4">
					</div>
					<div class="container2_inner imgC">
						<img class="image-set" id="previewImage5">
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
					</ul>
				</div>
			</nav>
			<div class="container margin_60_35">
				<div class="row">
					<div class="col-lg-8">
	<form action="classInsert.do" method="post" id="textFrm">
						<h2>클래스 이름 : <input type="text" name="class_name" id="class_name" /></h2>
						<br>
						<hr/> 
						<section id="description">
							<!-- /box_highlight -->
							<h2>학습의 의의</h2>
							<div>
							<p>
								<textarea id="class_info" name="class_info" ></textarea>
							</p>
							</div>
						</section>
						<!-- /section -->

						<section id="lessons">
							<div class="intro_title mk_flex">
								<h2>과정</h2>&nbsp;&nbsp;&nbsp;
								<span>큰과정 추가</span>
								<button type="button" class="btn btn-primary btnsIze" onclick="$addCourse('bigCourse')">
									<small>추가</small>
								</button>
							</div>
							<div id="accordion_lessons" role="tablist" class="add_bottom_45">
								<div class="card">
									<div class="card-header" role="tab" id="headingOne">
										<h5 class="mb-0">
											<a data-toggle="collapse" href="#collapseOne"
												aria-expanded="true" aria-controls="collapseOne">
												<i class="indicator ti-minus"></i>
												<input type="text" name="big_course" />
											</a>
										</h5>
									</div>

									<div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
										<div class="card-body">
											<input type="text" name="mid_course"/>&nbsp;&nbsp;&nbsp;
											<span>과정제목 추가</span>
											<button type="button" class="btn btn-primary btnsIze" onclick="$addCourse('smallCourse')">
												<small>추가</small>
											</button>
											<div class="list_lessons_2">
												<ul class="listBodyOne">
													<li>
														<input type="text" name="small_course"/>
													</li>
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
						
						<section>
							<div class="intro_title mk_flex">
								<h2>세부설정</h2>
							</div>
							<div>
								<table class="table">
									<tr>
										<th>지역</th>
										<td>
											<select name="loc_code" id="loc_code">
												<c:forEach items="${loc }" var="loc">
													<option value="${loc.loc_code }">${loc.loc_name }</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th>시작날짜</th>
										<td>
											<input type="date" name="start_date" id="start_date" />
										</td>
									</tr>
									<tr>
										<th>활성화 여부</th>
										<td>
											<label>
												<input type="radio" name="class_active" id="class_active" value="A" checked="checked" />
												활성화
											</label>
											<label>
												<input type="radio" name="class_active" id="class_active" value="I" />
												비활성화
											</label> 
										</td>
									</tr>
									<tr>
										<th>모집 여부</th>
										<td>
											<label>
												<input type="radio" name="class_startchk" id="class_startchk" value="R" checked="checked" />
												모집 중
											</label>
											<label>
												<input type="radio" name="class_startchk" id="class_startchk" value="O" />
												진행 중
											</label>
											<label>
												<input type="radio" name="class_startchk" id="class_startchk" value="E" />
												모집 종료
											</label> 
										</td>
									</tr>
									<tr>
										<th>모집 인원</th>
										<td>
											<input type="number" name="class_personnel" id="class_personnel" placeholder="모집인원을 숫자로 적어주세요" />
										</td>
									</tr>
									<tr>
										<th>분류</th>
										<td>
											<select name="field_code" id="field_code">
												<c:forEach items="${field }" var="field">
													<option value="${field.field_code }">${field.field_name }</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th>주중/주말</th>
										<td>
											<label>
												<input type="radio" name="weekdays_chk" id="weekdays_chk" value="W" checked="checked" />
												주중
											</label>
											<label>
												<input type="radio" name="weekdays_chk" id="weekdays_chk" value="E" />
												주말
											</label> 
										</td>
									</tr>
									<tr>
										<th>시간</th>
										<td>
											<input type="text" name="class_time" id="class_time" placeholder="10:30~22:30" />
										</td>
									</tr>
									<tr>
										<th>세부지역</th>
										<td>
											<select name="city" id="city">
											    <optgroup label="서울경기">
											       <option value="서울">서울</option>
											       <option value="인천">인천</option>
											       <option value="수원">수원</option>
											       <option value="의정부">의정부</option>
											       <option value="성남">성남</option>
											       <option value="고양">고양</option>
											       <option value="용인">용인</option>
											       <option value="부천">부천</option>
											       <option value="안산">안산</option>
											       <option value="안양">안양</option>
											       <option value="남양주">남양주</option>
											       <option value="화성">화성</option>
											       <option value="시흥">시흥</option>
											       <option value="광명">광명</option>
											       <option value="평택">평택</option>
											       <option value="파주">파주</option>
											       <option value="군포">군포</option>
											       <option value="김포">김포</option>
											       <option value="이천">이천</option>
											       <option value="구리">구리</option>
											       <option value="하남">하남</option>
											       <option value="과천">과천</option>
											       <option value="여주">여주</option>
											       <option value="양주">양주</option>
											       <option value="포천">포천</option>
											    </optgroup>
											    <optgroup label="강원">
											       <option value="춘천">춘천</option>
											       <option value="원주">원주</option>
											       <option value="강릉">강릉</option>
											       <option value="동해">동해</option>
											       <option value="태백">태백</option>
											       <option value="속초">속초</option>
											       <option value="삼척">삼척</option>
											    </optgroup>
											    <optgroup label="대전충북">
											       <option value="대전">대전</option>
											       <option value="청주">청주</option>
											       <option value="충주">충주</option>
											       <option value="제천">제천</option>
											    </optgroup>
											    <optgroup label="충남">
											       <option value="천안">천안</option>
											       <option value="공주">공주</option>
											       <option value="보령">보령</option>
											       <option value="아산">아산</option>
											       <option value="서산">서산</option>
											       <option value="논산">논산</option>
											       <option value="당진">당진</option>
											    </optgroup>
											    <optgroup label="전북">
											       <option value="전주">전주</option>
											       <option value="익산">익산</option>
											       <option value="군산">군산</option>
											       <option value="정읍">정읍</option>
											       <option value="남원">남원</option>
											       <option value="김제">김제</option>
											    </optgroup>
											    <optgroup label="광주전남">
											       <option value="서울">서울</option>
											       <option value="인천">인천</option>
											       <option value="수원">수원</option>
											       <option value="의정부">의정부</option>
											       <option value="">의정부</option>
											    </optgroup>
											    <optgroup label="대구경북">
											       <option value="대구">대구</option>
											       <option value="경산">경산</option>
											       <option value="구미">구미</option>
											       <option value="김천">김천</option>
											       <option value="포항">포항</option>
											       <option value="경주">경주</option>
											       <option value="안동">안동</option>
											       <option value="영주">영주</option>
											       <option value="영천">영천</option>
											       <option value="상주">상주</option>
											       <option value="문경">문경</option>
											    </optgroup>
											    <optgroup label="부산경남">
											       <option value="부산">부산</option>
											       <option value="창원">창원</option>
											       <option value="김해">김해</option>
											       <option value="양산">양산</option>
											       <option value="진주">진주</option>
											       <option value="거제">거제</option>
											       <option value="통영">통영</option>
											       <option value="사천">사천</option>
											       <option value="밀양">밀양</option>
											    </optgroup>
											    <optgroup label="제주">
											       <option value="제주시">제주시</option>
											       <option value="서귀포시">서귀포시</option>
											    </optgroup>
											</select>
										</td>
									</tr>
								</table>
							</div>
							<!-- /accordion -->
						</section>
						<!-- /section -->
						<input type="hidden" id="class_image" name="class_image" />
						<input type="hidden" id="main_image2" name="main_image2" />
						<input type="hidden" id="main_image3" name="main_image3" />
						<input type="hidden" id="main_image4" name="main_image4" />
						<input type="hidden" id="main_image5" name="main_image5" />
						</form>
					</div>
					<!-- /col -->

					<aside class="col-lg-4" id="sidebar">
						<div class="box_detail">
							<h4>이미지 삽입</h4>
							<p class="nopadding">메인이미지와 삽입할 이미지들을 넣어주세요</p>
							<div id="message-contact"></div>
							<form method="post" action="imageUpload" id="imageForm" autocomplete="off" enctype="multipart/form-data">
								<div class="row">
									<div class="col-xl-6 col-lg-12 col-sm-6">
										<span class="input">
											<span class="input__label-content">메인이미지</span>
											<input class="input_field" accept="image/*" type="file" id="image" name="image" onchange="loadImg(this, '1');">
										</span>
									</div>
									<div class="col-xl-6 col-lg-12 col-sm-6">
										<span class="input"> 
											<span class="input__label-content">부가이미지2</span>
											<input class="input_field" accept="image/*" type="file" id="image2" name="image2" onchange="loadImg(this, '2');">
										</span>
									</div>
								</div>
								<!-- /row -->
								<div class="row">
									<div class="col-xl-6 col-lg-12 col-sm-6">
										<span class="input"> 
											<span class="input__label-content">부가이미지3</span>
											<input class="input_field" accept="image/*" type="file" id="image3" name="image3" onchange="loadImg(this, '3');">
										</span>
									</div>
									<div class="col-xl-6 col-lg-12 col-sm-6">
										<span class="input">
											<span class="input__label-content">부가이미지4</span>
											<input class="input_field" accept="image/*" type="file" id="image4" name="image4" onchange="loadImg(this, '4');">
										</span>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-6 col-lg-12 col-sm-6">
										<span class="input"> 
											<span class="input__label-content">메인이미지5</span>
											<input class="input_field" accept="image/*" type="file" id="image5" name="image5" onchange="loadImg(this, '5');">
										</span>
									</div>
								</div>
								<hr>
								<div style="position: relative;">
									<button type="button" class="btn_1 full-width" id="submit-contact" onclick="$submitBtn('cre')">만들기</button>
								</div>
							</form>
						</div>
					</aside>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_color_1 -->
	</main>
	<!--/main-->
</div>
<!-- page -->