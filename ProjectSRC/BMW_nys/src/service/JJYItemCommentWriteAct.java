package service;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JJYCommentDao;

public class JJYItemCommentWriteAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		System.out.println("WriteAction 도착!!!");
		
		// memberID는 session에서 가져오는걸로
		String memberId = request.getParameter("memberId");
		//System.out.println("memberId -> " + memberId);
		
		String commentContent = request.getParameter("commentContent");
		//System.out.println("commentContent -> " + commentContent);
		
		int mainNo = Integer.parseInt(request.getParameter("mainNo"));
		//System.out.println("mainNo -> " + mainNo);
		
		String ref_Table = request.getParameter("ref_Table");
		System.out.println("ref_Table -> " + ref_Table);
		
		String isPublic = request.getParameter("isPublic");
		System.out.println("isPublic -> " + isPublic);
		
		HashMap<String, Object> result = null;
		
		System.out.println("WriteAction 진행중.");
		
		JJYCommentDao jd = JJYCommentDao.getInstance();
		
		try {
			//System.out.println("WriteAction 진행중..");
			result = jd.insertComment(memberId, commentContent, mainNo, ref_Table, isPublic);
			//System.out.println("WriteAction 진행중...");
		} catch (Exception e) {
			System.out.println("ItemCommentWriteAct error -> " + e.getMessage());
		}
		
		request.setAttribute("ReadWrite", 0);
		request.setAttribute("result", result);
		
//		JSONObject jsonObj = new JSONObject(result);
//		PrintWriter pw = response.getWriter();
//		pw.println(jsonObj);
//		
//		System.out.println("result -> " + result);
//		System.out.println("JSONObj -> " + jsonObj);
		
		
		return "./item/JJYSuccessReadWrite.jsp";
	}

}
