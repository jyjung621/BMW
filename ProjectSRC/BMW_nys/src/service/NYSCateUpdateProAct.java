package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Category;
import dao.NYSCateDao;

public class NYSCateUpdateProAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			
			String pageNum = request.getParameter("pageNum");
//			System.out.println("11111111");
//			int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
//			System.out.println("22222222");
//			String name = request.getParameter("name");
//			System.out.println("33333333");
//			String parent = request.getParameter("parent");
//			String isPublic = request.getParameter("isPublic");
			
//			System.out.println(name + "////" + categoryNo + "///" + parent);
			
			
			Category cate = new Category();			
			cate.setCategoryNo(Integer.parseInt(request.getParameter("categoryNo")));
			cate.setName(request.getParameter("name"));
			cate.setParent(request.getParameter("parent"));
			cate.setIsPublic(request.getParameter("isPublic"));
			
//			cate.setCategoryNo(categoryNo);
//			cate.setName(request.getParameter(name));
//			cate.setParent(request.getParameter(parent));
//			cate.setIsPublic(request.getParameter(isPublic));
			
			NYSCateDao yd = NYSCateDao.getInstance();
			int result = yd.update(cate);
			
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("categoryNo", cate.getCategoryNo());
						
		} catch (Exception e) {
			System.out.println("UpdateProAction error -> " + e.getMessage());
		}
		
		return "./item/NYSCateUpdatePro.jsp";
	}
}
