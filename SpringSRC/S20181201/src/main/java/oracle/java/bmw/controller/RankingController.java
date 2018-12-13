package oracle.java.bmw.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.java.bmw.model.Member;
import oracle.java.bmw.model.Category;
import oracle.java.bmw.model.ItemInfo;
import oracle.java.bmw.model.Ranking;
import oracle.java.bmw.service.KISItemService;
import oracle.java.bmw.service.CategoryService;
import oracle.java.bmw.service.RankingService;

@Controller
public class RankingController {

	@Autowired
	private RankingService rs;
	
	@Autowired
	private CategoryService cs;
	
	@Autowired
	private KISItemService kis;
	
	
	
	@RequestMapping(value="RankingMainView")
	public String RankingMainView(Member mem, Category cate, Model model, HttpSession session) {
		
//		List<Member> memList = 
		List<Category> parList = cs.CategoryParentNameList(cate);
		model.addAttribute("parList", parList);
		
//		HashMap<String, String> hm = (HashMap<String, String>)session.getAttribute("ssMap");
//		Ranking rank = new Ranking();
//		rank.setGroupName(hm.get("skinType"));
//		List<ItemInfo> itemList = rs.RankingType(rank);
//		rank.setGroupName(hm.get("a"));
//		List<ItemInfo> itemList1 = rs.RankingType(rank);
//		rank.setGroupName(hm.get("b"));
//		List<ItemInfo> itemList2 = rs.RankingType(rank);
		
		return "/ranking/RankingMainView";
	}
	
	@RequestMapping(value="RankingType")
	public String RankingType(Category cate, Ranking rank, Model model) {
		
		List<ItemInfo> list = rs.RankingType(rank);		
		List<Category> parList = cs.CategoryParentNameList(cate);
		
		
		model.addAttribute("parList", parList);
		model.addAttribute("list", list);	
		
		
		return "/ranking/RankingType";
	}
	
	
	

	
	
}
