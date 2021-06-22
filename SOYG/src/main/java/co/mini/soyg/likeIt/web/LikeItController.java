package co.mini.soyg.likeIt.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.mini.soyg.likeIt.service.LikeItService;
import co.mini.soyg.likeIt.vo.LikeItVO;

@Controller
public class LikeItController {
	@Autowired
	private LikeItService dao;
	
	@ResponseBody
	@RequestMapping("/likeItEdit.do")
	public int likeItUpdate(HttpServletRequest request, LikeItVO vo, Model model) {
		// 좋아요 버튼 누르면 실행
		String class_code = request.getParameter("c_code");
		String userid = request.getParameter("id");

		vo.setClass_code(Integer.parseInt(class_code));
		vo.setUserId(userid);
		
		System.out.println("likeItUpdate test : "+vo.getClass_code() +","+ vo.getUserId());
		
		boolean check = dao.likeItCheck(vo);
		System.out.println(check);
		
		int result =0;
		LikeItVO lvo = new LikeItVO();
		
		if (check == false) {
		// 사용자가 해당 스터디를 좋아요한 적이 없는 경우
		// 좋아요가 성립되고 좋아요 개수가 증가
			model.addAttribute("likeItUpdate", dao.likeItUpdate(vo));
			lvo = dao.likeItCount(vo);
			System.out.println(lvo);
			result = 1;
		} else {
		// 사용자가 해당 스터디를 좋아요한 적이 있는 경우
		// 좋아요를 취소하고 좋아요 개수도 감소
			model.addAttribute("likeItUndo", dao.likeItUndo(vo));
			lvo = dao.likeItCount(vo);
			System.out.println(lvo);
			result = 0;
		}
		return result;
	}
	
}
