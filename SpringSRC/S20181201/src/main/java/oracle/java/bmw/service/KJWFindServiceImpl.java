package oracle.java.bmw.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import oracle.java.bmw.dao.KJWFindDao;
import oracle.java.bmw.model.Member;

@Service
public class KJWFindServiceImpl implements KJWFindService {
	
	@Inject
	KJWFindDao findDao;

	@Override
	public String findIdCheck(Member member, HttpSession session) {
		return findDao.findIdCheck(member);
	}

	@Override
	public int update_pw(Member member) {
		System.out.println("KJWFindServiceImpl update_pw Start...");
		return findDao.update_pw(member);
	}

	@Override
	public boolean findPwCheck(Member member) {
		return findDao.findPwCheck(member);
	}

	
	

	
	
//	@Override
//	public boolean findIdCheck(Member member, HttpSession session) {
//		System.out.println("KJWFindServiceImpl findID Check 1...");
//		boolean result = findDao.findIdCheck(member);
//		System.out.println("KJWFindServiceImpl findID Check 2...");
//			
//		return result;
	
	}

