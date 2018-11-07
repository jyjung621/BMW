package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Clip;
import dao.SaveFiles;
import dao.SaveFilesDao;

public class HWKMyPageFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			/*String id = (String)session.getAttribute("loginUserId");*/
			String id = (String)session.getAttribute("sessionId");
			//String pageNum = request.getParameter("pageNum");
			
			SaveFilesDao fd = SaveFilesDao.getInstance();				//
//			count = fd.getCnt(boardNo);
//			List<SaveFiles> savefiles = fd.list(boardNo, 0, "board", 1);//
//			List<SaveFiles> savefiles = fd.list(id, "MEMBER");
			
//			request.setAttribute("savefiles", savefiles);
			System.out.println("여긴 오냐!!!!");
			int count = Integer.parseInt(fd.list(id));
			System.out.println("프로필 사진 카운트 -> " + count);
			SaveFiles savefile = new SaveFiles(); 
			savefile = fd.memPic(count);
			
			request.setAttribute("savefile", savefile);
			request.setAttribute("count", count);
			
			
		} catch(Exception e) { System.out.println(e.getMessage()); }   // /ch16/list.do
		return "/member/KJWMypageIndex.jsp";
		
	}

}
