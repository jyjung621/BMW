package oracle.java.bmw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import oracle.java.bmw.dao.KDWAdminDao;
import oracle.java.bmw.model.Member;


@Service
public class KDWAdminServiceImpl implements KDWAdminService {
	@Autowired
	private KDWAdminDao ad; 
	
	@Override
	public List<Member> KDWAdminlist(Member member) {
		return ad.KDWAdminlist(member); 
	}
//	@Override
//	public List<Member> KDWAdminlist(Member member) {
//		return ad.KDWAdminlist(member);
//	}

	@Override
	public int KDWAdmintotal(Member member) { 
		System.out.println("total start - >");
		return ad.KDWAdmintotal(member);
	}
//	@Override
//	public int KDWAdmintotal() { System.out.println("total start - >");
//		return ad.KDWAdmintotal();
//	}

	@Override
	public Member KDWdetail(String memberId) {
		Member member = ad.KDWdetail(memberId);
		System.out.println("memberId 시작 " + memberId);
		return member;
	}

	
//
	@Override
	public int KDWupdate(Member member) {
	      System.out.println("KDWupdate start.." );
	      System.out.println("KDWupdate grade.." +member.getGrade());
	      
	     
	      return ad.KDWupdate(member);
	}

//	@Override
//	public List<Member> KDWsearch(Member member) {
//		return ad.KDWsearch(member);
//	}
//
//	@Override
//	public int KDWAdmintotal2() { System.out.println("total start - >");
//		return ad.KDWAdmintotal2();
//	}

	
	
	
}
