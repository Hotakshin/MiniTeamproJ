package co.mini.soyg.studyclass.service;

import java.util.List;

import co.mini.soyg.studyclass.vo.StudyClassVO;

public interface StudyClassService {

	List<StudyClassVO> selectStudyList(StudyClassVO vo);
	StudyClassVO selectStudyClass(StudyClassVO vo);
	public int insertStudyClass(StudyClassVO vo);
	public int updateStudyClass(StudyClassVO vo);
	public int deleteStudyClass(StudyClassVO vo);
	
	
}
