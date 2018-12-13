package oracle.java.bmw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.bmw.model.Member;
import oracle.java.bmw.service.KDWAdminService;
import oracle.java.bmw.service.Paging;

	@Controller
	public class KDWAdminController {
		@Autowired
		private KDWAdminService es;
		//	EmpService es = new EmpServiceImpl();       // @Autowired를 사용했기 때문에 위의 내용과 같음
		
//		@RequestMapping(value="MemberListByAdmin")
		@RequestMapping(value="KDWAdminList")
		public String KDWAdminList(Member member,String keyword, String search, String currentPage, Model model) {
			member.setKeyword(keyword);
			member.setSearch(search);
			int total = es.KDWAdmintotal(member);
			System.out.println("total=>" + total);
			System.out.println("currentPage=>" + currentPage);
		
			Paging pg = new Paging(total, currentPage); 
			member.setStart(pg.getStart());
			member.setEnd(pg.getEnd()); 
			
			List<Member> list = es.KDWAdminlist(member);
			System.out.println("list.size()=>" + list.size());
			System.out.println("total=>" + total);
			System.out.println("currentPage=>" + currentPage);
			model.addAttribute("list",  list);
			model.addAttribute("pg",  pg);
			model.addAttribute("keyword",  keyword);
			model.addAttribute("search",  search);
			
			return "member/KDWAdminList"; 
		}
		   
		@RequestMapping(value="KDWDetail")
		public String KDWdetail(String memberId, Model model) {
			System.out.println("memberId - > " + memberId);
			Member member = es.KDWdetail(memberId);	
			model.addAttribute("member", member);
			System.out.println("memberId!!!!!!!!!!! -> " + member.getMemberId());
			
			return "member/KDWDetail"; 
		} 
		   
		@RequestMapping(value="KDWupdateForm") 
		public String KDWupdateForm(String memberId, String grade, Model model) {
			System.out.println("KDWupdateForm start...");
			System.out.println("KDWupdateForm memberId->"+memberId);
			System.out.println("KDWupdateForm grade->"+grade);
			Member member = es.KDWdetail(memberId); 
			model.addAttribute("member", member);
			
			return "member/KDWupdateForm";
		}
		   
	
		@RequestMapping(value="KDWupdate", method=RequestMethod.POST)
		public String KDWupdate(Member member,String birth, Model model) {
			System.out.println("member.getMemberId()->" +member.getMemberId() );
			System.out.println("member.getBirth()->" +member.getBirth() );
			System.out.println("member-------------->" +member);
			member.setBirth(member.getBirth().replace("-", ""));
			int k = es.KDWupdate(member);
			model.addAttribute("member",member);
			System.out.println("member##########>" +member);
			
			return "redirect:KDWAdminList.do";
		}

}




























