package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JJYItemCategoryDao;

public class JJYItemCategoryFooterAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			
			String pageNumIC = request.getParameter("pageNumIC");
			if (pageNumIC == null || pageNumIC.equals("")) {
				pageNumIC = "1";
			}
			
			String cateNum = request.getParameter("cateNum");
			if (cateNum == null || cateNum.equals("")) {
				cateNum = "0";
			}
			
			int categoryNo = Integer.parseInt(cateNum);
			String sortName = request.getParameter("sortName");
			if (sortName == null || sortName.equals("")) {
				sortName = "rating";
//				sortName = "name";
			}
			
			
			
	    	JJYItemCategoryDao jd = JJYItemCategoryDao.getInstance();
	    	
			int totCnt = jd.getTotalCnt(categoryNo); 
			int currentPage = Integer.parseInt(pageNumIC);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize -1;
			if (endPage > pageCnt) {
				endPage = pageCnt;
			}
			
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNumIC", pageNumIC);
			request.setAttribute("categoryNo", categoryNo);
			request.setAttribute("sortName", sortName);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("startNum", startNum);
			request.setAttribute("startRow", startRow);
			request.setAttribute("endRow", endRow);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);

		} catch (Exception e) {
			System.out.println("JJYItemCategoryFooterAct error -> " + e.getMessage());
		}
		
		return "./item/JJYItemCategoryFooter.jsp";
	}

}
