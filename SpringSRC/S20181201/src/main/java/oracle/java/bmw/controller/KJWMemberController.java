package oracle.java.bmw.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import oracle.java.bmw.model.Member;
import oracle.java.bmw.service.KJWMemberService;

@Controller
public class KJWMemberController {

	// 로깅을 위한 변수
	// private static final Logger logger =
	// LoggerFactory.getLogger(KJWMemberController.class);
	//
	// @Autowired
	// private KJWMemberService ms;

	@Inject
	KJWMemberService ms;

	// 01. 로그인 화면
	@RequestMapping(value = "KJWlogin")
	public String login() {
		System.out.println("KJWLOGIN");
		return "member/KJWlogin"; // views/member/KJWlogin.jsp 로 포워드
	}

	// 02. 로그인 처리
	@RequestMapping(value = "KJWloginCheck")
	public ModelAndView KJWloginCheck(@ModelAttribute Member member, HttpSession session) {
		System.out.println("KJWloginCheck 1...");
		boolean result = ms.loginCheck(member, session);
		System.out.println("KJWloginCheck 2....");
		ModelAndView mav = new ModelAndView();
		if (result == true) { // 로그인 성공
			// main.jsp 로 이동
			
			session.setAttribute("sessionId", member.getMemberId());
			
			member = ms.memberGetInfo((String)session.getAttribute("sessionId"));
			
			HashMap<String, String> sessionHashMap = new HashMap<String, String>();
			sessionHashMap.put("memberId", member.getMemberId());
			sessionHashMap.put("passwd", member.getPasswd());
			sessionHashMap.put("nickName", member.getNickname());
			sessionHashMap.put("name", member.getName());
			sessionHashMap.put("birth", member.getBirth());
			sessionHashMap.put("sex", member.getSex());
			sessionHashMap.put("skinType", member.getSkinType());
			sessionHashMap.put("skinComplex", member.getSkinComplex());
			sessionHashMap.put("grade", member.getGrade());
			sessionHashMap.put("email", member.getEmail());
			sessionHashMap.put("isMail", member.getIsEmail());
			sessionHashMap.put("phone", member.getPhone());
			sessionHashMap.put("address", member.getAddress());
			sessionHashMap.put("question", member.getQuestion());
			sessionHashMap.put("answer", member.getAnswer());
			sessionHashMap.put("recommender", member.getRecommender());
			sessionHashMap.put("joinDate", member.getJoinDate());
			sessionHashMap.put("regDate", member.getRegDate());
			
			System.out.println("해쉬확인");
			System.out.println(sessionHashMap.get("nickName"));
			System.out.println(sessionHashMap.get("skinType"));
		
			
			session.setAttribute("ssMap", sessionHashMap);
			
			System.out.println("세션아이디->" + session.getAttribute("sessionId"));
			mav.setViewName("LoginOK");// view 이름 설정
			mav.addObject("memberId", member.getMemberId());
			mav.addObject("msg", "success"); // 데이터를보냄 ("변수이름", "데이터값")
		} else { // 로그인 실패
			// login.jsp로 이동
			mav.setViewName("member/KJWlogin");
			mav.addObject("msg", "failure");
		}
		return mav;
	}

	// 03. 로그아웃 처리
	@RequestMapping(value = "KJWlogout")
	public ModelAndView logout(HttpSession session) {
		ms.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/KJWlogin");
		mav.addObject("msg", "logout");
		return mav;
	}

	// 04. 회원정보수정 화면
	@RequestMapping(value = "KJWUpdateForm")
	public String updateForm(String memberId, Model model, Member member) {
		System.out.println("KJWUpdateForm");
		// save "member" to model
		model.addAttribute("member", ms.updateForm(memberId));
		System.out.println("memberId->" + memberId);
		// logger.info("클릭한 아이디 : " + memberId);
		// forward "view"
		return "member/KJWUpdate";
	}

	@RequestMapping(value = "KJWUpdateMember")
	public String updateMember(@ModelAttribute Member member, Model model) {
		ms.updateMember(member);
		model.addAttribute("msg", "updateOK");
		return "member/KJWUpdate";
	}

}
