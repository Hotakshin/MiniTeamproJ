package co.mini.soyg.admin.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.mini.soyg.admin.service.ClassService;
import co.mini.soyg.admin.vo.ClassVO;

@Repository
public class ClassServiceImpl implements ClassService {
	@Autowired
	private SqlSession sqlSession;

	// class전체리스트
	@Override
	public List<ClassVO> classSelectList() {
		return sqlSession.selectList("adminClassListSelect");
	}

	// class한건선택
	@Override
	public ClassVO classSelect(int class_code) {
		return sqlSession.selectOne("adminClassSelect", class_code);
	}

	// class삭제
	@Override
	public int classDelete (int class_code) {
		return sqlSession.delete("adminClassDelete", class_code);
	}

	// class 수정
	@Override
	public int classUpdate(ClassVO vo) {
		return sqlSession.update("adminClassUpdate", vo);
	}
	// class 리스트 - 페이징
	@Override
	public List<ClassVO> classListPage(ClassVO vo) {
		return sqlSession.selectList("classListPage", vo);
	}
	//  class 리스트 - 페이징 카운트(10개)
	@Override
	public int classCnt() {
		return sqlSession.selectOne("classCnt");
	}
	// class 검색
	@Override
	public List<ClassVO> adminClassSearch(ClassVO vo) {
		return sqlSession.selectList("adminClassSearch", vo);
	}

	

}
