package com.spring.project.member.controller;



import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.project.member.DTO.MemberVO;
import com.spring.project.member.service.MemberService;

import lombok.extern.log4j.Log4j;

	

@Log4j
@Controller
public class MemberController {

	private static final HashMap<Integer, String> M_TYPE = new HashMap<>();
	
	static {
		M_TYPE.put(0, "normal");
		M_TYPE.put(1, "business");
	}
	
	@Autowired
	MemberService service;
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(MemberVO vo) {
		if(vo.getMember_type() == 1) {			
			return "business.login";
		} else {
			return "login";
		}
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signin(MemberVO vo) {
		if(vo.getMember_type() == 1) {			
			return "business.signin";
		} else {
			return "signin";
		}
	}
	
	@RequestMapping(value = "/ivc", method = RequestMethod.GET)
	public String ivc() {
		return "id.check";
	} 
	
	@RequestMapping(value = "/member/login")
	public String login(HttpSession session, MemberVO vo) {
		String id = vo.getMember_id();
		log.info(id);
		int type = vo.getMember_type();
		session.setAttribute("auth", M_TYPE.get(type));
		session.setAttribute("member_id", id);		
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/member/logout")
	public String logout(HttpSession session) {
		session.setAttribute("auth", null);
		return "redirect:/main";
	}
	
	@RequestMapping(value="/kakao/login")
	public String kakaoin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {
		String access_Token = service.getAccessToken(code);
		
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
		if(access_Token != null) {
			session.setAttribute("member_id", access_Token);
			session.setAttribute("auth", "kakao");			
		} else {			
			session.setAttribute("auth", "failed");			
		}
			
		return "redirect:/about";
	}
	
	@RequestMapping(value="/kakao/logout")
	public String kakaoout(HttpSession session) {
		session.setAttribute("kakao_token", null);
		session.setAttribute("auth", null);
		return "redirect:/about";
	}
	
	@RequestMapping(value="/findid")
	public String findid() {
		return "/findid";
	}
	
	@RequestMapping(value="/findpw")
	public String findpw() {
		return "/findpw";
	}
	
	@RequestMapping(value="/findIdResult" ,method = RequestMethod.POST)
	public String findIdResult(MemberVO vo, Model m) {
		m.addAttribute("id", service.findid(vo));
		return "/findIdResult";
	}
}
