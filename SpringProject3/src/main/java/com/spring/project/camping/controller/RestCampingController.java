package com.spring.project.camping.controller;

import java.io.IOException;

import org.jdom2.JDOMException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.camping.DTO.CampingImgVO;
import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.SearchVO;
import com.spring.project.camping.service.CampingService;
import com.spring.project.member.DTO.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/rest")
public class RestCampingController {
	@Autowired
	CampingService service;
	
	@GetMapping(value="/data", produces = "application/json; charset=UTF-8")
	public CampingVO[] search(SearchVO vo, @RequestParam(value="nowPage", required=false)String nowPage) {
		vo.calcStartEnd(Integer.parseInt(nowPage), 10);
		CampingVO[] ar = service.getDbSearchData(vo); 
		if(ar.length > 0) {
			ar[0].setTotal(Integer.toString(service.getDbSearchTotal(vo)));			
		}
		return ar;
	}
	
	@PostMapping(value="/data")
	public CampingVO insert(CampingVO vo) {
		service.addData(vo);
		return vo;
	}
	
	@PutMapping(value="/data")
	public CampingVO update(@RequestBody CampingVO vo) {
		service.updateData(vo);
		return vo;
	}
	
	@DeleteMapping(value="/data")
	public int delete(@RequestBody String contentId){
		service.deleteData(contentId);
		return 1;
	}
	
	@PostMapping(value="/init")
	public void init() throws IOException, JDOMException {
		service.getAllXML();
		CampingVO[] lists = service.getXMLData();
		
		for(CampingVO list : lists) {
			log.info(list.getAddr2());
			service.initData(list);
			
		}
	}
}
