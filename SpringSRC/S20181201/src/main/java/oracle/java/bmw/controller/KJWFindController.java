package oracle.java.bmw.controller;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import oracle.java.bmw.model.Member;
import oracle.java.bmw.service.KJWFindService;


@Controller
public class KJWFindController {
	
	@Autowired
	private KJWFindService fs;
	@Autowired
	private JavaMailSender mailsender;
	
	
	// 01. 아이디 찾기 페이지 불러오기
	@RequestMapping(value="KJWFindId")
	public String findId() throws Exception{
		return "member/KJWFindId";
	} 
	// 02. 아이디찾기 입력정보 확인, id불러오기
	@RequestMapping(value="KJWFindIdCheck", method=RequestMethod.POST)
	public ModelAndView KJWFindIdCheck(@ModelAttribute Member member, HttpSession session, Model model) {
		System.out.println("KJWFindIdCheck 1...");
		String memberId = null;
		memberId=fs.findIdCheck(member, session);
		/*boolean result = fs.findIdCheck(member,session);*/
		System.out.println("KJWFindIdCheck 2...");
		ModelAndView mav = new ModelAndView();
		model.addAttribute("member", member);
		model.addAttribute("memberId",memberId);
		System.out.println("memberId->"+memberId);
		if(memberId != null) { // 이메일,질문,답변 일치
			//findIdOK.jsp로 이동
			mav.setViewName("member/KJWFindId");	//view 이름 설정
			mav.addObject("msg","success");	//데이터를보냄 ("변수이름", "데이터값")
		} else { //정보일치X
			// alert로 틀렸다고 창 오픈
			mav.setViewName("member/KJWFindId");
			mav.addObject("msg","failure");
		}
		return mav;
	
	}
	
	// 03. 비밀번호 찾기
	@RequestMapping(value="KJWFindPw")
	public String findPw() throws Exception{
		return "member/KJWFindPw";
	}
	
	//04. 비밀번호 답변 정보 확인 
	@RequestMapping(value="KJWFindPwCheck", method=RequestMethod.POST)
	public String KJWFindPwCheck(Model model, Member member) {
		System.out.println("KJWFindPwCheck 1...");
		boolean result = fs.findPwCheck(member);
		System.out.println("KJWFindPwCheck 2...");
		System.out.println("memberId->"+member.getMemberId());
		System.out.println("Email->"+member.getEmail());
		System.out.println("Question->"+member.getQuestion());
		System.out.println("Answer->"+member.getAnswer());
		System.out.println("result->"+result);
		if(result == true) { //아이디, 이메일, 질문, 답변 일치
//			model.addAttribute("msg","success");
			return "forward:mailTransport.do";
		} else {
			model.addAttribute("msg","failure");
			return "member/KJWFindPw";
		} 
	}
//	public ModelAndView KJWFindPwCheck(@ModelAttribute Member member) {
//		System.out.println("KJWFindPwCheck 1...");
//		boolean result = fs.findPwCheck(member);
//		System.out.println("KJWFindPwCheck 2...");
//		ModelAndView mav = new ModelAndView();
//		System.out.println("memberId->"+member.getMemberId());
//		System.out.println("Email->"+member.getEmail());
//		System.out.println("Question->"+member.getQuestion());
//		System.out.println("Answer->"+member.getAnswer());
//		if(result == true) { //아이디, 이메일, 질문, 답변 일치
//			mav.addObject("msg","success");
//			return "redirect:mailTransport.do";
//		} else { //정보일치X
//			mav.setViewName("member/KJWFindPw");
//			mav.addObject("msg","failure");
//		}
//		return mav;
//	}
	
//	@RequestMapping(value="test")
//	public String test(int no, Model model) {
//		if(no == 1) {
//			model.addAttribute("msgTest","success");
//			return "redirect:mailTransport.do";	// mailtranport 		
//		} else {
//			model.addAttribute("msgTest","false");
//			return "member/KJWFindPw";			
//		}
//	}
	
	//답변이 맞았는지 틀렸는지 확인하는 코드 필요
	
	// 05. 비밀번호 메일로 보내주기 (비밀번호 맞으면)
	// mailTransport 코드
	@RequestMapping(value = "mailTransport")
	public String mailTransport(HttpServletRequest request, Model model, Member member) {
		System.out.println("mailSending");
		String tomail = request.getParameter("email");              // 받는 사람 이메일
		String memberId = request.getParameter("memberId");          // 받는사람 아이디
		System.out.println(tomail);
		String setfrom = "uzicandi@gmail.com";             // 보내는 사람 이메일
		String title = "mailTransport 입니다";                 // 제목
		try {
			MimeMessage message = mailsender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail);      // 받는사람 이메일
			messageHelper.setSubject(title);   // 메일제목은 생략이 가능하다
			String tempPassword = (int) (Math.random() * 999999) + 1 + "";
			messageHelper.setText("임시 비밀번호입니다 : " + tempPassword); // 메일 내용
			System.out.println("임시 비밀번호입니다 : " + tempPassword);
			//DataSource dataSource =   new FileDataSource("c:\\log\\Jellyfish.jpg");
//		    messageHelper.addAttachment(MimeUtility.encodeText("airport.png", "UTF-8", "B"), 
//		    		dataSource);
		    mailsender.send(message);
//			model.addAttribute("check", 1);   // 정상 전달
		    model.addAttribute("msg","success");
			member.setMemberId(memberId);
			member.setPasswd(tempPassword);
			System.out.println("memberid -> " + memberId);
			System.out.println("tempPassword -> " + tempPassword);
			int kkk = fs.update_pw(member);// db에 비밀번호를 임시비밀번호로 업데이트
			System.out.println("update_pw after kkk->"+kkk);
		} catch (Exception e) {
			System.out.println(e);
//			model.addAttribute("check", 2);  // 메일 전달 실패
			model.addAttribute("msg","mailFailure");
		}
//		return "mailResult";	// findPw.jsp
		return "member/KJWFindPw";
	}

}

