package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Comments;
import dao.JJYItemReviewDao;

public class JJYItemReviewContentAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			int mainNo = Integer.parseInt(request.getParameter("itemNo"));
			int subNo = Integer.parseInt(request.getParameter("reviewNo"));
			String pageNum = request.getParameter("pageNum");
			String pageNumRv = request.getParameter("pageNumRv");
			
			// 리뷰 참조를 위한 ref_table 값 설정
			String ref_table = "ITEMINFO";	// 리뷰:ITEMINFO  리뷰댓글:Review  대댓글:comment
			
			JJYItemReviewDao jd = JJYItemReviewDao.getInstance();
			jd.reviewHits(mainNo, subNo, ref_table);
			
			Comments comm = jd.selectComment(mainNo, subNo, ref_table);
			
			//request.setAttribute("mainNo", mainNo);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageNumRv", pageNumRv);
			request.setAttribute("comm", comm);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "./item/JJYItemReviewContent.jsp";
	}

}
