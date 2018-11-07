package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JJYReviewDisplay;

public class JJYItemReviewWriteFormAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			int mainNo = Integer.parseInt(request.getParameter("itemNo"));
			String pageNum = request.getParameter("pageNum");
			String pageNumRv = request.getParameter("pageNumRv");
			
			if(pageNumRv == null || pageNumRv == "" ) {
				pageNumRv = "1";
			}
			
//			JJYReviewDisplay reviewDisplay = new JJYReviewDisplay(request, response, null);
			
//			request.setAttribute("reviewDisplay", reviewDisplay);
			request.setAttribute("mainNo", mainNo);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageNumRv", pageNumRv);
			
		} catch (Exception e) {
			System.out.println("ItemReviewWriteFormAct error -> " + e.getMessage());
		}
		
		return "./item/JJYItemReviewWriteForm.jsp";
	}

}
