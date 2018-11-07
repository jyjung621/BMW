package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import dao.Comments;
import dao.FileProcess;
import dao.JJYItemReviewDao;
import dao.UtilityDao;

public class JJYItemReviewWriteProAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		try {
	System.out.println("리뷰 Write Pro 시작...");
			MultipartRequest multi = FileProcess.getInstance().fileSaveToTemp(request, response);
			
			// ----- memberId
			String memberId = multi.getParameter("memberId");
	System.out.println("memberId get -> " + memberId);
	
			String pageNum = multi.getParameter("pageNum");
	System.out.println("pageNum get -> " + pageNum);
			String pageNumRv = multi.getParameter("pageNumRv");
	System.out.println("pageNumRv get -> " + pageNumRv);
			int mainNo = Integer.parseInt(multi.getParameter("mainNo"));
	System.out.println("mainNo get -> " + mainNo);
			String ref_Table = "ITEMINFO";
			
//			System.out.println("-------------TEST---------------------");
//			String savefiles[] = new String[3];
//			savefiles[0] = multi.getFilesystemName("saveFiles1");
//	System.out.println("saveFiles1 --> " + savefiles[0]);
//			if(savefiles[0] == null || savefiles[0] == "") {
//				savefiles[0] = "0";
//			}
//	System.out.println("saveFiles1 --> " + savefiles[0]);
//			savefiles[1] = multi.getFilesystemName("saveFiles2");
//	System.out.println("savefile2 --> " + savefiles[1]);
//			if(savefiles[1] == null || savefiles[1] == "") {
//				savefiles[1] = "0";
//			}
//	System.out.println("savefile2 --> " + savefiles[1]);
//			savefiles[2] = multi.getFilesystemName("saveFiles3");
//			if(savefiles[2] == null || savefiles[2] == "") {
//				savefiles[2] = "0";
//			}
			
	
	System.out.print("show content --> " );
	System.out.println(multi.getParameter("content"));
			
			Comments comm = new Comments();
			comm.setMainNo(mainNo);
			comm.setSubNo(UtilityDao.getInstance().getMaxNoForTable("comments", "ITEMINFO", mainNo));
			comm.setIsPublic(multi.getParameter("isPublic"));
			comm.setContent(multi.getParameter("content"));
			comm.setContent2(multi.getParameter("content2"));
			comm.setContent3(multi.getParameter("content3"));
			comm.setRating(Integer.parseInt(multi.getParameter("rating")));
			comm.setMemberId(memberId);
			comm.setRef_Table(ref_Table);
	
			
			JJYItemReviewDao jd = JJYItemReviewDao.getInstance();

			int result = jd.writeReview(multi, comm);
			
			// 리뷰가 추가 등록되면 평균 별점 다시 구하기
			result = jd.itemRatingUpdate(mainNo);
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageNumRv", pageNumRv);
			request.setAttribute("result", result);
			request.setAttribute("mainNo", mainNo);
			
		} catch (Exception e) {
			System.out.println("JJYItemReviewWriteProAct error -> " + e.getMessage());
		}
		return "./item/JJYItemReviewWritePro.jsp";
	}

}
