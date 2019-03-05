package oracle.java.bmw.dao;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Member;

@Repository
public class KJWFindDaoImpl implements KJWFindDao {
	
	@Inject
	SqlSession session;

	@Override
	public String findIdCheck(Member member) {
		System.out.println("KJWFindDaoImpl before...");
		System.out.println("1. " + member.getEmail() + "\n2. " + member.getQuestion() + "\n3. " + member.getAnswer());
		//String result = session.selectOne("findIdCheck",member);
		System.out.println("KJWFindDaoImpl after...");
		/*return (result == null) ? false : true;*/
		return session.selectOne("findIdCheck",member);
	}

	@Override
	public int update_pw(Member member) {
		System.out.println("KJWFindServiceImpl update_pw Start memberId->"+member.getMemberId());
		int kkk = 0;
		try {
			kkk =  session.update("update_pw", member);
			kkk = 1;
		} catch (Exception e) {
			System.out.println("KJWFindServiceImpl update_pw error->"+e.getMessage());
			kkk = -1;
		}
		return kkk;
	}

	@Override
	public boolean findPwCheck(Member member) {
		System.out.println("1. " + member.getMemberId() + "\n2. " + member.getEmail() + "\n3. " + member.getQuestion() + "\n4. " + member.getAnswer());
		String result = session.selectOne("findPwCheck",member);
		return (result == null) ? false : true;
		
	}

}
