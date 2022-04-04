package com.spring.project.comment.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.comment.DTO.CommentSearchVO;
import com.spring.project.comment.DTO.CommentVO;
import com.spring.project.comment.service.CommentService;
import com.spring.project.message.service.MessageService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/rest")
public class RestCommentController {
	
	@Autowired
	CommentService service;
	@Autowired
	MessageService mService;
	
	@GetMapping(value="/manager/comment")
	public CommentVO[] getComments(CommentSearchVO vo) {
		vo.calcStartEnd(10);
		CommentVO[] cvo = service.getComments(vo);
		if(cvo.length > 0) {
			cvo[0].setTotal(service.CommentCnt());
		}
		return cvo;
	}
	
	@PutMapping(value="/manager/comment")
	public int blind(@RequestBody CommentVO vo) {
		int rs;
		vo.blinding();

		if ((rs = service.blind(vo)) != 0) {
			rs += mService.blindMsg(vo);
		}
		return rs ;
	}
	
	@PostMapping(value = "/main_paragraph", produces = MediaType.APPLICATION_JSON_VALUE)
	public CommentVO comments(HttpServletRequest request, @RequestBody CommentVO comment) throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		comment.setMember_id((String)session.getAttribute("member_id"));
		service.addComment(comment);
		return comment;
	}
	
	@DeleteMapping(value = "/comments")
	public void deleteComment(Integer commentId) {
		log.info(commentId);
		service.deleteComment(commentId);
	}
	
	@PutMapping(value = "/comments") 
	public void commentReport(Integer commentId) {
		log.info(commentId);
		Integer reportNum = service.getCommentReport(commentId);
		service.commentReport(commentId, reportNum);
	}
	
	
	
}
