package com.spring.project.post.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
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
		
		// 임시 ID 세션 저장
		session.setAttribute("member_id", "admin");
		
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
		
		// 임시 ID 세션 저장
		session.setAttribute("member_id", "admin");
		
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
		
		// 임시 ID 세션 저장
		session.setAttribute("member_id", "testAuth1");
		
		session.setAttribute("tempPostId", post_id);
		PostVO post = postService.getContents(post_id);
		model.addAttribute("contents", post);
		
		// 수정권한 부여
		String member_id = (String) session.getAttribute("member_id");
		log.info("세션아이디: " + member_id);
		log.info("가져온 아이디: " + post.getMember_id());
		
		if (post.getMember_id().equals(member_id)) {
			log.info("수정권한 인증됨");
			model.addAttribute("editAuth", true);
		}
		
		log.info("post: " + post);
		log.info("나가는 세션: " + session.getAttribute("search"));
		
		// 댓글 불러오기
		List<PostVO> commentsList = postService.getComments(post);
		model.addAttribute("commentsList", commentsList);
		
		return "main_paragraph";
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
	
	private String mkUri(String boardClass) {
		if (boardClass.equals("freeBoard")) {
			return "board";
		} else {
			return "support";
		}
	}
	
	
	//글작성하기
	@GetMapping("/write")
	public String write(HttpServletRequest request, Model model, String board_class, Integer post_id) {
		HttpSession session = request.getSession();
		
		if (post_id != null) {
			model.addAttribute("contents", postService.getContents(post_id));
		}
		
		log.info("board_class: " + board_class);
		log.info("session 아이디: " + session.getAttribute("member_id"));
		model.addAttribute("manager", session.getAttribute("member_id"));
		model.addAttribute("board_class", board_class);
		model.addAttribute("boardString", board_class.equals("freeBoard") ? "board" : "support");
		return "writeTest";
	}
	
	@PostMapping("/write")
	public String write(HttpServletRequest request, Integer post_id) throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("EUC-KR");
		
		String data = request.getParameter("contents");
		log.info(data);
		PostVO post = new PostVO();
		log.info(post);
		
		String[] dataArr = data.split(","); for(String item : dataArr) {
			log.info(item); }
		
		post.setMember_id((String)session.getAttribute("member_id"));
		post.setTitle(dataArr[0]); post.setContents(dataArr[1]);
		post.setBoard_class(boardClassMap.get(dataArr[2]));
		post.setContents_category(categoryNameMap.get(dataArr[3]));
		
		if (boardClassMap.get(dataArr[2]) == 1) { post.setProcess(1); }
		
		postService.addPost(post);
		
		return "redirect:" + mkUri(dataArr[2]);
		
	}
	
	@PostMapping("/upload/image")
	public void postImage(MultipartHttpServletRequest multiFile, HttpServletRequest req, HttpServletResponse resp) {
		log.info("image 업로드 들어옴");
		
		JsonObject json = new JsonObject();
		OutputStream out = null;
        PrintWriter printWriter = null;
        MultipartFile file = multiFile.getFile("upload");
        String uploadPath = "D:\\JavaWeb_Ethan\\project-workspace\\LastProject\\SpringProject3\\src\\main\\webapp\\resources\\images\\";
        
        
        if (file != null) {
        	try {
        		UUID uuid = UUID.randomUUID();
        		String fileName = file.getOriginalFilename();
        		log.info("fileName: " + fileName);
        		byte[] bytes = file.getBytes();
        		
        		String imgUploadPath = uploadPath + File.separator + uuid + "_" + fileName;
        		log.info(imgUploadPath);
        		
        		out = new FileOutputStream(imgUploadPath);
        		out.write(bytes);
        		out.flush();
        		
        		printWriter = resp.getWriter();
        		resp.setContentType("application/json");
        		String callback = req.getParameter("CKEditorFuncNum");
        		log.info(callback);
        		String fileUrl = "/project/ckUpload?uuid=" + uuid + "&fileName=" + fileName;
        		log.info("fileUrl: " + fileUrl);
        		
        		json.addProperty("filename", fileName);
        		json.addProperty("uploaded", 1);
        		json.addProperty("url", fileUrl);
        		printWriter.println(json);
        		
        		printWriter.flush();
        		
        	} catch (IOException e) {
        		e.printStackTrace();
        	} finally {
        		try {
        			if(out != null) { out.close(); }
        			if(printWriter != null) { printWriter.close(); }
        		} catch(IOException e) { e.printStackTrace(); }
        	}
        }
	}
	
	@RequestMapping(value="/ckUpload")
	public void chUpload(@RequestParam(value="uuid") String uuid
    		, @RequestParam(value="fileName") String fileName
    		, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		log.info("ckUpload 들어옴");
		log.info("uuid: "  + uuid);
		log.info("ckUpload FileName: " + fileName);
		
		String path = "D:\\JavaWeb_Ethan\\project-workspace\\LastProject\\SpringProject3\\src\\main\\webapp\\resources\\images\\";	// 저장된 이미지 경로
    	System.out.println("path:"+path);
    	String sDirPath = path + uuid + "_" + fileName;
    	log.info(sDirPath);
    	
    	File imgFile = new File(sDirPath);
    	
    	if(imgFile.isFile()){
    		byte[] buf = new byte[1024];
    		int readByte = 0;
    		int length = 0;
    		byte[] imgBuf = null;
    		
    		FileInputStream fileInputStream = null;
    		ByteArrayOutputStream outputStream = null;
    		ServletOutputStream out = null;
    		
    		try{
    			fileInputStream = new FileInputStream(imgFile);
    			outputStream = new ByteArrayOutputStream();
    			out = resp.getOutputStream();
    			
    			while((readByte = fileInputStream.read(buf)) != -1){
    				outputStream.write(buf, 0, readByte); 
    			}
    			
    			imgBuf = outputStream.toByteArray();
    			length = imgBuf.length;
    			out.write(imgBuf, 0, length);
    			out.flush();
    			
    		} catch(IOException e) {
    			e.printStackTrace();
    		} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}
}












