<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<section id="hero_in" class="courses">
	<div class="wrapper">
		<div class="container">
			<h1 class="fadeInUp">
				<span></span>검색 결과
			</h1>
			<!-- 검색 -->
			<form id=frm action="searchClass.do" method="post">
					<div id="custom-search-input">
					     <div class="input-group">
					         <input type="text" name="search" class="search-query" placeholder="ex) 영어, 자격증, 대구, 서울..." />
					         <input type="submit" class="btn_search" value="Search" />
				    	 </div>
					</div>
			</form>
			<!-- 검색 끝 -->
		</div>
	</div>
</section>
<!--/hero_in-->
<div class="filters_listing sticky_horizontal">
	<div class="container">
		<ul class="clearfix">
			<li>
				<div class="layout_view">
					<a href="searchGrid.do?search=${searchSession }" class="active"><i class="icon-th"></i></a>
					<a href="searchClass.do?search=${searchSession }"><i class="icon-th-list"></i></a>
				</div>
			</li>
		</ul>
	</div>
	<!-- /container -->
</div>
<!-- /filters -->

<div class="container margin_60_35">
	<div class="row">
		<c:choose>
			<c:when test = "${!empty searchClass }">
				<c:forEach items="${searchClass }" var="vo">
				<div class="col-xl-4 col-lg-6 col-md-6">
					<div class="box_grid wow">
						<figure class="block-reveal">
							<div class="block-horizzontal"></div>
							<a href="studySelect.do?class_code=${vo.class_code }"><img
								src="${pageContext.request.contextPath}/resources/classImage/${vo.class_image }"
								class="img-fluid" alt=""></a>
							<div class="preview">
								<span>스터디 정보 보기</span>
							</div>
						</figure>
						<div class="wrapper">
							<c:if test="${!empty id }">
									<div style="display:flex; justify-content: flex-end; margin-bottom: -45px">
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
												스터디원 모집 중!
											</c:when>
											<c:when test="${vo.class_startchk eq 'O' }">
												스터디 진행 중!
											</c:when>
											<c:otherwise>
												모집이 마감된 스터디입니다.
											</c:otherwise>
										</c:choose>
									</p>
							</div>
						<ul>
							<li><i class="icon_clock_alt"></i>
								<c:choose>
									<c:when test="${vo.weekdays_chk eq 'W' }">
											주중, ${vo.class_time }
									</c:when>
									<c:otherwise>
											주말, ${vo.class_time }
									</c:otherwise>						
								</c:choose>
							</li>
							<li><a href="studySelect.do?class_code=${vo.class_code }">자세히</a></li>
						</ul>
					</div>
				</div>
				</c:forEach>
		</c:when>
		<c:otherwise>
			<div align="center">
				<font size=6pt face="sanserif" color="#6A0888"><b>찾으시는 결과가 없어요😥</b></font><br>
				<font size=4pt face="sanserif"><b>다시 검색해주세요!</b></font>
			</div>
		</c:otherwise>
		</c:choose>
		<!-- /box_grid -->
	</div>
	<!-- /row -->
</div>
<script>
	// 좋아요 클릭시 실행
	$('body').on('click','#likeIt' ,function(){
            let test = $(this).closest(".wrapper").find(".likeit_count");
            let c_code = $(this).closest(".wrapper").find(".c_class_code").val();
            let icon = $(this).closest(".wrapper").find(".likeIcon");
            console.log(c_code);
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