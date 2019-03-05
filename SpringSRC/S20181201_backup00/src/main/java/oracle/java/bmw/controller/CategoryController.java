package oracle.java.bmw.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.java.bmw.HomeController;
import oracle.java.bmw.model.Category;
import oracle.java.bmw.service.CategoryService;
import oracle.java.bmw.service.Paging;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService cs;
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="CategoryListView")
	public String CategoryListView(Category cate, String currentPage, Model model) {
		int total = cs.total();
		System.out.println("total -> " + total);
		System.out.println("currentPage -> " + currentPage);
		Paging pg = new Paging(total, currentPage);
		cate.setStart(pg.getStart());
		cate.setEnd(pg.getEnd());
		List<Category> CategoryListView = cs.CategoryListView(cate);
		
		model.addAttribute("CategoryListView", CategoryListView);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		return "/item/CategoryListView";
	}
	
	@RequestMapping(value="CategoryUpdateForm")
	public String CategoryUpdateForm(int categoryNo, Model model) {
		Category cate = cs.detail(categoryNo);
		List<Category> list = cs.CategoryParentNameList(cate);
		
		model.addAttribute("cate", cate);
		model.addAttribute("list", list);
		return "/item/CategoryUpdateForm";
	}
	
	@RequestMapping(value="CategoryUpdatePro", method=RequestMethod.POST)
	public String CategoryUpdatePro(Category cate, Model model) {
		int U = cs.CategoryUpdatePro(cate);
		System.out.println(U);
		return "redirect:CategoryListView.do";
	}	
	
	@RequestMapping(value="CategoryDelete")
	@ResponseBody
	public int CategoryDelete(int categoryNo, Model model) {
		int result = cs.CategoryDelete(categoryNo);
		System.out.println("result -> " + result);
		return result;
//		return "redirect:NYSCateList.do";
	}
	
	@RequestMapping(value="CategoryWriteForm")
	public String CategoryWriteForm(Model model) {
		List<Category> list = cs.CategoryParentNameList2();
		model.addAttribute("list", list);
		
		return "/item/CategoryWriteForm";		
	}
	
	@RequestMapping(value="CategoryWritePro", method=RequestMethod.POST)
	public String CategoryWritePro(Category cate, Model model) {
		int result = cs.CategoryWritePro(cate);
		return "redirect:CategoryListView.do";
//		if(result > 0) {
//			return "redirect:NYSCateList.do";
//		} else {
//			model.addAttribute("msg", "입력 실패. 다시 확인해주세요");
//			return "forward:NYSCateWriteFrom.do";
//		}
	}
	
	@RequestMapping(value="CategoryNameConfirm")
	public String CategoryNameConfirm(String name, Model model) {
		Category cate = cs.detail(name);
		model.addAttribute("name", name);
		System.out.println("cate--> " + cate);
		
		if(cate != null) {
			model.addAttribute("msg", "중복된 카테고리입니다.");
			return "forward:CategoryWriteForm.do";
		} else {
			model.addAttribute("msg", "사용 가능한 카테고리입니다.");
			return "forward:CategoryWriteForm.do";
		}
	}
	
	@RequestMapping(value="CategoryAddParent")
	public String NYSAddParentCate(Model model) {
		List<Category> list = cs.CategoryParentNameList2();
		model.addAttribute("list", list);		
		
		return "/item/CategoryAddParent";
	}
	
	
	@RequestMapping(value="CategoryConfirmParentName", produces="application/text;charset=utf-8")
	@ResponseBody
	public String CategoryConfirmParentName(String name, Model model) {
		System.out.println("get name --> " + name); 
		Category cate = cs.detail(name);
//		model.addAttribute("name", name);
		System.out.println("empty check --> " + cate);
		if(cate != null) {
//			model.addAttribute("msg", "사용 중인 카테고리입니다.");
//			return "forward:NYSAddParentCate.do";
			return "사용 중인 카테고리입니다";
		} else {
//			model.addAttribute("msg", "사용 가능한 카테고리입니다.");
//			return "forward:NYSAddParentCate.do";
			return "사용 가능한 카테고리입니다.";
		}
	}
	
	@RequestMapping(value="CategoryParentWrite")
	@ResponseBody
	public int CategoryParentWrite(Category cate, Model model) {
		int result = cs.CategoryWritePro(cate);
		
		return result;
		
//		if(result > 0) {
//			return "forward:NYSAddParentCate.do";
//		} else {
//			model.addAttribute("msg", "입력 실패. 다시 확인");
//			return "forward:NYSAddParentCate.do";
//		}
	}
	
	
}
