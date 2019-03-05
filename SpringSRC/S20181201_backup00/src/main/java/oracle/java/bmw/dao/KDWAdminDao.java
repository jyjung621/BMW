package oracle.java.bmw.dao;

import java.util.List;

import oracle.java.bmw.model.Member;




public interface KDWAdminDao {
	List<Member> KDWAdminlist(Member member);
//	List<Member> KDWAdminlist(Member member);
	int KDWAdmintotal(Member member);
	Member KDWdetail(String memberId);

	
	int KDWupdate(Member member);
	
//	List<Member> KDWsearch(Member member);
//	int KDWAdmintotal2();
}
