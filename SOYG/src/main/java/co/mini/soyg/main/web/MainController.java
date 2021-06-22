package co.mini.soyg.main.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.mini.soyg.main.service.MainService;
import co.mini.soyg.main.vo.MainVO;

@Controller
public class MainController {
	@Autowired
	private MainService dao;
	
	@RequestMapping("/regionList.do")
	public String regionList(HttpServletRequest request, MainVO vo, Model model) {
		HttpSession session = request.getSession();
		
		//지역별 스터디 리스트 뷰
		String userId = (String) session.getAttribute("id");
		
		vo.setUserId(userId);
		// 리스트 정보
		model.addAttribute("regionList", dao.regionList(vo));
		// 카테고리 리스트(pull-down menu)
		model.addAttribute("regSelect", dao.regselect());
		//간판에 지역 이름 달아주자
		model.addAttribute("regionName", dao.regionName(vo));
		return ("main/regionList");
	}
	
	@RequestMapping("/regionGrid.do")
	public String regionGrid(HttpServletRequest request, MainVO vo, Model model) {
		// 지역별 그리드 리스트
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		vo.setUserId(userId);
		// 리스트 정보
		model.addAttribute("regionList", dao.regionList(vo));
		// 카테고리 리스트(pull-down menu)
		model.addAttribute("regSelect", dao.regselect());
		//간판에 지역 이름 달아주자
		model.addAttribute("regionName", dao.regionName(vo));
		return ("main/regionGridList");
	}
	
	@RequestMapping("/fieldsList.do")
	public String fieldsList(HttpServletRequest request, MainVO vo, Model model) {
		//분야별 스터디 리스트 뷰
		System.out.println("분야코드 : "+vo.getField_code());
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		vo.setUserId(userId);
		// 리스트 정보
		model.addAttribute("fieldsList", dao.fieldsList(vo));
		//카테고리 리스트
		model.addAttribute("fieldsSelect", dao.fieldsSelect());
		//간판에 분야명 달아주자
		model.addAttribute("fieldsName", dao.fieldsName(vo));
		return ("main/fieldsList");
	}
	
	@RequestMapping("/fieldsGrid.do")
	public String fieldsGrid(HttpServletRequest request, MainVO vo, Model model) {
		// 분야별 그리드 리스트
		System.out.println(vo.getField_code());
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		vo.setUserId(userId);
		//리스트 정보
		model.addAttribute("fieldsList", dao.fieldsList(vo));
		//카테고리 리스트
		model.addAttribute("fieldsSelect", dao.fieldsSelect());
		//간판에 분야명 달아주자
		model.addAttribute("fieldsName", dao.fieldsName(vo));
		return ("main/fieldsGridList");
	}
	
	@RequestMapping("/searchClass.do")
	public String searchClass(HttpServletRequest request, MainVO vo, Model model) {
		HttpSession session = request.getSession();
		System.out.println(vo.getSearch());
		String userId = (String) session.getAttribute("id");
		
		vo.setUserId(userId);
		//메인에서 스터디 검색
		model.addAttribute("searchClass", dao.searchClass(vo));
		session.setAttribute("searchSession", vo.getSearch());
		return ("main/searchView");
	}
	
	@RequestMapping("/searchGrid.do")
	public String searchGrid(HttpServletRequest request, MainVO vo, Model model) {
		// 검색결과 그리드 리스트
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		vo.setUserId(userId);
		model.addAttribute("searchClass", dao.searchClass(vo));
		return ("main/searchGrid");
	}
}
