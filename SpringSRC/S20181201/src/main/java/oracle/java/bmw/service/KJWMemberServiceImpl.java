package oracle.java.bmw.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import oracle.java.bmw.dao.KJWMemberDao;
import oracle.java.bmw.model.Member;

@Service
public class KJWMemberServiceImpl implements KJWMemberService {
	
	@Inject
	KJWMemberDao memberDao;
	
	// 01_01. 회원 로그인체크
	@Override
	public boolean loginCheck(Member member, HttpSession session) {
		System.out.println("KJWMemberServiceImpl LOGINCHECK 1...");
		boolean result = memberDao.loginCheck(member);
		System.out.println("KJWMemberServiceImpl LOGINCHECK 2...result->"+result);
		if(result) {	//true일 경우 세션에 등록
			System.out.println("KJWMemberServiceImpl viewMember(member) Before");
		    Member member1 = viewMember(member);	
			System.out.println("KJWMemberServiceImpl viewMember(member) After");
			//viewMember = memberMapper.xml(mybatis)에서 select id 로 씀! -- 지금은 필요한지 모르겠음.
			//세션 변수 등록
			session.setAttribute("memberId", member1.getMemberId());
			session.setAttribute("memberName", member1.getName());
		}
		return result;
	}
	// 01_02. 회원 로그인 정보
	@Override
	public Member viewMember(Member member) {
		return memberDao.viewMember(member);
	}
	
	// 02. 회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		if(session != null) {
			session.invalidate();
		}
	}
	@Override
	public Member updateForm(String memberId) {
		System.out.println("KJWMemberServiceImpl UPDATE CHECK");
		return memberDao.updateForm(memberId);
	}
	@Override
	public void updateMember(Member member) {
		memberDao.updateMember(member);
	}
	@Override
	public Member memberGetInfo(String memberId) {
		return memberDao.memberGetInfo(memberId);
	}
	
	// update form


	
}
