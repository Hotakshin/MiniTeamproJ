<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<div id="page">
	<main>
		<section id="hero_in" class="courses">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>지역별 스터디 : ${regionName.loc_name }</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->
		<div class="filters_listing sticky_horizontal">
			<div class="container">
				<ul class="clearfix">
					<li>
						<div class="layout_view">
								<a href="regionGrid.do?loc_code=${regionList[0].loc_code }"><i class="icon-th"></i></a>
								<a href="regionList.do?loc_code=${regionList[0].loc_code }" class="active"><i class="icon-th-list"></i></a>
						</div>
					</li>
					<li><!-- 카테고리 pulldown menu 링크 -->
						<select name="orderby" class="selectbox" onchange="if(this.value) location.href=(this.value);">
							<option value="#0">Category</option>
							<c:forEach items="${regSelect }" var="rs">
									<option value="regionList.do?loc_code=${rs.loc_code }">${rs.loc_name }</option>
							</c:forEach>
						</select>
					</li>
				</ul>
			</div>
			<!-- /container -->
		</div>
		<!-- /filters -->
		<!-- 스터디 List 시작 -->
		<div class="container margin_60_35">
			<c:choose>
				<c:when test="${!empty regionList }">
					<c:forEach items="${regionList }" var="vo" varStatus="code">
						<div class="box_list wow">
							<div class="row no-gutters">
								<div class="col-lg-5">
									<figure class="block-reveal">
										<div class="block-horizzontal"></div>
										<a href="studySelect.do?class_code=${vo.class_code }">
										<img src="${pageContext.request.contextPath}/resources/classImage/${vo.class_image }" class="img-fluid" alt=""></a>
										<div class="preview"><span>스터디 정보 보기</span></div>
									</figure>
								</div>
								<div class="col-lg-7">
									<div class="wrapper">
										<c:if test="${!empty id }">
											<div style="display:flex; justify-content: flex-end; margin-bottom: -5px">
													<a href="javascript:void(0);" id="likeIt">
														<c:choose>
															<c:when test="${empty vo.like_check }">
										                          <span style="font-size: 18pt" class="likeIcon">🤍</span>
										                          <input type="hidden" class="c_class_code" value="${vo.class_code}">
									                        </c:when>
									                        <c:otherwise>
									                              <span style="font-size: 18pt" class="likeIcon">💗</span>
										                          <input type="hidden" class="c_class_code" value="${vo.class_code}">
									                        </c:otherwise>
									                    </c:choose>
									                </a>
											</div>
										</c:if>
										<small>${vo.city }</small>
										<h3>${vo.class_name }</h3>
										<p>스터디 모집 정원 : ${vo.class_personnel }<br>
											<c:choose>
												<c:when test="${vo.class_startchk eq 'R' }">
													현재 스터디원 모집 중!
												</c:when>
												<c:when test="${vo.class_startchk eq 'O' }">
													현재 스터디 진행 중!
												</c:when>
												<c:otherwise>
													모집이 마감된 스터디입니다.
												</c:otherwise>
											</c:choose>
											<br>
											스터디 책임자 : ${vo.captain }
											<br>
											<c:if test="${!empty vo.start_date }">
											<fmt:formatDate var="startDate" pattern="yyyy-MM-dd" value="${vo.start_date }"/>
											시작 날짜 : <c:out value="${startDate }" />
											</c:if>
										</p>
										<!-- <div class="rating"><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i> <small>(145)</small></div> -->
									</div>
									<ul>
										<li><i class="icon-clock-4"></i> 
											<c:choose>
												<c:when test="${vo.weekdays_chk eq 'W' }">
													주중, ${vo.class_time }
												</c:when>
												<c:otherwise>
													주말, ${vo.class_time }
												</c:otherwise>						
											</c:choose>
										</li>
										<%-- <li><i class="icon_like"></i>
											<span class="likeit_count">${vo.all_cnt }</span>
										</li> --%>
										<li><a href="studySelect.do?class_code=${vo.class_code }">자세히 보기</a></li>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- /box_list -->
				</c:when>
				<c:otherwise>
					<div align="center">
						<font size=6pt face="sanserif" color="#6A0888"><b>아직 개설된 스터디 모임이 없어요😅</b></font><br>
						<font size=4pt face="sanserif"><b>스터디를 새로 개설해보세요!</b></font>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 스터디 리스트 끝 -->
	</main>
	<!--/main-->
	</div>
	<!-- page -->
<script>
	// 좋아요 클릭시 실행
	$('body').on('click','#likeIt' ,function(){
            let test = $(this).closest(".col-lg-7").find(".likeit_count");
            let c_code = $(this).closest(".col-lg-7").find(".c_class_code").val();
            let icon = $(this).closest(".col-lg-7").find(".likeIcon");
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
               /*       $(test).empty();
                     $(test).append(result); */
                }
           });
      });
</script>