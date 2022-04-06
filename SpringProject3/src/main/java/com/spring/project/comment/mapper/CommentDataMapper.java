package com.spring.project.comment.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.project.comment.DTO.CommentSearchVO;
import com.spring.project.comment.DTO.CommentVO;

public interface CommentDataMapper {
	
	public CommentVO[] getComments(CommentVO vo);
	
	public int CommentCnt();
	
	public int blind(CommentVO vo);
	
	public void addComment(CommentVO comment);
	public void deleteComment(Integer commentId);
	public void commentReport(@Param("commentId") Integer commentId, @Param("reportNum") Integer reportNum);
	public Integer getCommentReport(Integer commentId);
}
