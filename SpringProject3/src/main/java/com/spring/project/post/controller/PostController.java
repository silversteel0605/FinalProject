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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.project.post.dto.DeleteVO;
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
		categoryNameMap.put("boardAll", 0);
		categoryNameMap.put("supportAll", 1);
		categoryNameMap.put("daily", 2);
		categoryNameMap.put("showoff", 3);
		categoryNameMap.put("buy", 4);
		categoryNameMap.put("sell", 5);
		categoryNameMap.put("notice", 6);
		categoryNameMap.put("askEdit", 7);
	}

	// 고객센터 게시판 
	
	@GetMapping("/support")
	public String supportPage(HttpServletRequest request, Model model, String nowPage, String categoryName, SearchVO search, boolean delete) {
		HttpSession session = request.getSession();
		log.info("들어오는 세션: " + session.getAttribute("search"));
		// 초기 세션 생성
		if (session.getAttribute("search") == null || ((SearchVO)session.getAttribute("search")).getBoard_class() != 1) {
			Integer category = categoryNameMap.get("supportAll");
			search.setBoard_class(boardClassMap.get("supportBoard"));
			search.setCategory(category);
			
			session.setAttribute("search", search);
		}
		
		// 이미 세션 있을 경우
		if (categoryName != null) {
			search.setCategory(categoryNameMap.get(categoryName));
			search.setBoard_class(boardClassMap.get("supportBoard"));
			session.setAttribute("search", search);
		}
		
		// 게시글 삭제
		if (delete) {
			log.info("고객센터 삭제됨");
			postService.deletePost((Integer) session.getAttribute("tempPostId"));
			session.removeAttribute("tempPostId");
		}
		
		// Paging
		Integer cntPerPage = 9;
		
		nowPage = nowPage != null ? nowPage :"1";
		Integer total = postService.getCount((SearchVO) session.getAttribute("search"));
		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);
		model.addAttribute("paging", pvo);
		
		List<PostVO> postList = new ArrayList<>();
		postList = postService.getPostList((SearchVO) session.getAttribute("search"), pvo);
		model.addAttribute("supportContentsList", postList);
		
		log.info("나가는 세션: " + session.getAttribute("search"));
		return "support";
	}
	
	@PostMapping("/support")
	public String supportSearch(HttpServletRequest request, Model model, SearchVO search, String nowPage, DeleteVO del) {
		HttpSession session = request.getSession();
		log.info("들어오는 세션: " + session.getAttribute("search"));
		// 검색 출력
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
		postList = postService.getPostSearch((SearchVO) session.getAttribute("search"), pvo);
		model.addAttribute("supportContentsList", postList);
		
		log.info("나가는 세션: " + session.getAttribute("search"));
		return "support";
	}
	
	// 일반 게시판
	
	@GetMapping("/board")
	public String board(HttpServletRequest request, Model model, String nowPage, SearchVO search, String categoryName, boolean delete) {
		HttpSession session = request.getSession();
		log.info("들어오는 세션: " + session.getAttribute("search"));
		
		// 초기 세션 생성
		if (session.getAttribute("search") == null || ((SearchVO)session.getAttribute("search")).getBoard_class() != 0) {
			Integer category = categoryNameMap.get("boardAll");
			search.setBoard_class(boardClassMap.get("freeBoard"));
			search.setCategory(category);
			
			session.setAttribute("search", search);
		}
		
		// 이미 세션 있을 경우
		if (categoryName != null) {
			search.setCategory(categoryNameMap.get(categoryName));
			search.setBoard_class(boardClassMap.get("freeBoard"));
			session.setAttribute("search", search);
		}
		
		// 게시글 삭제
		if (delete) {
			log.info("일반게시판 삭제됨");
			postService.deletePost((Integer) session.getAttribute("tempPostId"));
			session.removeAttribute("tempPostId");
		}
		
		// 페이징
		Integer cntPerPage = 9;
		
		nowPage = nowPage != null ? nowPage :"1";
		Integer total = postService.getCount((SearchVO) session.getAttribute("search"));
		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);
		model.addAttribute("paging", pvo);
		
		List<PostVO> postList = new ArrayList<>();
		postList = postService.getPostList((SearchVO) session.getAttribute("search"), pvo);
		model.addAttribute("freeBoardContentsList", postList);
		
		log.info("나가는 세션: " + session.getAttribute("search"));
		return "freeBoard";
	}
	
	@PostMapping("/board")
	public String boardSearch(HttpServletRequest request, Model model, SearchVO search, String nowPage) {
		HttpSession session = request.getSession();
		log.info("들어오는 세션: " + session.getAttribute("search"));
		// 검색 출력
		search.setBoard_class(boardClassMap.get("freeBoard"));
		search.setCategory(((SearchVO) session.getAttribute("search")).getCategory());
		session.setAttribute("search", search);
		
		// Paging
		Integer cntPerPage = 9;
		
		nowPage = nowPage != null ? nowPage :"1";
		Integer total = postService.getCount((SearchVO) session.getAttribute("search"));
		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);
		model.addAttribute("paging", pvo);
		
		List<PostVO> postList = new ArrayList<>();
		postList = postService.getPostSearch((SearchVO) session.getAttribute("search"), pvo);
		model.addAttribute("freeBoardContentsList", postList);
		
		log.info("나가는 세션: " + session.getAttribute("search"));
		return "freeBoard";
	}
	
	// 글보기
	@GetMapping("/main_paragraph")
	public String mainContents(HttpServletRequest request, Model model, Integer post_id, boolean delete) {
		HttpSession session = request.getSession();
		log.info("들어오는 세션: " + session.getAttribute("search"));
		
		session.setAttribute("tempPostId", post_id);
		PostVO post = postService.getContents(post_id);
		model.addAttribute("contents", post);
		
		log.info("post: " + post);
		log.info("나가는 세션: " + session.getAttribute("search"));
		
		// 임시 ID 세션 저장
		session.setAttribute("tempId", "testID");
		return "main_paragraph";
	}
	
	//글작성하기
	@GetMapping("/write")
	public String write(String board_class) {
		log.info("board_class: " + board_class);
		
		return "write";
	}
	
	// 기타
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












