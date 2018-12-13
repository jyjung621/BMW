package oracle.java.bmw.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.java.bmw.HomeController;
import oracle.java.bmw.model.Category;
import oracle.java.bmw.service.NYSCateService;
import oracle.java.bmw.service.Paging;

@Controller
public class NYSCateController {
	@Autowired
	private NYSCateService cs;
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="NYSCateList")
	public String NYSCateList(Category cate, String currentPage, Model model) {
		int total = cs.total();
		System.out.println("total -> " + total);
		System.out.println("currentPage -> " + currentPage);
		Paging pg = new Paging(total, currentPage);
		cate.setStart(pg.getStart());
		cate.setEnd(pg.getEnd());
		List<Category> NYSCateList = cs.NYSCateList(cate);
		
		model.addAttribute("NYSCateList", NYSCateList);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		return "/item/NYSCateList";
	}
	
}
