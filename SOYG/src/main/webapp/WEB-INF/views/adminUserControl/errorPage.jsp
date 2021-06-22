<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	function pastPage() {

		history.back();
	}
</script>

<main>
	<div id="error_page">
		<div class="container">
			<div class="row justify-content-center text-center">
				<div class="col-xl-7 col-lg-9">
					<h2>
						404 <i class="icon_error-triangle_alt"></i>
					</h2>
					<p>찾으시는 페이지가 없습니다.</p>

					<div class="search_bar_error">
						<a onclick="pastPage()">돌아가기</a>
					</div>

				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /error_page -->
</main>
<!--/main-->