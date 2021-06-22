<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>:::SOYG:::열린 스터디 커뮤니티</title>
<!-- Favicons-->
<link rel="shortcut icon"
	href="resources/udema_v_1.9/html_menu_1/img/favicon.ico"
	type="image/x-icon" />
<link rel="apple-touch-icon" type="image/x-icon"
	href="resources/udema_v_1.9/html_menu_1/img/apple-touch-icon-57x57-precomposed.png" />
<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72"
	href="resources/udema_v_1.9/html_menu_1/img/apple-touch-icon-72x72-precomposed.png" />
<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
	href="resources/udema_v_1.9/html_menu_1/img/apple-touch-icon-114x114-precomposed.png" />
<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
	href="resources/udema_v_1.9/html_menu_1/img/apple-touch-icon-144x144-precomposed.png" />

<!-- GOOGLE WEB FONT -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet" />

<!-- BASE CSS -->
<link href="resources/udema_v_1.9/html_menu_1/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="resources/udema_v_1.9/html_menu_1/css/style.css"
	rel="stylesheet" />
<link href="resources/udema_v_1.9/html_menu_1/css/vendors.css"
	rel="stylesheet" />
<link
	href="resources/udema_v_1.9/html_menu_1/css/icon_fonts/css/all_icons.min.css"
	rel="stylesheet" />

<!-- admin CSS -->
<link href="resources/udema_v_1.9/admin_section/css/admin.css"
	rel="stylesheet" />

<!-- Calendar SPECIFIC CSS -->
<link href="resources/udema_v_1.9/html_menu_1/css/fullcalendar.css"
	rel="stylesheet" />
<link
	href="resources/udema_v_1.9/html_menu_1/css/fullcalendar.print.css"
	rel="stylesheet" media="print" />
<!-- YOUR CUSTOM CSS -->
<link href="resources/udema_v_1.9/html_menu_1/css/custom.css"
	rel="stylesheet" />
<link href="resources/udema_v_1.9/admin_section/css/custom.css"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/css/classPangCss.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div id="page">
		<tiles:insertAttribute name="header" />

		<%-- <tiles:insertAttribute name="menu" /> --%>

		<tiles:insertAttribute name="body" />

		<tiles:insertAttribute name="foot" />
	</div>

	<script src="resources/udema_v_1.9/html_menu_1/js/jquery-3.5.1.min.js"></script>
	<script src="resources/udema_v_1.9/html_menu_1/js/common_scripts.js"></script>
	<script src="resources/udema_v_1.9/html_menu_1/js/main.js"></script>
	<script src="resources/udema_v_1.9/html_menu_1/assets/validate.js"></script>
	<!-- <script src="resources/udema_v_1.9/admin_section/js/admin-datatables.js"></script> -->
	<script src="resources/udema_v_1.9/admin_section/js/admin.js"></script>
	<!-- SPECIFIC CALENDAR -->
	<script src="resources/udema_v_1.9/html_menu_1/js/moment.min.js"></script>
	<script	src="resources/udema_v_1.9/html_menu_1/js/jquery-ui.custom.min.js"></script>
	<script src="resources/udema_v_1.9/html_menu_1/js/fullcalendar.min.js"></script>
	<script src="resources/udema_v_1.9/html_menu_1/js/fullcalendar_func.js"></script>
</body>
</html>
