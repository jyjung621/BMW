package oracle.java.bmw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import oracle.java.bmw.dao.UtilityDao;
import oracle.java.bmw.model.Comments;
import oracle.java.bmw.model.ItemInfo;
import oracle.java.bmw.model.SaveFiles;
import oracle.java.bmw.service.JJYItemReviewService;
import oracle.java.bmw.service.KISItemService;
import oracle.java.bmw.service.SaveFileService;

@Controller
public class JJYItemReviewController {
	
	@Autowired
	private KISItemService kis;
	@Autowired
	private JJYItemReviewService jrs;
	@Autowired
	private SaveFileService sfs;
	@Autowired
	private UtilityDao ud;
	
	
	@RequestMapping(value="JJYItemReviewWriteForm")
	public String JJYItemReviewWriteForm(int itemNo, String currentPage, String currentPageRv, Model model) {
		ItemInfo item = kis.content(itemNo);
		
		model.addAttribute("item",item);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentPageRv", currentPageRv);
		
		return "item/JJYItemReviewWriteForm";
	}
	
	@RequestMapping(value="JJYItemReviewWritePro", method=RequestMethod.POST)
	public String JJYItemReviewWritePro(Comments comm, Model model, MultipartHttpServletRequest multipartRequest) {
//		String filePath = "\\\\192.168.20.10\\uploadImg";
		String filePath = "D:\\Java_program\\github\\BMW\\uploadImg";
		String formName = "saveFiles";
		
		
		int subNo = ud.getMaxNoForTable("comments", "ITEMINFO", comm.getMainNo());
		System.out.println("subNo --> " + subNo);
		
		comm.setRef_Table("ITEMINFO");
		comm.setSubNo(subNo);
		System.out.println("Before--------------\n" + comm.toString());
		int result = jrs.commentWrite(comm);

		if(result > 0 ) {
//			jis.itemRaingUpdate(comm);
			SaveFiles saveFiles = new SaveFiles();
			saveFiles.setMainNo(comm.getMainNo());
			saveFiles.setSubNo(comm.getSubNo());
			saveFiles.setRef_Table("REVIEW");
			// 서버용
			result = sfs.uploadFileWithServer(saveFiles, filePath, formName, multipartRequest);
			// 로컬용
//			result = sfs.uploadFileWithLocal(saveFiles, formName, multipartRequest);
		
			return "redirect:KISItemContent.do?itemNo="+comm.getMainNo()+"&currentPage="+comm.getCurrentPage()+"&currentPageRv="+comm.getCurrentPageRv();
		} else {
			model.addAttribute("msg","입력실패... 확인 필요...");
			return "forward:JJYItemReviewWriteForm?itemNo="+comm.getMainNo()+"&currentPage="+comm.getCurrentPage()+"&currentPageRv="+comm.getCurrentPageRv();
		}
	}
	
	@RequestMapping(value="JJYItemReviewContent")
	public String JJYItemReviewContent(int itemNo, int reviewNo, String currentPage, String currentPageRv, Model model) {
		
		Comments comm = new Comments();
		comm.setMainNo(itemNo);
		comm.setSubNo(reviewNo);
		comm.setRef_Table("ITEMINFO");
		
		comm = jrs.commentSelect(comm);
		
//		SaveFiles savefile = new SaveFiles();
//		savefile.setMainNo(comm.getMainNo());
//		savefile.setSubNo(comm.getSubNo());
//		savefile.setRef_Table("REVIEW");
//		List<SaveFiles> savefileList = sfs.loadFileWithServer()
		
		model.addAttribute("comm", comm);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentPageRv", currentPageRv);
		return "item/JJYItemReviewContent";
	}
	
	@RequestMapping(value="JJYItemReviewUpdateForm")
	public String JJYItemReviewUpdateForm(int itemNo, int reviewNo, String currentPage, String currentPageRv, Model model) {
		
		Comments comm = new Comments();
		comm.setMainNo(itemNo);
		comm.setSubNo(reviewNo);
		comm.setRef_Table("ITEMINFO");
		
		comm = jrs.commentSelect(comm);
		
		comm.setCurrentPage(currentPage);
		comm.setCurrentPageRv(currentPageRv);
		
		model.addAttribute("comm", comm);
		
		return "item/JJYItemReviewUpdateForm";
	}
	
	@RequestMapping(value="JJYItemReviewUpdatePro", method=RequestMethod.POST)
	public String JJYItemReviewUpdatePro(Comments comm, Model model) {
		
		int result = jrs.commentUpdate(comm);
		
		model.addAttribute("itemNo",comm.getMainNo());
		model.addAttribute("reviewNo",comm.getSubNo());
		model.addAttribute("currentPage", comm.getCurrentPage());
		model.addAttribute("currentPageRv",comm.getCurrentPageRv());
		
		if(result > 0) {				
			return "redirect:JJYItemReviewContent.do";
		} else {
			model.addAttribute("msg", "수정실패.. 확인 필요..");
			return "forward:JJYItemReviewUpdateForm.do";
		}
	}
	
	@RequestMapping(value="JJYItemReviewDeletePro.do")
	public String JJYItemReviewDeletePro(int itemNo, int reviewNo, Model model) {
		Comments comm = new Comments();
		comm.setMainNo(itemNo);
		comm.setSubNo(reviewNo);
		comm.setRef_Table("ITEMINFO");
		
		int result = jrs.commentDelete(comm);
		
		model.addAttribute("itemNo",comm.getMainNo());
		model.addAttribute("reviewNo",comm.getSubNo());
		model.addAttribute("currentPage", comm.getCurrentPage());
		model.addAttribute("currentPageRv",comm.getCurrentPageRv());
		
		if(result > 0) {
			return "redirect:KISItemContent.do";
		} else {
			model.addAttribute("msg", "삭제에 실패...");
			return "forward:JJYItemReviewContent.do";
		}
	}
		
}
