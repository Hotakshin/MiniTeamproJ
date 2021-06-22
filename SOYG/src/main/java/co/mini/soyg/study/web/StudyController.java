package co.mini.soyg.study.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.mini.soyg.study.service.StudyService;
import co.mini.soyg.study.vo.CourseVO;
import co.mini.soyg.study.vo.StudyInsertVO;

@Controller
public class StudyController {
	@Autowired
	private StudyService dao;

	@RequestMapping("/studySelect.do")
	public String studySelect(Model model, @RequestParam("class_code") int class_code) {
		// class테이블에서 한건
		model.addAttribute("study", dao.studySelect(class_code));

		// class_image에서 한건
		model.addAttribute("image", dao.imageSelect(class_code));

		// class_course List
		model.addAttribute("course", dao.courseList(class_code));

		return "class/classSelect";
	}

	@RequestMapping("/studyVideo.do")
	public String studyVideo() {
		return "class/classVideo";
	}

	@RequestMapping("/classCreateForm.do")
	public String studyCreate(Model model) {
		model.addAttribute("loc", dao.locateList());
		model.addAttribute("field", dao.fieldList());

		return "class/classCreateForm";
	}

	@RequestMapping("/classInsert.do")
	public String studyInsert(Model model, StudyInsertVO svo, HttpSession session,
			CourseVO cvo,
			@RequestParam(value = "big_course", required = true) List<String> big_course,
			@RequestParam(value = "mid_course", required = true) List<String> mid_course,
			@RequestParam(value = "small_course", required = true) List<String> small_course) {
		String userid = (String) session.getAttribute("id");
		svo.setCaptain(userid);

		//class 추가
		dao.studyInsert(svo);
		
		// class_course 추가
		int j = 0;

		for (int i = 0; i < big_course.size(); i++) {
			if (big_course.get(i).isEmpty()) {
				break;
			} else {
				cvo.setBig_course(big_course.get(i));
				cvo.setMid_course(mid_course.get(i));
				while (j < small_course.size()) {
					if (small_course.get(j).equals("next_course")) {
						j++;
						break;
					}
					cvo.setSmall_course(small_course.get(j));
					dao.courseInsert(cvo);
					j++;
				}
			}
		}

		return "redirect:regionList.do?loc_code=" + svo.getLoc_code();
	}

	@RequestMapping("/studyDelete.do")
	public String studyDelete(@RequestParam("class_code") int class_code) {
		dao.studyDelete(class_code);

		return "redirect:home.do";
	}

	// 수정 홈페이지
	@RequestMapping("/studyUpdateForm.do")
	public String studyUpdateForm(Model model, @RequestParam("class_code") int class_code) {
		// class테이블에서 한건
		model.addAttribute("study", dao.studySelect(class_code));

		// class_image에서 한건
		model.addAttribute("image", dao.imageSelect(class_code));

		model.addAttribute("loc", dao.locateList());
		model.addAttribute("field", dao.fieldList());

		return "class/classUpdateForm";
	}
	
	// 수정 기능
	@RequestMapping("/studyUpdate.do")
	public String studyUpdate(Model model, @RequestParam("class_code") int class_code, StudyInsertVO svo) {
		System.out.println(svo);
		svo.setClass_code(class_code);
		dao.studyUpdate(svo);
		
		return "redirect:studySelect.do?class_code=" + class_code;
	}

}
