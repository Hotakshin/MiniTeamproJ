package co.mini.soyg.admin.service;

import java.util.List;

import co.mini.soyg.admin.vo.ClassVO;

public interface ClassService {
		
	
		List<ClassVO> classListPage(ClassVO vo);	// 전체조회 - 페이징
		int classCnt();								//		페이징카운트
		List<ClassVO> classSelectList();			//전체조회
		ClassVO classSelect(int class_code);		//한건조회
		int classDelete(int class_code);			//삭제
		int classUpdate(ClassVO vo);				//수정
	
		List<ClassVO> adminClassSearch(ClassVO vo);		//검색
		
}
