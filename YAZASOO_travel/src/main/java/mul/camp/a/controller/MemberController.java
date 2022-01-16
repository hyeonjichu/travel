package mul.camp.a.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mul.camp.a.dto.MemberDto;
import mul.camp.a.service.MemberService;

@Controller
public class MemberController {

	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		logger.info("MemberController login() " + new Date());	
		
		return "login";
	}
	
	@RequestMapping(value = "regi.do", method = RequestMethod.GET)
	public String regi() {
		logger.info("MemberController regi() " + new Date());
		
		return "regi";
	}
	
	@RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
	public String regiAf(MemberDto dto) {
		logger.info("MemberController regiAf() " + new Date());
		
		boolean b = service.addmember(dto);
		if(b == true) {
			System.out.println("가입되었음");
		}
		
		return "redirect:/login.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	public String idcheck(String id) {
		logger.info("MemberController idcheck() " + new Date());		
		System.out.println("id:" + id);
		
		int count = service.getId(id);
		System.out.println("count:" + count);		
		if(count > 0) {	// 아이디가 있음
			return "NO";
		}else {			// 아이디가 없음
			return "YES";
		}		
	}
	
	@ResponseBody
	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String loginAf(MemberDto dto, HttpServletRequest req) { // request == HttpServletRequest
		logger.info("MemberController loginAf() " + new Date());		
		System.out.println(dto.toString());
		MemberDto mem = service.login(dto);
		if(mem != null) {	// 정상적인 로그인
			// login 정보를 저장 -> session 
			req.getSession().setAttribute("login", mem);			
			return "success";
		}
		else {		// 회원정보에 없음
			return "error";
		}		
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/login.do";
	}
	
	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
	   public String mypage(MemberDto dto) {
	      logger.info("MainController mypageAf()" + new Date());
	   
	      return "mypage";
	}
	
	@ResponseBody
   @RequestMapping(value = "emailcheck.do", method = RequestMethod.POST)
   public String emailcheck(String email) {
      logger.info("MemberController emailcheck() " + new Date());      
      System.out.println("email:" + email);
      int count = service.getEmail(email);
      System.out.println("count:" + count);      
      if(count > 0) {   // 이메일이 있음
         return "NO";
      }else {         // 이메일이 없음
         return "YES";
      }      
   }
	
}
