package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import javax.servlet.http.HttpSession;

import dao.Comments;
import dao.SDBCommentsDao;

public class SDBCommentsListAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		SDBCommentsDao cd = SDBCommentsDao.getInstance();
		try {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("sessionId");
			System.out.println("id ------> " + id);
			int totCnt = cd.getTotalCnt(id);
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum); // 초기화시 1
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1; // 초기화시 1
			int endRow = startRow + pageSize - 1; // 초기화시 10
			int startNum = totCnt - startRow + 1; // 초기화시 38
			// 초기화시 1 , 10
			List<Comments> list = cd.list(id, startRow, endRow);
			// 페이지수 38 / 10 -> 4
			int pageCnt = (int) Math.ceil((double) totCnt / pageSize);
			int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1; // 초기화시 1
			int endPage = startPage + blockSize - 1; // 초기화시 10
			if (endPage > pageCnt)
				endPage = pageCnt;

			System.out.println("totCnt -------> " + totCnt);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "SDBCommentsList.jsp";
	}

}
