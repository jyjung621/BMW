package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemInfo;
import dao.KISItemDao;

public class KISItemSearchProAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String pageNum = request.getParameter("pageNum");
//			int itemNo = Integer.parseInt(request.getParameter("itemNo"));
//			String cateNum = request.getParameter("cateNum");
			String name = request.getParameter("keyword");
//			if (name == null || name.equals("")) {
//				name = "";
//			}

			KISItemDao kd = KISItemDao.getInstance();
			List<ItemInfo> itemSearch = kd.itemSearch(name);
			
//			request.setAttribute("cateNum", cateNum);
			request.setAttribute("pageNum", pageNum);
//			request.setAttribute("itemNo", itemNo);
			request.setAttribute("itemSearch", itemSearch);			
		} catch (Exception e) {
			System.out.println("KISItemSearchProAct -->" + e.getMessage());
		}
		return "./item/KISItemSearchList.jsp";
	}

}
