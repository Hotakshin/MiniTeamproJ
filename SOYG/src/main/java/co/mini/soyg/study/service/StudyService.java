package co.mini.soyg.study.service;

import java.util.List;

import co.mini.soyg.study.vo.CategoryVO;
import co.mini.soyg.study.vo.CourseVO;
import co.mini.soyg.study.vo.ImageVO;
import co.mini.soyg.study.vo.StudyInsertVO;
import co.mini.soyg.study.vo.StudyVO;

public interface StudyService {
		// 전체리스트
		List<StudyVO> StudySelectList();

		// 클래스 하나
		StudyVO studySelect(int class_code);

		// 클래스 추가
		int studyInsert(StudyInsertVO vo);

		// 클래스 수정
		int studyUpdate(StudyInsertVO vo);
		
		// 클래스 삭제
		int studyDelete(int class_code);
		
		// 지역코드 가져오기
		List<CategoryVO> locateList();
		
		// 분류코드 가져오기
		List<CategoryVO> fieldList();
		
		// 이미지 가져오기
		ImageVO imageSelect(int class_code);
		
		// class_course 추가
		int courseInsert(CourseVO vo);
		
		// class_list
		List<CourseVO> courseList(int class_code);
}
