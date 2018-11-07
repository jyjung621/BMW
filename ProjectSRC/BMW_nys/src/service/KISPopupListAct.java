package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Ingredient;
import dao.IngtList;
import dao.ItemInfo;
import dao.KISIngtDao;
import dao.KISIngtListDao;

public class KISPopupListAct implements CommandProcess {


	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		KISIngtDao kd = KISIngtDao.getInstance();
		KISIngtListDao mappingDao = KISIngtListDao.getInstance();
		try {
			// 화면 타입 : PageType - pop  : 성분팝업 목록 화면
			//					 - ''	: 성분목록화면
			String pageNum = request.getParameter("pageNum");
			String PageType = request.getParameter("PageType");
			String strItemNo = request.getParameter("itemNo");			
			
			int itemNo = request.getParameter("itemNo") == null ? 0 : Integer.parseInt(strItemNo);
			
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			if (PageType == null || PageType.equals("")) {
				PageType = "";
			}
			int totCnt = kd.getTotalCnt();
			int currentPage = Integer.parseInt(pageNum);
//			int pageSize = 10, blockSize = 10;
//			int startRow = (currentPage - 1) * pageSize + 1;
//			int endRow = startRow + pageSize - 1;
//			int startNum = totCnt - startRow + 1;
//			List<Ingredient> list = kd.IngtList(startRow, endRow);
			List<Ingredient> list = kd.IngtList();
//			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
//			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
//			int endPage = startPage + blockSize -1;
//			if (endPage > pageCnt) endPage = pageCnt;
			
			IngtList ingtlist = new IngtList();
			// 1. 최초 제품등록시에는 mappingList 조회 안함 (itemNo가 없으므로)
			// 2. 제품 수정시 itemNo로 성분목록리스트와 비교하여 checked하기 위해 가져옴
			if (itemNo > 0) {
				List<IngtList> mappList = mappingDao.mappingList(itemNo);
				request.setAttribute("ingtlist", ingtlist);
				request.setAttribute("mappList", mappList);
			}
			
			ItemInfo item = new ItemInfo();
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
//			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
//			request.setAttribute("blockSize", blockSize);
//			request.setAttribute("pageCnt", pageCnt);
//			request.setAttribute("startPage", startPage);
//			request.setAttribute("endPage", endPage);
			request.setAttribute("PageType", PageType);
			request.setAttribute("itemNo", itemNo);
			request.setAttribute("item", item);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "./item/KISPopupList.jsp";
	}
}
