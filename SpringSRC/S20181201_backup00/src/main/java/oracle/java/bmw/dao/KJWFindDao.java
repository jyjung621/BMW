package oracle.java.bmw.dao;

import oracle.java.bmw.model.Member;

public interface KJWFindDao {
	// 01. 아이디찾기 (MAPPER와 연동하기 위한 DAO)
	public String findIdCheck(Member member);
	// 02. 비밀번호 변경(임시) 
	int update_pw(Member member);
	public boolean findPwCheck(Member member);

	
	
	
	
}
