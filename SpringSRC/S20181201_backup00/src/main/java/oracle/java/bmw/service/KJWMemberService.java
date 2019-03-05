package oracle.java.bmw.service;

import javax.servlet.http.HttpSession;

import oracle.java.bmw.model.Member;

public interface KJWMemberService {
	
	// 01_01. 회원 로그인체크
	public boolean loginCheck(Member member, HttpSession session);
	// 01_02. 회원 로그인 정보
	public Member viewMember(Member member);
	// 02. 회원 로그아웃
	public void logout(HttpSession session);
	// 회원정보 수정 화면
	public Member updateForm(String memberId);
	public void updateMember(Member member);

	Member memberGetInfo(String memberId);

}
