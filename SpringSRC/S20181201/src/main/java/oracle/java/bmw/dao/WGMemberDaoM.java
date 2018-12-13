package oracle.java.bmw.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Member;



@Repository
public class WGMemberDaoM implements WGMemberDao {

	@Autowired
	private SqlSession session;
	
//	@Override
//	public List<Board> SDBBoardList(Board board) {		
//					xml로 가서    id="selectBoard", 인자로 board 보냄 
//		return session.selectList("selectBoard", board);
//	}
	
	// 회원가입
	@Override
	public int insert(Member member) {	
		int result = 0;
		try {
			member.setBirth(member.getBirth().replace("-", ""));
			result = session.insert("WGinsert", member);
		} catch(Exception e){ 
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	// 아이디 중복체크
	@Override 
	public int confirm(String memberId) {
		return session.selectOne("WGconfirm", memberId);
	}
	
	// 회원가입 후 메일로 승인하면 회원등급변경과 point 테이블에 레코드 생성
	@Override
	public int mailSuccess(Member member) {
		int result = 0;
		try {
			result = session.update("WGmailTest", member);
			if(result == 1) {
				// 가입하면 point 테이블에 0포인트로 첫레코드 입력
				session.insert("WGsetPoint", member);
			}
		} catch(Exception e){ 
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	
	
	
}
