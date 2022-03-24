package com.spring.project;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.spring.project.camping.DTO.CampingVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile() {
		return "profile";
	}

	@RequestMapping(value = "/manager", method = RequestMethod.GET)
	public String manager() {
		logger.info("Connect Manager");
		return "manager";
	}
	
	@RequestMapping(value = "/camping_index", method = RequestMethod.GET )
	public String camping_index() {
		logger.info("Connect camping_index");
		return "camping_index";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET )
	public String test() {
		logger.info("Connect test");
		return "freeBoard2";
	}
	
}
