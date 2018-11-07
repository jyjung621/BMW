package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Comments;
import dao.JJYItemReviewDao;

public class JJYItemReviewWriteProAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		try {
			// ----- memberId
			String memberId = request.getParameter("memberId");
			
			
			String pageNum = request.getParameter("pageNum");
			String pageNumRv = request.getParameter("pageNumRv");
			int mainNo = Integer.parseInt(request.getParameter("mainNo"));
			String ref_Table = "ITEMINFO";
			
			Comments comm = new Comments();
			comm.setMainNo(mainNo);
			comm.setIsPublic(request.getParameter("isPublic"));
			comm.setContent(request.getParameter("content"));
			comm.setContent2(request.getParameter("content2"));
			comm.setContent3(request.getParameter("content3"));
			comm.setRating(Integer.parseInt(request.getParameter("rating")));
			comm.setMemberId(memberId);
			comm.setRef_Table(ref_Table);
			
			
			JJYItemReviewDao jd = JJYItemReviewDao.getInstance();
			int result = jd.writeComment(comm);
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageNumRv", pageNumRv);
			request.setAttribute("result", result);
			request.setAttribute("mainNo", mainNo);
			
		} catch (Exception e) {
			System.out.println("JJYItemReviewWriteProAct error -> " + e.getMessage());
		}
		return "./item/JJYItemReviewWritePro.jsp";
	}

}
