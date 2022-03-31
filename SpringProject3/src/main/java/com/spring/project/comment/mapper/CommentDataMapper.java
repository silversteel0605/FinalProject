package com.spring.project.comment.mapper;

import com.spring.project.comment.DTO.CommentSearchVO;
import com.spring.project.comment.DTO.CommentVO;

public interface CommentDataMapper {
	
	public CommentVO[] getComments(CommentSearchVO vo);
	
	public int CommentCnt();
	
	public int blind(CommentVO vo);
	
	public void addComment(CommentVO comment);
}
