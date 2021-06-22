<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8" />
    <title>:::SOYG:::열린 스터디 커뮤니티</title>
</head>
<main>
    <section class="hero_single version_2">
        <div class="wrapper">
            <div class="container">
                <h3>찾고싶은 스터디가 있나요?</h3>
                <p>
                    같은 목표가 있는 사람과 함께할 수 있는 스터디 그룹을
                    검색해보세요!
                </p>
                <form id=frm action="searchClass.do" method="post">
                    <div id="custom-search-input">
                        <div class="input-group">
                            <input type="text" name="search" class="search-query" placeholder="ex) 영어, 자격증, 대구, 서울..." />
                            <input type="submit" class="btn_search" value="Search" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- /hero_single -->

    <div class="features clearfix">
        <div class="container">
            <ul>
                <li>
                    <i class="pe-7s-global"></i>
                    <h4>Various of Study</h4>
                    <span>지역별/분야별로 찾는 다양함!</span>
                </li>
                <li>
                    <i class="pe-7s-users"></i>
                    <h4>Achieving Study's goals</h4>
                    <span>공통의 목표를 가진 사람들과 함께!</span>
                </li>
                <li>
                    <i class="pe-7s-smile"></i>
                    <h4>The joy of being together</h4>
                    <span>함께 해나가는 즐거움!</span>
                </li>
            </ul>
        </div>
    </div>
    <!-- /features -->

    <!-- 최근 등록된 스터디 5개씩 보여주기 -->
    <div class="container-fluid margin_120_0">
        <div class="main_title_2">
            <span><em></em></span>
            <h2>Recently registered groups</h2>
            <p>최근에 등록된 스터디 그룹을 만나보세요.</p>
        </div>
        <div id="reccomended" class="owl-carousel owl-theme">
        	<c:forEach items="${recentlyClass }" var="vo" end="5">
            <div class="item">
                <div class="box_grid">
                    <figure>
                        <a href="studySelect.do?class_code=${vo.class_code }">
                            <div class="preview">
                                <span>스터디 정보 보기</span>
                            </div>
                            <img
                                src="${pageContext.request.contextPath}/resources/classImage/${vo.class_image }"
                                class="img-fluid"
                                alt=""
                            />
                        </a>
                    </figure>
                    <div class="wrapper">
                        <small>${vo.city }</small>
                        <h3>${vo.class_name }</h3>
                        <p>
                           스터디 모집 정원 : ${vo.class_personnel }<br>
                           스터디 책임자 : ${vo.captain }<br>
                           스터디 분야 : ${vo.field_name }
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
            <!-- /item -->
        </div>
        <!-- /carousel -->
        <hr />
    </div>
    <!-- /container -->
    <!-- 로그인/비로그인 별 노출 div 끝 -->

    <!-- 지역별 스터디 그룹 DIV -->
    <div class="container margin_30_95">
        <div class="main_title_2">
            <span><em></em></span>
            <h2>Groups by region</h2>
            <p>다양한 지역별 스터디 그룹을 만나보세요.</p>
        </div>
        <div class="row">
        	<c:forEach items="${mainRegionList }" var="vo">
            <div class="col-lg-4 col-md-6 wow" data-wow-offset="150">
                <a href="regionList.do?loc_code=${vo.loc_code }" class="grid_item">
                    <figure class="block-reveal">
                        <div class="block-horizzontal"></div>
 	                    <img src="${pageContext.request.contextPath}/resources/mainImage/${vo.file_name }"
                            class="img-fluid" alt="" />
                        <div class="info">
                            <small
                                ><i class="ti-layers"></i>More Study
                                Groups</small
                            >
                            <h3>${vo.loc_name }</h3>
                        </div>
                    </figure>
                </a>
            </div>
            </c:forEach>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->

    <!-- 분야별 스터디 그룹 Div -->
    <div class="bg_color_1">
        <div class="container margin_120_95">
            <div class="main_title_2">
                <span><em></em></span>
                <h2>Groups by various fields</h2>
                <p>다양한 분야별 스터디 그룹을 만나보세요.</p>
            </div>
            <div class="row">
            	<c:forEach items="${mainFieldsList }" var="fl">
                <div class="col-lg-6">
                    <a class="box_news" href="fieldsList.do?field_code=${fl.field_code }">
                        <figure>
                            <img src="${pageContext.request.contextPath}/resources/mainImage/${fl.file_name }"
                                alt="" />
                        </figure>
                        <h4>${fl.field_name }</h4>
                        <p>
                           ${fl.field_info }
                        </p>
                    </a>
                </div>
                </c:forEach>
                <!-- /box_news -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bg_color_1 -->
</main>
<!-- /main -->
