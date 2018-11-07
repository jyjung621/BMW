package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ClipDao;

public class SDBBoardClipAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			System.out.println("BoardClipAct 실행");
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			String title = request.getParameter("title");
			String pageNum = request.getParameter("pageNum");
			HttpSession session = request.getSession();
			String memberId = (String)session.getAttribute("sessionId");
			int result = 0;
			ClipDao cd = ClipDao.getInstance();
			
			int check = cd.check(memberId, boardNo, title);
			System.out.println("check -> " + check);
			 
			if(check <= 0) {
				System.out.println("DB에 스크랩 입력");
				result = cd.insert(memberId, boardNo, title);
			}
			else {
				System.out.println("DB에 스크랩 삭제");
				result = cd.delete3(memberId, boardNo);
			}
	
			request.setAttribute("boardNo", boardNo);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "SDBBoardClipPro.jsp";
	}
}
