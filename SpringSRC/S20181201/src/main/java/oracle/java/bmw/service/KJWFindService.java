package oracle.java.bmw.service;

import javax.servlet.http.HttpSession;

import oracle.java.bmw.model.Member;

public interface KJWFindService {

	//01. 아이디찾기 체크
	public String findIdCheck(Member member, HttpSession session);
	//02. 임시비번 업데이트
	int update_pw(Member member);
	//03. 임시비번 보내기 위한 정보확인
	public boolean findPwCheck(Member member);


	
	
}
