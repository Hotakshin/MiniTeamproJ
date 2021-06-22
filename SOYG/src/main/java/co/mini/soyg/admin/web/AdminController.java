package co.mini.soyg.admin.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.mini.soyg.admin.service.ClassService;
import co.mini.soyg.admin.vo.ClassVO;
import co.mini.soyg.common.Paging;

@Controller
public class AdminController {
	@Autowired
	private ClassService dao;

	// 관리자페이지
	@RequestMapping("/admin.do")
	public String admin(Model model) {
		return "admin/adminPage";
	}

	// 관리자-class전체리스트 - 페이징
	@RequestMapping("/adminClassList.do")
	public String classList(Model model, HttpServletRequest request) {
		String page = request.getParameter("page");

		if (page == null) page = "1";

		int getNum = Integer.parseInt(page);

		ClassVO vo = new ClassVO();
		vo.setFirstCnt(1 + (getNum - 1) * 10);
		vo.setLastCnt(getNum * 10);
		vo.setTotalCnt(dao.classCnt());

		Paging paging = new Paging();
		paging.setPageNo(getNum);
		paging.setPageSize(10);
		paging.setTotalCount(vo.getTotalCnt());

		model.addAttribute("classes", dao.classListPage(vo));
		model.addAttribute("paging", paging);
		
		//model.addAttribute("classes", dao.classSelectList());
		return "admin/adminClassList";
	}

	// 관리자-리스트 한건 선택
	@RequestMapping("/adminClassSelect.do")
	public String classSelect(Model model, int class_code) {
		model.addAttribute("classes", dao.classSelect(class_code));
		return "admin/adminClassSelect";
	}

	// 관리자-리스트 수정뷰
	@RequestMapping("/adminClassUpdateView.do")
	public String updateView(Model model, int class_code) {
		model.addAttribute("classes", dao.classSelect(class_code));
		return "admin/adminClassUpdate";
	}

	// 관리자-리스트 수정
	@RequestMapping("/adminClassUpdate.do")
	public String classUpdate(Model model, ClassVO vo, @RequestParam("class_code") int class_code) {

		dao.classUpdate(vo);
		model.addAttribute("classes", dao.classSelect(class_code));
		return "admin/adminClassSelect";
	}

	// 관리자-리스트 삭제
	@RequestMapping("/adminClassDelete.do")
	public String classDelete(Model model, @RequestParam("class_code") int class_code) {
		System.out.println(class_code);
		dao.classDelete(class_code);
		model.addAttribute("classes", dao.classSelectList());
		return "admin/adminClassList";
	}

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	// 스터디 검색 기능
	@RequestMapping("/adminClassSearch.do")
	public String adminClassSearch(HttpServletRequest req, ClassVO vo, Model model) {
		
		String searchType = req.getParameter("searchType");	// 검색 옵션
		String keyword = req.getParameter("searchKeyword");	// 검색 내용
		
		if(searchType.equals("option_name")) {// 검색 옵션 클래스이름으로 선택했을 경우
			vo.setClass_name(keyword);
		} else if(searchType.equals("option_city"))  {// 검색 옵션을 지역코드로 선택했을 경우
			vo.setCity(keyword);
		} else if(searchType.equals("option_field")) {
			vo.setField_code(keyword);
		}
		
		model.addAttribute("classes", dao.adminClassSearch(vo));
		
		return "admin/adminClassList";
	}
}
