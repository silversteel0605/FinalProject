package com.spring.project.post.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.project.post.dto.PostVO;
import com.spring.project.post.dto.SearchVO;
import com.spring.project.post.service.PostService;
import com.spring.project.utill.PagingVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class PostController {

	@Autowired
	PostService postService;
	
	private static Map<String, Integer> boardClassMap;
	private static Map<String, Integer> categoryNameMap;
	
	static {
		boardClassMap = new HashMap<>();
		boardClassMap.put("freeBoard", 0);
		boardClassMap.put("supportBoard", 1);
		
		categoryNameMap = new HashMap<>();
		categoryNameMap.put("supportAll", 5);
		categoryNameMap.put("notice", 6);
		categoryNameMap.put("askEdit", 7);
	}

	@GetMapping("/support")
	public String supportPage(HttpServletRequest request, Model model, String categoryName, String nowPage) {
		HttpSession session = request.getSession();
		session.setAttribute("categoryName", categoryNameMap.get("supportAll"));
		
		Integer cntPerPage = 9;
		
		// Paging
		nowPage = nowPage != null ? nowPage :"1";
		Integer total = postService.getCount(boardClassMap.get("supportBoard"));
		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);
		model.addAttribute("paging", pvo);
		
		if (categoryName != null) {
			session.setAttribute("categoryName", categoryNameMap.get(categoryName));
		}
		
		Integer category = (Integer)session.getAttribute("categoryName");
		
		List<PostVO> postList = new ArrayList<>();
		postList = postService.getSupportPostList(boardClassMap.get("supportBoard"), category, pvo);
		
		model.addAttribute("supportContentsList", postList);
		
		
		
		return "support";
	}
	
	@PostMapping("/support")
	public String supportSearch(HttpServletRequest request, Model model, SearchVO search, String nowPage) {
		HttpSession session = request.getSession();
		search.setBoard_class(boardClassMap.get("supportBoard"));
		
		Integer category = (Integer)session.getAttribute("categoryName");
		search.setCategory(category);
		
		List<PostVO> postList = new ArrayList<>();
		postList = postService.getSupportSearch(search);
		model.addAttribute("supportContentsList", postList);
		
		Integer cntPerPage = 9;
		
		// Paging
		nowPage = nowPage != null ? nowPage :"1";
		Integer total = postService.getCount(boardClassMap.get("supportBoard"));
		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);
		model.addAttribute("paging", pvo);
		
		return "support";
	}
//	@GetMapping("/support")
//	public String support(String searchKeyword, String searchByWhat, String categoryName, Model model, 
//			@RequestParam(value="nowPage", required=false) String nowPage) {
//		
//		Integer cntPerPage = 9;
//		
//		// Paging
//		nowPage = nowPage != null ? nowPage :"1";
//		Integer total = postService.getCount(postNumber.get("supportBoard"));
//		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage));
//		model.addAttribute("paging", pvo);
//		
//		//Controller
//		if (categoryName == null) {
//			
//			if (searchKeyword == null) {
//				model.addAttribute("supportContentsList", 
//						postService.getAllSupportPost(postNumber.get("supportBoard"), Integer.parseInt(nowPage), cntPerPage));
//			} else {
//				model.addAttribute("supportContentsList", 
//						postService.getSupportSearchResult(searchKeyword, searchByWhat, postNumber.get("supportBoard")));
//			}
//			
//		} else {
//			if (categoryNameMap.get(categoryName) == 0) {
//				model.addAttribute("supportContentsList", 
//						postService.getAllSupportPost(postNumber.get("supportBoard"), Integer.parseInt(nowPage), cntPerPage));
//			} else {
//				if (searchKeyword == null) {
//					model.addAttribute("supportContentsList", 
//							postService.getAllSupportPostWithCategory(postNumber.get("supportBoard"), categoryNameMap.get(categoryName)));
//				} else {
//					model.addAttribute("supportContentsList", 
//							postService.getSupportSearchResultWhitCategory(searchKeyword, searchByWhat, postNumber.get("supportBoard"), categoryNameMap.get(categoryName)));
//				}
//			}
//		}
//		return "support";
//	}
	
	@GetMapping("/tempIndividualInfo")
	public String tempIndividualInfo(String id) {
		log.info("GetId: " + id);
		return null;
	}
	
	@GetMapping("/tempIndividualPost")
	public String tempIndividualPost(String id) {
		log.info("GetId: " + id);
		return null;
	}
}












