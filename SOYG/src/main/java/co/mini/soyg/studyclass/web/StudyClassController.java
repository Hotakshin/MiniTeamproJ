package co.mini.soyg.studyclass.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.mini.soyg.studyclass.service.StudyClassService;
import co.mini.soyg.studyclass.serviceImpl.StudyClassServiceImpl;
import co.mini.soyg.studyclass.vo.StudyClassVO;

@Controller
public class StudyClassController {

	@Autowired
	private StudyClassServiceImpl service;
	
	@Autowired
	private StudyClassService dao;
	
	@RequestMapping("/updateClass.do")
	public String updateClass(HttpServletRequest request, HttpServletResponse response,StudyClassVO vo) throws IOException {
		
		String class_code = request.getParameter("class_code");
		String class_name = request.getParameter("class_name");
		String class_info = request.getParameter("class_info");
		String class_time = request.getParameter("class_time");
		String class_personnel = request.getParameter("class_personnel");
		String class_startchk = request.getParameter("class_startchk");
		
		vo.setClass_code(Integer.parseInt(class_code));
		vo.setClass_name(class_name);
		vo.setClass_info(class_info);
		vo.setClass_startchk(class_startchk);
		vo.setClass_personnel(Integer.parseInt(class_personnel));
		vo.setClass_time(class_time);
		
		int val = dao.updateStudyClass(vo);
		
		response.getWriter().print(val);
		
		return null;
	}
	
}
