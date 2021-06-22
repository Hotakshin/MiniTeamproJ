<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main>
	<section id="hero_in" class="general">
		<div class="wrapper">
			<div class="container">
				<h1 class="fadeInUp">My agenda</h1>
			</div>
		</div>
	</section>
	<!--/hero_in-->

	<div class="container margin_60_35">

		<div class="row">
			<div class="col-md-9">
				<div class="box_general">
					<div id="calendar"></div>
					<!-- End calendar -->
				</div>
			</div>
			<div class="col-md-3">
				<div id="external-events">
					<h5>Draggable Events</h5>
					<div class='external-event'>
						<i class="icon_mug"></i> Coffe Break
					</div>
					<c:forEach items="${list }" var="list">
						${list.td_content }
					</c:forEach>
					<p>
						<input type='checkbox' id='drop-remove'> <label
							for='drop-remove'>Remove after drop</label>
					</p>
					<div style="margin-bottom: 5px;">
						<input type="text" id="listName" placeholder="리스트 이름을 적어주세요"
							value="" />
					</div>
					<div>
						<button type="button" class="btn btn-info" onclick="addEvent()">추가</button>
						<button type="button" class="btn btn-danger"
							onclick="$addBtnFnc('del')">삭제</button>
					</div>
				</div>
			</div>
		</div>
		<!--/row-->
	</div>
	<!-- /container -->
</main>
<!--/main-->