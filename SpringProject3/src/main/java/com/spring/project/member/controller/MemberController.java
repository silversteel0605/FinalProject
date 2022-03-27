package com.spring.project.member.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MemberController {
	
	@RequestMapping(value = "/member/login")
	public String login(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("auth", "true");
		return "redirect:/about";
	}
	
	@RequestMapping(value = "/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/about";
	}
}
