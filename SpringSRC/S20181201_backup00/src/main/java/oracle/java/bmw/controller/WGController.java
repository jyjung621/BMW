package oracle.java.bmw.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.java.bmw.HomeController;
import oracle.java.bmw.model.Board;
import oracle.java.bmw.model.Member;
import oracle.java.bmw.model.Point;
import oracle.java.bmw.service.Paging;
import oracle.java.bmw.service.WGMemberService;

@Controller
public class WGController {
	
	private static final Logger logger = LoggerFactory.getLogger(WGController.class);
	
	@Autowired
	private WGMemberService wms;
	
	@Autowired
	  private JavaMailSender mailSender;
	
	
	@RequestMapping(value="basicForm")
	public String basicForm(Model model) {
		System.out.println("basicForm() ....");
		return "basicForm";
//		return "redirect:joinForm.do";
	}
	
	// 회원가입창으로 이동
	@RequestMapping(value="joinForm")
	public String joinForm(HttpServletRequest request, Model model) {

		return "/member/WGjoinForm";
	}
	
	@RequestMapping(value="WGjoin", method=RequestMethod.POST)
	public String WGjoin(Member member, Model model) {
		int result = wms.insert(member);
		if(result == 1) {
			System.out.println("회원가입 성공!");
			System.out.println("성공 후 아이디 "+member.getMemberId());
			model.addAttribute("tomail", member.getEmail());
			model.addAttribute("id", member.getMemberId());
			return "redirect:mailTest.do";
		} else {
			System.out.println("회원가입 실패!");
		}
		return "redirect:basicForm.do";     	
	}
	
	// mailSending 코드
	  @RequestMapping(value="mailTest")
	  public String mailSending(HttpServletRequest request, Model model) throws Exception {
	   
	    String setfrom = "wkhong93@gmail.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String title   = "BMW 회원가입 인증 메일입니다.";      // 제목
	    
	    String msg = "";
		String path = "http://"+request.getServerName()+":"+request.getServerPort()+"/"+request.getContextPath()+"/";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>"
		 + "<h3 style='color: blue;'>"
		 + request.getParameter("id") + "님 회원가입을 환영합니다.</h3>"
		 + "<div style='font-size: 130%'>"
		 + "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>"
		 + "<form method='post' action='"+path+"mailSuccess.do'>"
		 + "<input type='hidden' name='memberId' value='" + request.getParameter("id") + "'>"
		 + "<input type='hidden' name='email' value='" + tomail + "'>"
		 + "<input type='submit' value='인증'></form><br/></div>";
		
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(msg, true);  // 메일 내용
	     
	      mailSender.send(message);
		  System.out.println(msg);
	      System.out.println("보냄! ");
	    } catch(Exception e){
	    	System.out.println("메일발송 실패 : "+e);
	    }
	    return "redirect:basicForm.do";
	  }
	
	@RequestMapping(value="mailSuccess", method= {RequestMethod.POST, RequestMethod.GET})
	public void mailSuccess(Member member, HttpServletResponse response, Model model) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (wms.mailSuccess(member) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.replace('basicForm.do');");
			out.println("</script>");
			out.close();
		}
	}

	@RequestMapping("/idcheck.do")
	 	@ResponseBody
	    public Map<Object, Object> idcheck(@RequestBody String userid) {
	        Map<Object, Object> map = new HashMap<Object, Object>();
	        int count = wms.confirm(userid);
	        map.put("cnt", count);
	        return map;
	    }
	 
	 @RequestMapping(value="myPageForm")
	 public String myPage(Model model) {
		 return "/member/WGmypageForm";
	 }

	 @RequestMapping(value="pointForm")
	 public String pointForm(Point point, String memberId, String currentPage, Model model) {
		memberId= "qwe123";
		point.setMemberId(memberId);
		int total = wms.pointTotal(memberId);
		System.out.println("total->"+total+", currentPage->"+currentPage);
		
		Paging pg = new Paging(total, currentPage);
		point.setStart(pg.getStart());
		point.setEnd(pg.getEnd());
		List<Point> list = wms.pointList(point);
	
		model.addAttribute("memberId", memberId);
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		model.addAttribute("rpoint", selPoint(memberId));
		
		
		return "/member/WGpointForm";
	 }
	 
	 public int selPoint(String memberId) {
		 int rpoint = wms.selPoint(memberId);
		 return rpoint;
	 }
	 
	 @RequestMapping(value="chargePoint")
	 public String chargePoint(Point point, HttpServletRequest request, Model model) {
		 System.out.println("chargePont do start...");
		 point.setPrice(Integer.parseInt(request.getParameter("charge")));
		 point.setMemberId(request.getParameter("id"));
		 int result = wms.chargePoint(point);
		 if(result == 1) System.out.println("충전완료!");
		 else System.out.println("충전실패!");
		 return "redirect:pointForm.do";
	 }

	 
	 
	 
}



