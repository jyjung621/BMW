package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Category;
import dao.Ingredient;
import dao.ItemInfo;
import dao.KISIngtListDao;
import dao.KISItemDao;

public class KISItemContentAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int itemNo = Integer.parseInt(request.getParameter("itemNo"));
			String pageNum = request.getParameter("pageNum");
			KISItemDao kd = KISItemDao.getInstance();
			KISIngtListDao kd2 = KISIngtListDao.getInstance();
			kd.hits(itemNo);
			ItemInfo item = kd.select(itemNo);
			// 등록된 성분
			List<Ingredient> list = kd2.list(itemNo);
			// 등록된 카테고리
			List<Category> list2 = kd.list();
			
			request.setAttribute("list2", list2);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("item", item);
			request.setAttribute("list", list);
			
		} catch (Exception e) {
			System.out.println("KISItemContentAct -->" + e.getMessage());
		}
		return "./item/KISItemContent.jsp";
	}

}
