package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Category;
import dao.ItemInfo;
import dao.KISItemDao;

public class KISItemUpdateProAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");

			int itemNo = Integer.parseInt(request.getParameter("itemNo"));
			String strCate = request.getParameter("category2");
			if (strCate == null || strCate == "")
				strCate = request.getParameter("categoryNo");
			int category2 = Integer.parseInt(strCate);
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
			request.setAttribute("categoryNo", category2);

			ItemInfo item = new ItemInfo();
			item.setItemNo(itemNo);
			item.setCategoryNo(category2);
			item.setBrand(brand);
			item.setName(name);
			item.setInfo(info);
			item.setPrice(price);
			item.setIsPublic(isPublic);
			item.setMemberId(memberId);

			int result = kd.update(item);

			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("itemNo", item.getItemNo());			
			
			// IngtList 테이블에 성분번호 배열값으로 받아서 저장
			String[] receiveValue = request.getParameter("receiveValue").split(",");
			//String strArr = receiveValue.toString();
			if (receiveValue == null || receiveValue[0] == "") {
				int result3 = 1; // 1일때 성공
				request.setAttribute("result3", result3);
			} else {
				int result2 = kd.mappingDelete(itemNo);
				int result3 = 0;
				for (int i = 0; i < receiveValue.length; i++) {
					int ingredientNo = Integer.parseInt(receiveValue[i]);
					// 성분 체크한 값이 있다면 디비에 등록된 값 삭제 후 저장
					result3 = kd.mappingInsert(itemNo, ingredientNo);
				}
				if (result2 > 0 && result3 > 0) {
					result3 = 1;
				}
				request.setAttribute("result3", result3);
				
			}
			request.setAttribute("itemNo", itemNo);
		} catch (Exception e) {
			System.out.println("제품 UpdateProAction error -> " + e.getMessage());
		}
		return "./item/KISItemUpdatePro.jsp";
	}

}
