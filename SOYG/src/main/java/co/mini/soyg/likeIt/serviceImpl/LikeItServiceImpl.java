package co.mini.soyg.likeIt.serviceImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.mini.soyg.likeIt.service.LikeItService;
import co.mini.soyg.likeIt.vo.LikeItVO;

@Repository
public class LikeItServiceImpl implements LikeItService {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int likeItUpdate(LikeItVO vo) {
		// 좋아요 버튼 클릭 시 likeit 테이블에 정보 입력
		return sqlSession.update("likeItUpdate", vo);
	}

	@Override
	public int likeItUndo(LikeItVO vo) {
		// 좋아요 취소
		return sqlSession.delete("likeItUndo", vo);
	}

	@Override
	public LikeItVO likeItCount(LikeItVO vo) {
		// 좋아요 개수 카운트
		return sqlSession.selectOne("likeItCount",vo);
	}

	@Override
	public boolean likeItCheck(LikeItVO vo) {
		// 좋아요 여부 체크
		boolean check = false;
		
		vo = sqlSession.selectOne("likeCheck", vo);		
		System.out.println(vo);
		
		if(vo != null) {
			// 유저가 좋아요 한 적이 있으면 true로
			check = true;
		} 
		return check;
	}


}
