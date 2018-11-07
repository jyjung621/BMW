package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Category;
import dao.ItemInfo;
import dao.JJYItemCategoryDao;
import oracle.net.aso.s;


public class JJYItemCategoryListAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		try {
			System.out.println("-------start");
			String pageNumIC = request.getParameter("pageNumIC");
			if (pageNumIC == null || pageNumIC.equals("")) {
				pageNumIC = "1";
			}
			System.out.println("-------1");
			String cateNum = request.getParameter("cateNum");
			if (cateNum == null || cateNum.equals("")) {
				cateNum = "0";
			}
			System.out.println("-------2");
			String sortName = request.getParameter("sortName");
			if (sortName == null || sortName.equals("")) {
				sortName = "name";
			}
			System.out.println("-------3");
			String startNum = request.getParameter("startRow");
			if (startNum == null || startNum.equals("")) {
				startNum = "1";
			}
			System.out.println("-------4");
			String endNum = request.getParameter("endRow");
			if (endNum == null || endNum.equals("")) {
				endNum = "10";
			}	
			System.out.println("-------5");
			
			int categoryNo = Integer.parseInt(cateNum);
			int startRow = Integer.parseInt(startNum);
			int endRow = Integer.parseInt(endNum);
			
			int pageNum = Integer.parseInt(pageNumIC);
			int startNo = (pageNum-1) * 10 + 1;
			
			System.out.println("categoryNo -> " + categoryNo);
			System.out.println("startRow -> " + startRow);
			System.out.println("endRow -> " + endRow);
			System.out.println("List sortName -> " + sortName);
			System.out.println("List pageNumIC -> " + pageNumIC);
			
			JJYItemCategoryDao jd = JJYItemCategoryDao.getInstance();
						
			
			List<ItemInfo> itemList = jd.itemCateList(categoryNo, sortName, startRow, endRow);

			System.out.println("itemList -> " + itemList);
			request.setAttribute("itemList", itemList);
			request.setAttribute("startNo", startNo);
			request.setAttribute("pageNumIC", pageNumIC);
			
			System.out.println("ItemCategoryListAct 실행... cateNum=" + cateNum);
		} catch (Exception e) {
			System.out.println("JJYItemCategoryListAct error -> " + e.getMessage());
		}
		
		return "./item/JJYItemCategoryList.jsp";
	}

}
