package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Comments;
import dao.JJYItemReviewDao;
import service.CommandProcess;

public class JJYItemReviewUpdateProAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("utf-8");
			
			String pageNum = request.getParameter("pageNum");
			String pageNumRv = request.getParameter("pageNumRv");
			
			Comments comm = new Comments();

			comm.setMainNo(Integer.parseInt(request.getParameter("mainNo")));
			comm.setSubNo(Integer.parseInt(request.getParameter("subNo")));
			comm.setRef_Table(request.getParameter("ref_Table"));
			comm.setRating(Integer.parseInt(request.getParameter("rating")));
			comm.setContent(request.getParameter("content"));
			comm.setContent2(request.getParameter("content2"));
			comm.setContent3(request.getParameter("content3"));
			comm.setIsPublic(request.getParameter("isPublic"));
			
			JJYItemReviewDao jd = JJYItemReviewDao.getInstance();
			int result = jd.updateComments(comm);
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageNumRv", pageNumRv);
			request.setAttribute("result", result);
			request.setAttribute("comm", comm);
			
		} catch (Exception e) {
			System.out.println("ItemReviewUpdatePro error -> " + e.getMessage());
		}
		
		return "./item/JJYItemReviewUpdatePro.jsp";
	}

}
