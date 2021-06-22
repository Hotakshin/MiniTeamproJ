package co.mini.soyg.likeIt.service;

import co.mini.soyg.likeIt.vo.LikeItVO;

public interface LikeItService {
	// likeit table에 업데이트
	int likeItUpdate(LikeItVO vo);
	// like it 취소
	int likeItUndo(LikeItVO vo);
	// like it 여부 확인
	boolean likeItCheck(LikeItVO vo);
	// like it 개수 카운트
	LikeItVO likeItCount(LikeItVO vo);
}
