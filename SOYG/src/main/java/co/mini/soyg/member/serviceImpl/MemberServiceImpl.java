package co.mini.soyg.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.mini.soyg.member.service.MemberService;
import co.mini.soyg.member.vo.MemberVO;

@Repository
public class MemberServiceImpl implements MemberService {

	
	@Override
	public List<MemberVO> myLikeList(MemberVO vo) {
		// 특정 유저가 좋아요 한 스터디 리스트
		return Session.selectList("myLikeList", vo);
	}
	
	@Autowired
	   private SqlSession Session;
	//loginCheck
	public MemberVO loginCheck(MemberVO vo) {
		
		return Session.selectOne("loginCheck", vo);
	}
	//Id 중복체크
	@Override
	public boolean idCheck(MemberVO vo) {
		boolean b = false;
		String id = Session.selectOne("idCheck", vo);
		
		if(id != null)
			b = true;
		return b;
	}
	//회원수정 >> 주소수정
	public int updateAddress(MemberVO vo) {
		return Session.update("updateAddress",vo);
	}
	//회원수정 >> 비밀번호 체크
	public boolean passwordCheck(MemberVO vo) {
		
		boolean N = false;
		MemberVO mvo = Session.selectOne("passwordCheck",vo);
		
		if(mvo != null)
			N = true;
		
		return N;
	}
	//회원수정 >> 비밀번호 변경
	public int updatePassword(MemberVO vo) {
		return Session.update("updatePassword",vo);
	}
	
	@Override
	public List<MemberVO> selectMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectMember(MemberVO vo) {
		
		return Session.selectOne("memberSelect",vo);
	}

	@Override
	public int insertMember(MemberVO vo) {
		return Session.insert("insertMember", vo);
	}

	@Override
	public int updateMember(MemberVO vo) {
		return Session.update("updateInfo",vo);
	}

	@Override
	public int deleteMember(MemberVO vo) {
		
		return Session.delete("deleteMember",vo);
	}
	
	@Override
	public MemberVO passFinder(MemberVO vo) {
		// TODO 비밀번호 찾기
		return Session.selectOne("passFinder", vo);
	}
	public int dropClass(MemberVO vo) {
		
		return Session.delete("dropClass",vo);
	}

}