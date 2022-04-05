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
	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	public String reservation() {
		return "reservation";
	}
	@RequestMapping(value = "/sampletest", method = RequestMethod.GET)
	public String reservation2() {
		return "sample";
	}
	@RequestMapping(value = "/test3", method = RequestMethod.GET)
	public String reservation3() {
		return "reservation3";
	}
	
	@RequestMapping(value = "/sample", method = RequestMethod.GET)
	public String sample() {
		
		
		return "sample";
	}
	

	@RequestMapping(value = "/manager", method = RequestMethod.GET)
	public String manager() {
		
		return "new.manager";
	}

	@RequestMapping(value = "/updateWindow", method = RequestMethod.GET)
	public String updateWindow(Model m, String contentId) {
		CampingVO vo = service.getInfo(contentId);
		m.addAttribute("info", vo);
		return "updateWindow";
	}

	


	@RequestMapping(value = "/camping_index", method = RequestMethod.GET )
	public String camping_index() {
		log.info("Connect camping_index");
		return "camping_index";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET )
	public String test() {
		log.info("Connect test");
		return "freeBoard2";
	}

	@RequestMapping(value = "/template", method = RequestMethod.GET )
	public String template() {
		return "template";
	}
	@RequestMapping(value = "/map2", method = RequestMethod.GET )
	public String map2() {
		return "map-search";
	}
	
	
}

