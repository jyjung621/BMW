package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NYSCateDao;

public class NYSCateDeleteProAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("왓냐???????????????????????????????????????");
			
			String[] val = request.getParameterValues("check");
			String pageNum = request.getParameter("pageNum");
			System.out.println(pageNum);
//			int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
//			System.out.println(categoryNo);
			NYSCateDao yd = NYSCateDao.getInstance();
			
			int result = yd.delete(val);
			
			request.setAttribute("pageNum", pageNum);
//			request.setAttribute("categoryNo", categoryNo);
			request.setAttribute("result", result);
			
			
			
		} catch (Exception e) {
			System.out.println("deleteFormAction error -> " + e.getMessage());
		}
		
		return "./item/NYSCateDeletePro.jsp";
	}

}
