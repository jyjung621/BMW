package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import dao.Comments;
import dao.FileProcess;
import dao.JJYItemReviewDao;

public class JJYItemReviewWriteProAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		try {
	System.out.println("리뷰 Pro 시작...");
			MultipartRequest multi = FileProcess.getInstance().fileSaveToTemp(request, response);
			
			// ----- memberId
			String memberId = multi.getParameter("memberId");
	System.out.println("memberId get -> " + memberId);
	
			String pageNum = multi.getParameter("pageNum");
	System.out.println("pageNum get -> " + pageNum);
			String pageNumRv = multi.getParameter("pageNumRv");
	System.out.println("pageNumRv get -> " + pageNumRv);
			int mainNo = Integer.parseInt(multi.getParameter("mainNo"));
	System.out.println("mainNo get -> " + mainNo);
			String ref_Table = "ITEMINFO";
			
			
			
			System.out.println("show content --> " );
			System.out.println(multi.getParameter("content"));
			
			Comments comm = new Comments();
			comm.setMainNo(mainNo);
			comm.setIsPublic(multi.getParameter("isPublic"));
			comm.setContent(multi.getParameter("content"));
			comm.setContent2(multi.getParameter("content2"));
			comm.setContent3(multi.getParameter("content3"));
			comm.setRating(Integer.parseInt(multi.getParameter("rating")));
			comm.setMemberId(memberId);
			comm.setRef_Table(ref_Table);
//			Comments comm = new Comments();
//			comm.setMainNo(mainNo);
//			comm.setIsPublic(request.getParameter("isPublic"));
//			comm.setContent(request.getParameter("content"));
//			comm.setContent2(request.getParameter("content2"));
//			comm.setContent3(request.getParameter("content3"));
//			comm.setRating(Integer.parseInt(request.getParameter("rating")));
//			comm.setMemberId(memberId);
//			comm.setRef_Table(ref_Table);
			
			
			JJYItemReviewDao jd = JJYItemReviewDao.getInstance();
//			int result = jd.writeComment(comm);
			int result = jd.writeReview(multi, comm);
			
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
