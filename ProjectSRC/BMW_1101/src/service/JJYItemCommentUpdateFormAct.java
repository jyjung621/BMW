package service;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Comments;
import dao.JJYCommentDao;

public class JJYItemCommentUpdateFormAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		System.out.println("1");
		int commPageNum = Integer.parseInt(request.getParameter("commPageNum"));
		System.out.println("2");
		int mainNo = Integer.parseInt(request.getParameter("mainNo"));
		System.out.println("3");
		int subNo = Integer.parseInt(request.getParameter("subNo"));
		System.out.println("4");
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		System.out.println("5");
		
		String trId = request.getParameter("trId");
		Comments comm = null;
				
		try {
			JJYCommentDao jd = JJYCommentDao.getInstance();
			comm = jd.selectComment(mainNo, subNo, reviewNo);
			System.out.println("여기까지는 성공...");
		} catch (Exception e) {
			System.out.println("ItemCommentUpdateAct error -> " + e.getMessage());
		}
		
		request.setAttribute("UpdateDelete", 1);
		request.setAttribute("comm", comm);
		request.setAttribute("commPageNum", commPageNum);
		request.setAttribute("trId", trId);
		

		return "./item/JJYSuccessUpdateDelete.jsp";
	}

}
