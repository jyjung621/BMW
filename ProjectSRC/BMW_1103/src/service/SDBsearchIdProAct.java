package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.KJWMemberDao;

public class SDBsearchIdProAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("searchIdPro 시작");
			request.setCharacterEncoding("utf-8");
			String email = request.getParameter("email");
			String question = request.getParameter("question");
			String answer = request.getParameter("answer");
			
			System.out.println("email -> " + email);
			System.out.println("question -> " + question);
			System.out.println("answer -> " + answer);
			
			KJWMemberDao KMD = KJWMemberDao.getInstance();
			String result = null;
			result = KMD.searchId(email, question, answer);
			System.out.println("result ID -> " + result);
			
			request.setAttribute("result", result);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "KJWsearchIdPro.jsp";
	}
}
