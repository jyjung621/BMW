package oracle.java.bmw.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Member;

@Repository
public class KJWMemberDaoImpl implements KJWMemberDao{
	
	// SqlSession 객체를 스프링에서 생성하여 주입
	// 의존관계 주입(DI), 느슨한 결합
	
	@Inject
	SqlSession session; //mybatis 실행 객체
	
	
	// 01_01. 회원 로그인체크
	@Override
	public boolean loginCheck(Member member) {
		System.out.println("KJWMemberDaoImpl member.loginCheck Before...");
	//	String memberId = session.selectOne("member.loginCheck", member);
		String memberId = session.selectOne("loginCheck", member);
		System.out.println("KJWMemberDaoImpl member.loginCheck After...");
		return (memberId == null) ? false : true;
	}
	
	// 01_02. 회원 로그인 정보
	@Override
	public Member viewMember(Member member) {
		return session.selectOne("viewMember", member);
	}
	
	// 02. 회원 로그아웃
	@Override
	public void logout(HttpSession session) {	
	}

	// update Form
	@Override
	public Member updateForm(String memberId) {
		System.out.println("KJWMemberDAOImpl UPDATE CHECK");
		return session.selectOne("updateForm",memberId);
	}

	@Override
	public void updateMember(Member member) {
		session.update("updateMember",member);
	}

	@Override
	public Member memberGetInfo(String memberId) {
		return session.selectOne("memberGetInfo", memberId);
	}
	


}
