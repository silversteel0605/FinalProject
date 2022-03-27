package com.spring.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.service.CampingService;

import lombok.extern.log4j.Log4j;



/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
public class HomeController {
	
	@Autowired
	CampingService service;

	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String main() {
		return "about";
	}
	
	@RequestMapping(value = "/manager", method = RequestMethod.GET)
	public String manager() {
		
		return "manager";
	}

	@RequestMapping(value = "/updateWindow", method = RequestMethod.GET)
	public String updateWindow(Model m, String contentId) {
		CampingVO vo = service.getInfo(contentId);
		m.addAttribute("info", vo);
		return "updateWindow";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signin() {
		return "signin";
	}
	
	@RequestMapping(value = "/ivc", method = RequestMethod.GET)
	public String ivc() {
		return "id.check";
	}
	
}
