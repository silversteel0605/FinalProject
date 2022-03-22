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
	public String supportPage(HttpServletRequest request, Model model, String categoryName, String nowPage, SearchVO search) {
		HttpSession session = request.getSession();
		
		// 檬扁 技记 积己
		if (session.getAttribute("search") == null) {
			Integer category = categoryNameMap.get("supportAll");
			search.setBoard_class(boardClassMap.get("supportBoard"));
			search.setCategory(category);
			
			session.setAttribute("search", search);
		}
		
		// 技记 乐阑 版快
		if (categoryName != null) {
			search.setCategory(categoryNameMap.get(categoryName));
			search.setBoard_class(boardClassMap.get("supportBoard"));
			session.setAttribute("search", search);
		}
		
		// Paging
		Integer cntPerPage = 9;
		
		nowPage = nowPage != null ? nowPage :"1";
		Integer total = postService.getCount((SearchVO) session.getAttribute("search"));
		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);
		model.addAttribute("paging", pvo);
		
		List<PostVO> postList = new ArrayList<>();
		postList = postService.getSupportPostList((SearchVO) session.getAttribute("search"), pvo);
		model.addAttribute("supportContentsList", postList);
		return "support";
	}
	
	@PostMapping("/support")
	public String supportSearch(HttpServletRequest request, Model model, SearchVO search, String nowPage) {
		HttpSession session = request.getSession();
		
		search.setBoard_class(boardClassMap.get("supportBoard"));
		search.setCategory(((SearchVO) session.getAttribute("search")).getCategory());
		session.setAttribute("search", search);
		
		// Paging
		Integer cntPerPage = 9;
		
		nowPage = nowPage != null ? nowPage :"1";
		Integer total = postService.getCount((SearchVO) session.getAttribute("search"));
		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);
		model.addAttribute("paging", pvo);
		
		List<PostVO> postList = new ArrayList<>();
		postList = postService.getSupportSearch((SearchVO) session.getAttribute("search"), pvo);
		model.addAttribute("supportContentsList", postList);
		return "support";
	}
	
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
	
	@GetMapping("/main_paragraph")
	public String mainContents(Model model, Integer post_id) {
		log.info("post_id: " + post_id);
		
		PostVO post = postService.getContents(post_id);
		log.info(post);
		
		model.addAttribute("contents", post);
		return "main_paragraph";
	}
	
}












