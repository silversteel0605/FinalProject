package com.spring.project.post.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.post.dto.PostVO;
import com.spring.project.post.service.PostService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class PostRestController {

//	@Autowired
//	PostService postService;
//	
//	private static Map<String, Integer> postNumber;
//	
//	static {
//		postNumber = new HashMap<>();
//		postNumber.put("자유게시판", 0);
//		postNumber.put("고객센터", 1);
//	}
//	
//	
//	@GetMapping(value = "/support", produces = MediaType.APPLICATION_JSON_VALUE)
//	public List<PostVO> initSupport() {
//		return postService.getAllSupportPost(postNumber.get("고객센터"));
//	}
}














