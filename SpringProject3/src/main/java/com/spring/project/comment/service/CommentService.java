package com.spring.project.comment.service;

import com.spring.project.comment.DTO.CommentSearchVO;
import com.spring.project.comment.DTO.CommentVO;

public interface CommentService {
	
	public CommentVO[] getComments(CommentSearchVO vo);
	
	public int CommentCnt();
	
	public int blind(CommentVO vo);
}
