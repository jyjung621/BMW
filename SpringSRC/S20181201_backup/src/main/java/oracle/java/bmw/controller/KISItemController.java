package oracle.java.bmw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.bmw.model.Category;
import oracle.java.bmw.model.Comments;
import oracle.java.bmw.model.ItemInfo;
import oracle.java.bmw.service.JJYItemReviewService;
import oracle.java.bmw.service.KISItemService;
import oracle.java.bmw.service.Paging;

@Controller
public class KISItemController {
	
	@Autowired
	private KISItemService kis;
	@Autowired
	private JJYItemReviewService jrs;
	
	@RequestMapping(value="KISItemList")
	public String KISItemList(ItemInfo item, String currentPage, Model model) {
		int total = kis.KISItemTotal();
		System.out.println("Itemtotal -> " + total);
		Paging pg = new Paging(total, currentPage);
		item.setStart(pg.getStart());
		item.setEnd(pg.getEnd());
		List<ItemInfo> list = kis.itemList(item);
		
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		model.addAttribute("itemTotal", total);
		
		return "/item/KISItemList";
	}
	
	@RequestMapping(value="KISItemContent")
	public String KISItemContent(int itemNo, String currentPage, String currentPageRv, Model model) {
		kis.upHits(itemNo); // 조회수
		ItemInfo item = kis.content(itemNo);
		
		// Review
		Comments comm = new Comments();
		comm.setMainNo(itemNo);
		comm.setRef_Table("ITEMINFO");
		int reviewTotal = jrs.JJYItemReviewTotal(comm);
		System.out.println("Reviewtotal -> " + reviewTotal);
		
		Paging pgRv = new Paging(reviewTotal, currentPageRv);
		comm.setStart(pgRv.getStart());
		comm.setEnd(pgRv.getEnd());
		
		List<Comments> comms = jrs.commentList(comm);
		
		model.addAttribute("item", item);
		model.addAttribute("comms", comms);
		model.addAttribute("pgRv", pgRv);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("reviewTotal", reviewTotal);
		
		return "/item/KISItemContent";
	}

	
	@RequestMapping(value="KISItemWriteForm")
	public String KISItemWriteForm(Model model) {
		String regDate = kis.regDate();
		model.addAttribute("regDate", regDate);
		List<ItemInfo> list = kis.itemList();
		model.addAttribute("cate", list);
		List<Category> catelist = kis.select();
		List<Category> childCate = kis.select();
		model.addAttribute("catelist", catelist);
		model.addAttribute("childCate", childCate);
		return "/item/KISItemWriteForm";
	}
	
	@RequestMapping(value="KISItemWrite", method=RequestMethod.POST)
	public String KISItemWrite(ItemInfo item, Category cate, Model model) {
		System.out.println("KISItemWrite() 시작  ");
		int result = kis.insert(item, cate);
		return "redirect:KISItemList.do";
//		if(result > 0) {
//			return "redirect:KISItemList.do";
//		} else {
//			model.addAttribute("msg", "입력실패");
//			return "forward:KISItemWriteForm.do";
//		}
	}
	
	@RequestMapping(value="KISItemCateSel", method=RequestMethod.POST)
	public String KISItemCateSel(Category cate, Model model) {
		List<Category> list = kis.childSelect(cate);
		return "redirect:KISItemCateSel.do";
	}
	
//	@RequestMapping(value="KISIngtUpdateForm")
//	public String KISIngtUpdate(int ingredientNo, Model model) {
//		Ingredient ingt = kis.content(ingredientNo);
//		model.addAttribute("ingt", ingt);
//		return "/item/KISIngtUpdateForm";		
//	}
//	
//	@RequestMapping(value="KISIngtUpdate", method=RequestMethod.POST)
//	public String KISIngtUpdate(Ingredient ingt, Model model) {
//		int u = kis.update(ingt);
//		return "redirect:/item/KISIngtList.do";
//	}
//	
	@RequestMapping(value="KISItemDelete")
	public String KISItemDelete(int itemNo, Model model) {
		kis.delete(itemNo);
		return "redirect:KISItemList.do";
	}
		

}
