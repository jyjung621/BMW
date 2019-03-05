package oracle.java.bmw.dao;

import javax.servlet.http.HttpSession;

import oracle.java.bmw.model.Member;

public interface KJWMemberDao{
	// 01_01. 회원 로그인체크
	public boolean loginCheck(Member member);
	// 01_02. 회원 로그인 정보
	public Member viewMember(Member member);
	// 02. 회원 로그아웃
	public void logout(HttpSession session);
	// update Form
	public Member updateForm(String memberId);
	public void updateMember(Member member);
	Member memberGetInfo(String memberId);	//멤버 한명의 정보 통으로 가져옴

}
