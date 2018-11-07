package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Category;
import dao.ItemInfo;
import dao.KISItemDao;

public class KISItemWriteProAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			int category2 = Integer.parseInt(request.getParameter("category2"));
			String brand = request.getParameter("brand");
			String name = request.getParameter("name");
			String info = request.getParameter("info");
			String strPrice = request.getParameter("price");
			if (strPrice == null || strPrice == "")
				strPrice = "0";
			int price = Integer.parseInt(strPrice);
			String isPublic = request.getParameter("isPublic");
			String memberId = request.getParameter("memberId");

			KISItemDao kd = KISItemDao.getInstance();
			// 카테고리번호
			List<Category> list2 = kd.list();
			request.setAttribute("list2", list2);
			
			// 아이템넘버 먼저 select
			int itemNo = kd.selectItemNo();
			System.out.println("itemNo --> " + itemNo );
					
			ItemInfo item = new ItemInfo();
			item.setItemNo(itemNo);
			item.setCategoryNo(category2);
			item.setBrand(brand);
			item.setName(name);
			item.setInfo(info);
			item.setPrice(price);
			item.setIsPublic(isPublic);
			item.setMemberId(memberId);

			// Iteminfo 테이블에 insert
			int result = kd.insert(item);

			request.setAttribute("itemNo", itemNo);
			request.setAttribute("categoryNo", category2);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);

			// IngtList 테이블에 성분번호 배열값으로 받아서 저장
			String[] receiveValue = request.getParameter("receiveValue").split(",");
//			String strArr = receiveValue.toString();
			System.out.println("receiveValue.length --> " + receiveValue.length);
			if (receiveValue[0] == "") {
				int result3 = 1; // 1일때 성공
				request.setAttribute("result3", result3);
			}else {
				for (int i = 0; i < receiveValue.length; i++) {
					int ingredientNo = Integer.parseInt(receiveValue[i]);
					int result2 = kd.mappingInsert(itemNo, ingredientNo);
					
					request.setAttribute("result2", result2);
				}
			}
			request.setAttribute("itemNo", itemNo);
		} catch (Exception e) {
			System.out.println("제품 WriteProAction error -> " + e.getMessage());
		}

		return "./item/KISItemWritePro.jsp";
	}

}
