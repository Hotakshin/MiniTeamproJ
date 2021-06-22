<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
.width {
	width: 600px;
	text-align: center;
	margin: auto;
}

button {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

button:hover {
	background: #fff;
	color: #1AAB8A;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}


.step {
    height: 600px;
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    margin-top : 83px;
}

	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
		-webkit-appearance: none;
	}
	
	input[type="date"]::before {content:attr(data-placeholder);width:100%}
	input[type="date"]:focus::before,
	input[type ="date"]:valid::before {
		display: none;
	}
	

</style>

<script>
	function numberLength(e) {
		if(e.value.length > e.maxLength){
			e.value = e.value.slice(0, e.maxLength);
		}
	}
</script>
	
<div class="width">
	<div id="form_container" class="clearfix">
				
		<form name = "frm" action="passFinder.do" method="post">
		
			<div class="step">
			
				<h3 class="main_question">
					<strong style="text-align: left">회원 정보 확인</strong>
				</h3>

				<div class="form-group">
					<input type="text" name="userId" class="form-control required" placeholder = "아이디를 입력해 주세요" maxlength = "15" required>
				</div>
				
				<div class="form-group">
					<input type="text" name="name" class="form-control required" placeholder = "이름를 입력해 주세요" maxlength = "15" required>
				</div>
				
				<div class="form-group">
					<!-- <input type="number" name="birth" class="form-control" placeholder="생년월일을 입력해 주세요 ex) 561231" maxlength = "6" required oninput = "numberLength(this);"> -->
					<input type = "date" name = "birth" class = "form-control" data-placeholder = "우측 아이콘을 클릭해 생년월일을 골라 주세요." required aria-required="ture">
				</div>
				
				<div class="form-group" style = "display: flex; align-items: flex-end;">
					<select name = "localPhoneNumber" class = "form-control" style = "height : 35.8px;">
						<option value = "010">010</option>
						<option value = "053">053</option>
					</select> - 
					<input type="number" name="phone1" class="form-control" placeholder="숫자 4자리" maxlength = "4" required oninput = "numberLength(this);">	-
					<input type="number" name="phone2" class="form-control" placeholder="숫자 4자리" maxlength = "4" required oninput = "numberLength(this);">
				</div>
				
				<button type="submit">확인!</button>
				
			</div>
			
		</form>
				
	</div>
</div>