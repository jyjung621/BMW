package oracle.java.bmw.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.bmw.model.Category;
import oracle.java.bmw.model.Comments;
import oracle.java.bmw.model.Ingredient;
import oracle.java.bmw.model.IngtList;
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
	public String KISItemList(ItemInfo item, Category cate, String currentPage, Model model) {
		int total = kis.KISItemTotal();
		System.out.println("total -> " + total);
		Paging pg = new Paging(total, currentPage);
		item.setStart(pg.getStart());
		item.setEnd(pg.getEnd());
		List<ItemInfo> list = kis.itemList(item);
		List<Category> catelist = kis.cateList();
		
		model.addAttribute("list", list);
		model.addAttribute("catelist", catelist);
		model.addAttribute("pg", pg);
		model.addAttribute("itemTotal", total);
		
		return "/item/KISItemList";
	}
	
//	@RequestMapping(value="KISItemContent")
//	public String KISItemContent(int itemNo, Model model) {
//		kis.upHits(itemNo); // 조회수
//		ItemInfo item = kis.content(itemNo);
//		List<Category> catelist = kis.content();
//		List<Ingredient> mapplist = kis.ingtList(itemNo);
//		model.addAttribute("mapplist", mapplist);
//		model.addAttribute("item", item);
//		model.addAttribute("catelist", catelist);
//		return "/item/KISItemContent";
//	}
	
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
		List<Ingredient> mapplist = kis.ingtList(itemNo);
		
		model.addAttribute("mapplist", mapplist);
		model.addAttribute("item", item);
		model.addAttribute("comms", comms);
		model.addAttribute("pgRv", pgRv);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("reviewTotal", reviewTotal);
		
		return "/item/KISItemContent";
	}
	
	@RequestMapping(value="KISItemWriteForm")
	public String KISItemWriteForm(Model model) {
		List<ItemInfo> list = kis.itemList();
//		List<Ingredient> ingtlist = kis.ingtList();		
		List<Category> catelist = kis.select();
//		List<Category> childCate = kis.select();
		
		model.addAttribute("cate", list);
//		model.addAttribute("ingtlist", ingtlist);
		model.addAttribute("catelist", catelist);
//		model.addAttribute("childCate", childCate);
		return "/item/KISItemWriteForm";
	}
		
	@RequestMapping(value="KISItemWrite", method=RequestMethod.POST)
	public String KISItemWrite(HttpServletRequest request, ItemInfo item, IngtList ingtList, Model model) {
		int itemNo = kis.selectItemNo(); // itemNo select
		System.out.println("itemNo --> " + itemNo);
		item.setItemNo(itemNo);
		int k = kis.insert(item);
		
	// IngtList 테이블에 성분번호 배열값으로 받아서 저장	
	if (k > 0) {
		String[] receiveValue = request.getParameter("receiveValue").split(",");
		System.out.println("receiveValue.length --> " + receiveValue.length);
		if (receiveValue[0] == "") {
			int result3 = 1; 
			request.setAttribute("result3", result3);
		}else {
			ingtList.setItemNo(itemNo);
			for (int i = 0; i < receiveValue.length; i++) {
				int ingredientNo = Integer.parseInt(receiveValue[i]);
				ingtList.setIngredientNo(ingredientNo);
				int result2 = kis.mappInsert(ingtList);				
				request.setAttribute("result2", result2);
			}
		}		
	}
		return "redirect:KISItemList.do";
	}
	
	@RequestMapping(value="KISItemCateSel", method=RequestMethod.POST)
	public String KISItemCateSel(Category cate, Model model) {
		List<Category> list = kis.childSelect(cate);
		return "redirect:KISItemCateSel.do";
	}
	
	@RequestMapping(value="KISItemUpdateForm")
	public String KISItemUpdate(int itemNo, Model model) {
		ItemInfo item = kis.content(itemNo);
		List<Category> catelist = kis.cateList();
		List<Ingredient> mapplist = kis.ingtList(itemNo);
		model.addAttribute("item", item);
		model.addAttribute("catelist", catelist);
		model.addAttribute("mapplist", mapplist);
		return "/item/KISItemUpdateForm";		
	}

	@RequestMapping(value="KISItemUpdate", method=RequestMethod.POST)
	public String KISItemUpdate(HttpServletRequest request, ItemInfo item, IngtList ingtlist, Model model) {
		System.out.println("KISItemUpdate() Start......");
		int k = kis.update(item);
		
		// IngtList 테이블에 성분번호 배열값으로 받아서 저장	
		if (k > 0) {
			String[] receiveValue = request.getParameter("receiveValue").split(",");
			System.out.println("receiveValue.length --> " + receiveValue.length);
			System.out.println("receiveValue->" + receiveValue);
			kis.mappDelete(ingtlist);
			if (receiveValue[0] != "") {
				ingtlist.setItemNo(item.getItemNo());
				for (int i = 0; i < receiveValue.length; i++) {
					int ingredientNo = Integer.parseInt(receiveValue[i]);
					ingtlist.setIngredientNo(ingredientNo);
					int result2 = kis.mappUpdate(ingtlist);				
				}
			}		
		}
		return "redirect:KISItemList.do";
	}
	
	@RequestMapping(value="KISItemDelete")
	public String KISItemDelete(int itemNo, Model model) {
		kis.delete(itemNo);
		return "redirect:KISItemList.do";
	}
		

}
