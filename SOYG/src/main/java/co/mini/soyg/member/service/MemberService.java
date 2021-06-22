package co.mini.soyg.member.service;

import java.util.List;

import co.mini.soyg.member.vo.MemberVO;

public interface MemberService {

	List<MemberVO>  selectMemberList();
	MemberVO selectMember( MemberVO vo);
	public int insertMember(MemberVO vo);
	public int updateMember(MemberVO vo);
	public int deleteMember(MemberVO vo);
	public boolean idCheck(MemberVO vo);
	List<MemberVO> myLikeList(MemberVO vo);
	
	// 비밀번호 찾기
	MemberVO passFinder(MemberVO vo);
	
}
