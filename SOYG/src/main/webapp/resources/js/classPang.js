$(function() {
	$submitBtn = function(chk) {
		let formData = new FormData($("#imageForm")[0]);
		let class_image = $("#image").val().split("\\");
		let main_image2 = $("#image2").val().split("\\");
		let main_image3 = $("#image3").val().split("\\");
		let main_image4 = $("#image4").val().split("\\");
		let main_image5 = $("#image5").val().split("\\");
		
		
		$("#class_image").val(class_image[2]);
		$("#main_image2").val(main_image2[2]);
		$("#main_image3").val(main_image3[2]);
		$("#main_image4").val(main_image4[2]);
		$("#main_image5").val(main_image5[2]);
		
		$.ajax({
			url: "imageUpload",
			data: formData,
			type: "post",
			contentType: false,
			processData: false,
			success: function(result) {
				console.log(result);
				$("#textFrm").submit();
			},
			error: function(err) {
				console.log(err);
			}
		});
	};
	
	$videoBtnFnc = function(emp) {
			if(emp == "emp") {
				alert("로그인이 필요한 기능입니다.");
				if(confirm("회원가입 페이지로 이동하시겠습니까?")) {
					location.href="memberJoin.do";
				} else {
					return false;
				}
			} else if (emp == "nonEmp") {
				location.href="studyVideo.do";
			}
		};
	
	$delBtnFnc = function(code) {
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href="studyDelete.do?class_code=" + code;
		}
		else {
			return false;
		}
	};
	
	CKEDITOR.replace('class_info', {
		resize_enable: false,
		filebrowserUploadUrl: 'ckUpload',
		width: "735px",
		height: "350px",
	});

	$count = 0;
	$count_1 = 0;
	$count_2 = 0;
	$count_3 = 0;
	$count_4 = 0;
	$count_5 = 0;
	$enCount = ["One", "Two", "Three", "Four", "Five"];

	$addCourse = function(course) {
		console.log(course);
		if (course == "bigCourse") {
			if ($count > 3) {
				alert("더이상 추가할 수 없습니다.");
				alert("최대 5개.");
			} else {
				$count += 1;
				$addHtml = '<div class="card"><div class="card-header" role="tab" id="heading' + $enCount[$count] + '"><h5 class="mb-0"><a data-toggle="collapse" href="#collapse' + $enCount[$count] + '" aria-expanded="true" aria-controls="collapse' + $enCount[$count] + '"><i class="indicator ti-minus"></i><input type="text" name="big_course" /></a></h5></div><div id="collapse' + $enCount[$count] + '" class="collapse show" role="tabpanel" aria-labelledby="heading' + $enCount[$count] + '"><div class="card-body"><input type="text" name="mid_course" />&nbsp;&nbsp;&nbsp;<span>과정제목 추가</span><button type="button" id="addSmallBtn' + $enCount[$count] + '" class="btn btn-primary btnsIze"><small>추가</small></button><div class="list_lessons_2"><ul class="listBody' + $enCount[$count] + '"><li><input type="hidden" name="small_course" value="next_course" /><input type="text" name="small_course" /></li></ul></div></div></div></div><!-- /card -->';
				$("#accordion_lessons").append($addHtml);
				$("#addSmallBtn" + $enCount[$count]).attr("onclick", "$addCourse('smallCourse" + $enCount[$count] + "')");
			}
		} else if (course == "smallCourse") {
			if ($count_1 > 3) {
				alert("더이상 추가할 수 없습니다.");
				alert("최대 5개.");
			} else {
				$count_1 += 1;
				$addHtml = '<li><input type="text" name="small_course"/></li>';
				$(".listBodyOne").append($addHtml);
			}
		} else if (course == "smallCourseTwo") {
			if ($count_2 > 3) {
				alert("더이상 추가 할 수 없습니다.");
				alert("최대 5개.");
			} else {
				$count_2 += 1;
				$addHtml = '<li><input type="text" name="small_course" /></li>';
				$(".listBodyTwo").append($addHtml);
			}
		} else if (course == "smallCourseThree") {
			if ($count_3 > 3) {
				alert("더이상 추가 할 수 없습니다.");
				alert("최대 5개.");
			} else {
				$count_3 += 1;
				$addHtml = '<li><input type="text" name="small_course" /></li>';
				$(".listBodyThree").append($addHtml);
			}
		} else if (course == "smallCourseFour") {
			if ($count_4 > 3) {
				alert("더이상 추가 할 수 없습니다.");
				alert("최대 5개.");
			} else {
				$count_4 += 1;
				$addHtml = '<li><input type="text" name="small_course" /></li>';
				$(".listBodyFour").append($addHtml);
			}
		} else if (course == "smallCourseFive") {
			if ($count_5 > 3) {
				alert("더이상 추가 할 수 없습니다.");
				alert("최대 5개.");
			} else {
				$count_5 += 1;
				$addHtml = '<li><input type="text" name="small_course" /></li>';
				$(".listBodyFive").append($addHtml);
			}
		}

	};
})

function loadImg(value, num) {
	if (value.files && value.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#previewImage" + num).attr("src", e.target.result);
		}
		reader.readAsDataURL(value.files[0]);
	}
}