package co.mini.soyg.adminUsers.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.mini.soyg.adminUsers.service.UserService;
import co.mini.soyg.adminUsers.vo.UserVO;
import co.mini.soyg.common.Paging;

@Controller
public class UserController {

	@Autowired
	private UserService dao;
	
	
	// 에러 페이지 (비정상적 접근 시)
	@RequestMapping("errorPage.do")
	public String errorPage() {
		
		return "adminUserControl/errorPage";
	}
	
	// 전체 조회 (페이징)
	@RequestMapping("/userListPaging.do")
	public String userListPaging(Model model, HttpServletRequest request) {
		
		String page = request.getParameter("page");
		
		if(page == null) page = "1";
		
		int getNum = Integer.parseInt(page);
		
		UserVO vo = new UserVO();
		vo.setFirstCnt(1 + (getNum -1) * 10);
		vo.setLastCnt(getNum * 10);
		vo.setTotalCnt(dao.userCnt());
		
		Paging paging = new Paging();
		paging.setPageNo(getNum);
		paging.setPageSize(10);
		paging.setTotalCount(vo.getTotalCnt());
		
		model.addAttribute("users", dao.userPaging(vo));
		model.addAttribute("paging", paging);
		
		return "adminUserControl/userList";
	}

	
	// 회원 하나 조회
	@RequestMapping("/userSelect.do")
	public String userSelect(UserVO vo, Model model) {
		// @requestparam()~~ = httpsrequest ㅇㅇ
		
//		vo.setUserID(userID);
		
		model.addAttribute("user", dao.userSelect(vo));
				
		return "adminUserControl/userUpdatePage";	// 유저 수정 페이지로 이동
	}

	
	// 회원 정보 수정
	@RequestMapping("/userUpdate.do")
	public String userUpdate(HttpServletRequest req, UserVO vo) {
		
		int result = 0;
		
		// 아이디는 변경 x
		String user = req.getParameter("exID");
		
		String name = req.getParameter("userName");
		String passwd = req.getParameter("iPwd");
		String randomPwd = req.getParameter("randomPwd");
		String birth = req.getParameter("birth");
		String gender = req.getParameter("gender");
		
		// 전화번호
		String localPhone = req.getParameter("localPhoneNumber");
		String phoneNumber1 = req.getParameter("phoneNumber1");
		String phoneNumber2 = req.getParameter("phoneNumber2");
		String phone = localPhone + "-" + phoneNumber1 + "-" + phoneNumber2;
		
		// 이메일
		String newEmail = req.getParameter("new_email");
		String localEmail = req.getParameter("localEmail");
		String fullEmail = newEmail + localEmail;

		// 주소
		String pastCode = req.getParameter("postCode");
		String roadAddr = req.getParameter("roadAddr");
		String jibunAddr = req.getParameter("bunAddr");
		String detailAddr = req.getParameter("detailAddr");
		String extraAddr = req.getParameter("extraAddr");
		String fullAddr = pastCode + " " + roadAddr + " " + jibunAddr + " " + 
						detailAddr + extraAddr;
		
		if (name.equals("")) {
			name = req.getParameter("exName");
		}
		
		if (phoneNumber1.equals("") || phoneNumber2.equals("")) {
			phone = req.getParameter("exPhone");
		}
		
		if (newEmail.equals("") || localEmail.equals("선택")) {
			fullEmail = req.getParameter("old_email");
		}
		
		if (pastCode.equals("") && roadAddr.equals("") && jibunAddr.equals("") && detailAddr.equals("") && extraAddr.equals("")) {
			fullAddr = req.getParameter("exAddr");
		}
		
		if (passwd.equals("") && randomPwd.equals("")) {
			
			passwd = req.getParameter("exPwd");
		} else if (!randomPwd.equals("")) {
			
			passwd = randomPwd;
		}
		
		if (birth.equals("")) {
			birth = req.getParameter("exBirth");
		}
		
		if (gender.equals("")) {
			gender = req.getParameter("exGender");
		}
		
		vo.setAddress(fullAddr);
		vo.setEmail(fullEmail);
		vo.setPassword(passwd);
		vo.setUserID(user);
		vo.setPhone(phone);
		vo.setName(name);
		vo.setBirth(birth);
		vo.setGender(gender);
		
		result = dao.userUpdate(vo);
		
		if (result != 0) {
			
			System.out.println("유저 정보 수정 : " + result + "건 완료.");
			System.out.println(vo.getUserID() + "의 비밀번호 값 : " + vo.getPassword());
		} else {
			
			System.out.println("수정 안 됨.");
			System.out.println("수정 쿼리 값 확인 : " + vo.toString());
		}
		
//		model.addAttribute("users", dao.userList()); 없어도 redirect쓰면 괜찮네

		return "redirect:userListPaging.do";	// redirect:/
		
//		return "adminUserControl/userList"; 주소창 이상한 놈
//		return "adminUserControl/userUpdatePage"; 못 찾아가는 놈
	}
	
	
	// 회원 탈퇴
	@RequestMapping("/userDelete.do")
	public String userDelete(HttpServletRequest req, UserVO vo) {
		
		int result = 0;
//		String user = req.getParameter("userID");
		
//		vo.setUserID(user);
		result = dao.userDelete(vo);
		
		if (result != 0) {
			
			System.out.println("유저 삭제 : " + result + "건 완료.");
		} else {
			
			System.out.println("삭제 안 됨.");
		}
		
		return "adminUserControl/userList";	// 에이잭스 쓰는 순간 이거는 의미 없어진다.
	}
	
	
	// 회원 검색 기능
	@RequestMapping("userSearch.do")
	public String userSearch(HttpServletRequest req, UserVO vo, Model model) {
		
		String searchType = req.getParameter("searchType");	// 검색 옵션
		String keyword = req.getParameter("searchKeyword");	// 검색 내용
		
		if(searchType.equals("option_id")) {// 검색 옵션을 아이디로 선택했을 경우
			
			vo.setUserID(keyword);
		} else {// 검색 옵션을 이름으로 선택했을 경우
			
			vo.setName(keyword);
		}
		
		model.addAttribute("users", dao.userSearch(vo));
		
		return "adminUserControl/userSelectedList";
	}
}
