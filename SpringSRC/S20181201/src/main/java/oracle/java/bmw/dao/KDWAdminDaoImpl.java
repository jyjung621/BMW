package oracle.java.bmw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Member;

@Repository
public class KDWAdminDaoImpl implements KDWAdminDao {

	@Autowired
	private SqlSession session; 
	
	@Override
	public List<Member> KDWAdminlist(Member member) {
		System.out.println("KDWAdminDaoImpl keyword -->" + member.getKeyword());
		System.out.println("KDWAdminDaoImpl search -->" + member.getSearch());
		return session.selectList("memberListByAdmin", member); 
	}
	
//	@Override
//	public List<Member> KDWAdminlist(Member member) {
//		return session.selectList("KDWAdminList", member);
//	}
 
	@Override
	public int KDWAdmintotal(Member member) {
		System.out.println("KDWAdminDaoImpl KDWAdmintotal keyword -->" + member.getKeyword());
		System.out.println("KDWAdminDaoImpl KDWAdmintotal search -->" + member.getSearch());
		System.out.println("Dao total");
		return session.selectOne("totalByAdmin", member);
	}


	@Override
	public Member KDWdetail(String memberId) {
		Member member = session.selectOne("detailByAdmin", memberId);
		return member;
	}

	@Override
	public int KDWupdate(Member member) {
		System.out.println("Dao KDWupdate member.getMemberId()--->" + member.getMemberId());
		System.out.println("Dao KDWupdate member.getMemberId()--->" + member.getPhone());
		return session.update("updateByAdmin", member);
	}
	
//	@Override
//	public List<Member> KDWsearch(Member member) {
//		return session.selectList("KDWsearch", member);
//	}
// 
//	@Override
//	public int KDWKDWsearchtotaltotal2() {
//		System.out.println("Dao total22222");
//		return session.selectOne("total2");
//	}
}
