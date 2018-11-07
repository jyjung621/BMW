package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemInfo;
import dao.JJYCommentDao;

public class TestAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String userId = "CommentWriter";
		//int reviewNo = 1;
		try {
			
			int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
			System.out.println("reviewNo -> " + reviewNo);
			
			
			request.setAttribute("reviewNo", reviewNo);
			request.setAttribute("userId", userId);
			
		} catch (Exception e) {
			System.out.println("test error -> " + e.getMessage());
		}
		
		
		return "./item/test.jsp";
	}
	
}
