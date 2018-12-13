package oracle.java.bmw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.bmw.model.Comments;
import oracle.java.bmw.model.CommentsJJY;
import oracle.java.bmw.model.ItemInfo;
import oracle.java.bmw.model.ItemInfoJJY;
import oracle.java.bmw.service.JJYItemReviewService;
import oracle.java.bmw.service.JJYItemService;
import oracle.java.bmw.service.KISItemService;

@Controller
public class JJYItemReviewController {
	
	@Autowired
	private KISItemService kis;
	@Autowired
	private JJYItemService jis;
	@Autowired
	private JJYItemReviewService jrs;
	
	
	@RequestMapping(value="JJYItemReviewWriteForm")
	public String JJYItemReviewWriteForm(int itemNo, String currentPage, String currentPageRv, Model model) {
		ItemInfo item = kis.content(itemNo);
		
		model.addAttribute("item",item);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentPageRv", currentPageRv);
		
		return "item/JJYItemReviewWriteForm";
	}
	
	@RequestMapping(value="JJYItemReviewWritePro", method=RequestMethod.POST)
	public String JJYItemReviewWritePro(Comments comm, String currentPage, String currentPageRv, Model model) {
		
		comm.setRef_Table("ITEMINFO");
		int result = jrs.commentWrite(comm);
		if(result > 0 ) {
//			jis.itemRaingUpdate(comm);
			return "redirect:KISItemContent.do?itemNo="+comm.getMainNo()+"&currentPage="+currentPage+"&currentPageRv="+currentPageRv;
		} else {
			model.addAttribute("msg","입력실패... 확인 필요...");
			return "forward:JJYItemReviewWriteForm?itemNo="+comm.getMainNo()+"&currentPage="+currentPage+"&currentPageRv="+currentPageRv;
		}
	}
	
	@RequestMapping(value="JJYItemReviewContent")
	public String JJYItemReviewContent(int itemNo, int reviewNo, String currentPage, String currentPageRv, Model model) {
		
		CommentsJJY comm = new CommentsJJY();
		comm.setMainNo(itemNo);
		comm.setSubNo(reviewNo);
		comm.setRef_Table("ITEMINFO");
		
		comm = jrs.commentSelect(comm);
		
		model.addAttribute("comm", comm);
		
		return "item/JJYItemReviewContent";
	}
}
