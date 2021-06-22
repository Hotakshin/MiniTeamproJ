package co.mini.soyg.main.service;

import java.util.List;

import co.mini.soyg.main.vo.MainVO;

public interface MainService {
	//최근 등록 스터디 그룹 조회
	List<MainVO> recentlyClassList();
	
	// 메인 지역별 카테고리 리스트
	List<MainVO> mainRegionList();
	// 메인 분야별 카테고리 리스트
	List<MainVO> mainFieldsList();
	
	//지역별 스터디 아이콘 누를 시 처리
	List<MainVO> regionList(MainVO vo);
	//분야별 스터디 아이콘 누를 시 처리
	List<MainVO> fieldsList(MainVO vo);
	
	//지역별 카테고리 리스트
	List<MainVO> regselect();
	//분야별 카테고리 리스트
	List<MainVO> fieldsSelect();
	
	//지역별 카테고리 뷰 간판에 띄워줄 지역 이름
	MainVO regionName(MainVO vo);
	//분야별 카테고리 뷰 간판에 띄워줄 분야명
	MainVO fieldsName(MainVO vo);
	
	// 검색 기능
	List<MainVO> searchClass(MainVO vo);
	
	//유저가 좋아요한 클래스들의 정보
	List<MainVO> likeCheck(MainVO vo);
	
}
