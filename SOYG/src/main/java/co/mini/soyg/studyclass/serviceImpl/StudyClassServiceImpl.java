package co.mini.soyg.studyclass.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.mini.soyg.studyclass.service.StudyClassService;
import co.mini.soyg.studyclass.vo.StudyClassVO;

@Repository
public class StudyClassServiceImpl implements StudyClassService {

	@Autowired
	private SqlSession Session;
	
	@Override
	public List<StudyClassVO> selectStudyList(StudyClassVO vo) {
		
		return Session.selectList("studyClassMemberList",vo);
	}
	public List<StudyClassVO> classMemberList(StudyClassVO vo) {
		
		return Session.selectList("classMemberList",vo);
	}

	@Override
	public StudyClassVO selectStudyClass(StudyClassVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertStudyClass(StudyClassVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateStudyClass(StudyClassVO vo) {
		int a = 0;

		a = Session.update("updateClass",vo);
		
		return a;
	}

	@Override
	public int deleteStudyClass(StudyClassVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
