package co.mini.soyg.study.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.mini.soyg.study.service.StudyService;
import co.mini.soyg.study.vo.CategoryVO;
import co.mini.soyg.study.vo.CourseVO;
import co.mini.soyg.study.vo.ImageVO;
import co.mini.soyg.study.vo.StudyInsertVO;
import co.mini.soyg.study.vo.StudyVO;

@Repository
public class StudyServiceImpl implements StudyService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<StudyVO> StudySelectList() {

		return sqlSession.selectList("getStudyList");
	}
	
	@Override
	public StudyVO studySelect(int class_code) {

		return sqlSession.selectOne("getStudySelect", class_code);
	}

	@Override
	public int studyInsert(StudyInsertVO vo) {
		
		sqlSession.insert("insertClass", vo);
		sqlSession.insert("insertClassImage", vo);
		
		return 0;
	}

	@Override
	public int studyUpdate(StudyInsertVO vo) {
		return sqlSession.update("updateStudy", vo);
	}

	@Override
	public int studyDelete(int class_code) {
		return sqlSession.delete("deleteStudy", class_code);
	}

	@Override
	public List<CategoryVO> locateList() {
		return sqlSession.selectList("getLocList");
	}

	@Override
	public List<CategoryVO> fieldList() {
		return sqlSession.selectList("getFieldList");
	}

	@Override
	public ImageVO imageSelect(int class_code) {
		return sqlSession.selectOne("getImageSelect", class_code);
	}
	
	@Override
	public int courseInsert(CourseVO vo) {
		return sqlSession.insert("addCourseInsert", vo);
	}
	
	@Override
	public List<CourseVO> courseList(int class_code) {
		return sqlSession.selectList("getCourseList", class_code);
	}
}
