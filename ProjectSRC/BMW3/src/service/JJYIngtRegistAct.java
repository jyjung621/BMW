package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Ingredient;
import dao.JJYIngtDao;

public class JJYIngtRegistAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		JJYIngtDao jd = JJYIngtDao.getInstance();
		try {
			System.out.println("---ListAction----");
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			
			int totCnt = jd.getTotalCnt();

			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 20, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			List<Ingredient> list = jd.list(startRow, endRow);
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize - 1;
			if(endPage > pageCnt) {
				endPage = pageCnt;
			}
			
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
		
		return "./item/JJYIngtList.jsp";
	}

}
