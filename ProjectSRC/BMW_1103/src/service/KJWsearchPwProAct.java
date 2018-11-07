package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.KJWMemberDao;
import dao.Member;


public class KJWsearchPwProAct implements CommandProcess {

//1. memberId, question, answer를 파라미터로 받고, memberDTO 세팅
//2. String result = searchPw(member)
//3. memberId, question, answer 저장하고 searchPwPro.jsp 리턴
	
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("KJWsearchPwProAct start");
			request.setCharacterEncoding("utf-8");
	//		Member1 member = new Member1();
			Member member = new Member();
			System.out.println("KJWsearchPwProAct member...");
			member.setMemberId(request.getParameter("memberId"));
			member.setQuestion(request.getParameter("question"));
			member.setAnswer(request.getParameter("answer"));	
			KJWMemberDao md = KJWMemberDao.getInstance();
			String passwd = md.searchPw(member);
			
			System.out.println("KJWsearchPwProAct passwd->"+passwd);
			
	     	request.setAttribute("passwd", passwd);
			
			
			
		}catch(Exception e) {System.out.println(e.getMessage());	}
		return "KJWsearchPwPro.jsp";
		
	}

}
