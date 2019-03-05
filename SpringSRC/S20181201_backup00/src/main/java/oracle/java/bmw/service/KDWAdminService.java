package oracle.java.bmw.service;

import java.util.List;

import oracle.java.bmw.model.Member;





public interface KDWAdminService {
	List<Member> KDWAdminlist(Member member);
//	List<Member> KDWAdminlist(Member member);

	int KDWAdmintotal(Member member); // AdminControl의 total

	Member KDWdetail(String memberId);
//	List<Member> KDWdetail(String memberId);

	int KDWupdate(Member member);
	
	// search만들려고 작선한것
//	int KDWAdmintotal2();
//	List<Member> KDWsearch(Member member);
	
	
}
