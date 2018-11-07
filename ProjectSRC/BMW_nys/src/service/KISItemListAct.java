package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Category;
import dao.ItemInfo;
import dao.JJYItemCategoryDao;

public class KISItemListAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JJYItemCategoryDao jd = JJYItemCategoryDao.getInstance();
		try {
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			String cateNum = request.getParameter("cateNum");
			if (cateNum == null || cateNum.equals("")) {
				cateNum = "0";
			}
			
			int categoryNo = Integer.parseInt(cateNum);
			String sortName = request.getParameter("sortName");
			if (sortName == null || sortName.equals("")) {
				sortName = "0";
			}
			int sortNum = Integer.parseInt(sortName);
			
			int totCnt = jd.getTotalCnt(categoryNo); 
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
//			int startNum = totCnt - startRow + 1;
			int startNum = (currentPage-1) * 10 + 1;
			List<ItemInfo> itemList = jd.itemCateList(categoryNo, sortNum, startRow, endRow);
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize -1;
			if (endPage > pageCnt) endPage = pageCnt;
			List<Category> cateAll = jd.cateAll();
			request.setAttribute("cateAll", cateAll);
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", itemList);
			request.setAttribute("categoryNo", categoryNo);
//			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "./item/KISItemList.jsp";
	}

}
