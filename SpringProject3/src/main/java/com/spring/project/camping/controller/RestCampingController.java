package com.spring.project.camping.controller;

import java.io.IOException;

import org.jdom2.JDOMException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.SearchVO;
import com.spring.project.camping.service.CampingService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/rest")
public class RestCampingController {
	@Autowired
	CampingService service;
	
	@GetMapping(value="search", produces = "application/json; charset=UTF-8")
	public CampingVO[] search(SearchVO vo, @RequestParam(value="nowPage", required=false)String nowPage) {
		vo.calcStartEnd(Integer.parseInt(nowPage), 9);
		CampingVO[] ar = service.getDbSearchData(vo); 
		ar[0].setTotal(service.getDbSearchTotal(vo) + "");
		
		return ar;
	}
	
	@PostMapping(value="/data")
	public void init() throws IOException, JDOMException {

		service.getAllXML();
		CampingVO[] lists = service.getXMLData();
		
		for(CampingVO list : lists) {
			service.initData(list);
			
		}
	}
	
}
