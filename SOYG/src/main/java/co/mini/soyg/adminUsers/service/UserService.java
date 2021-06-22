package co.mini.soyg.adminUsers.service;

import java.util.List;

import co.mini.soyg.adminUsers.vo.UserVO;

public interface UserService {

	
	// 페이징
	List<UserVO> userPaging(UserVO vo);
	int userCnt();
	
	// CRUD
	UserVO userSelect(UserVO vo);
	int userInsert(UserVO vo);
	int userUpdate(UserVO vo);
	int userDelete(UserVO vo);
	
	// 검색
	List<UserVO> userSearch(UserVO vo);
	int selectedUserCnt();
}
