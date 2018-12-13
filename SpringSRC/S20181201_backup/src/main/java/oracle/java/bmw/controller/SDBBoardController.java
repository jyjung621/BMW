package oracle.java.bmw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.java.bmw.model.Board;
import oracle.java.bmw.service.SDBBoardService;
import oracle.java.bmw.service.Paging;

@Controller
public class SDBBoardController {
	
	@Autowired
	private SDBBoardService bs;

	@RequestMapping(value="SDBBoardList")
	public String SDBBoardList(Board board, String currentPage, Model model) {
		System.out.println("!!!!!!!!!!!!");
		int total = bs.SDBBoardTotal();
		System.out.println("total=>" + total);
		
		System.out.println("currentPage=>" + currentPage);
	/*	
		Paging pg = new Paging(total, currentPage);
		board.setStart(pg.getStart());
		board.setEnd(pg.getEnd());
		System.out.println("pg.getStart()=>" + pg.getStart());
		System.out.println("pg.getEnd()=>" + pg.getEnd());
		List<Board> list = bs.SDBBoardList(board);
		System.out.println("list.size()=>" + list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);		*/
		
		return "SDBBoardList";
	}
}
