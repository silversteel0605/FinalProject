package com.spring.project.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
}
