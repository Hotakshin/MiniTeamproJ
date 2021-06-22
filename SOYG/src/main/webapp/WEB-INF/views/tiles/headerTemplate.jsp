<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.fs1 {
	line-height: 1;
	font-size:1.5rem;
	position: relative;
    top: 6px;
}


</style>
<header class="header menu_2">
    <div id="preloader">
        <div data-loader="circle-side"></div>
    </div>
    <!-- /Preload -->
    <div id="logo">
        <a href="home.do"><img src="resources/mainImage/SOYG.png" width="149" height="42" alt="" /></a>
    </div>
    <ul id="top_menu">
		<c:choose>
			<c:when test="${!empty id }">
				<li><a class="fs1" href="logOut.do" data-icon="" ></a></li>
				<li><a class="fs1" href="mymenu.do" data-icon=""></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="memberLoginpage.do" class="login">Login</a></li>
				<li class="hidden_tablet"><a href="memberJoin.do"
					class="btn_1 rounded">JOIN</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="#0" class="search-overlay-menu-btn">Search</a></li>

	</ul>
    <!-- /top_menu -->
    <a href="#menu" class="btn_mobile">
        <div class="hamburger hamburger--spin" id="hamburger">
            <div class="hamburger-box">
                <div class="hamburger-inner"></div>
            </div>
        </div>
    </a>
    <nav id="menu" class="main-menu">
        <ul>
            <li>
                <span><a href="home.do">Home</a></span>
            </li>
            <li>
                <span><a href="#0">FIELDS</a></span>
                <ul>
                    <li><a href="fieldsList.do?field_code=lang">언어</a></li>
                    <li><a href="fieldsList.do?field_code=lic">자격증</a></li>
                    <li><a href="fieldsList.do?field_code=empr">취업준비</a></li>
                    <li><a href="fieldsList.do?field_code=hob">취미</a></li>
                    <li><a href="fieldsList.do?field_code=etc">E.T.C</a></li>
                </ul>
            </li>
            <li>
                <span><a href="#0">REGION</a></span>
                <ul>
                    <li><a href="regionList.do?loc_code=02">서울경기</a></li>
                    <li><a href="regionList.do?loc_code=033">강원</a></li>
                    <li><a href="regionList.do?loc_code=042">대전충북</a></li>
                    <li><a href="regionList.do?loc_code=041">충남</a></li>
                    <li><a href="regionList.do?loc_code=063">전북</a></li>
                    <li><a href="regionList.do?loc_code=062">광주전남</a></li>
                    <li><a href="regionList.do?loc_code=053">대구경북</a></li>
                    <li><a href="regionList.do?loc_code=051">부산경남</a></li>
                    <li><a href="regionList.do?loc_code=064">제주</a></li>
                </ul>
            </li>
            
            <!-- 관리자일 때만 보이게 -->
            <c:choose>
            	<c:when test = "${id eq 'admin' }">
		            <li>
		               <span><a href="admin.do">관리자페이지</a></span>
		               	<ul>
		               		<li><a href = "adminClassList.do">스터디모임 관리</a></li>
		               		<li><a href = "userListPaging.do">회원 관리</a></li>
		               	</ul>
		            </li>            	
            	</c:when>
            </c:choose>
        </ul>
    </nav>
    <!-- Search Menu -->
    <div class="search-overlay-menu">
        <span class="search-overlay-close"
            ><span class="closebt"><i class="ti-close"></i></span
        ></span>
        <form role="search" id="searchform" action="searchClass.do" method="get">
            <input value="" name="search" type="search" placeholder="Search..." />
            <button type="submit">
                <i class="icon_search"></i>
            </button>
        </form>
    </div>
    <!-- End Search Menu -->
</header>
<!-- /header -->
