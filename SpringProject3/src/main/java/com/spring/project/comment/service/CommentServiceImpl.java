package com.spring.project.comment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.comment.DTO.CommentSearchVO;
import com.spring.project.comment.DTO.CommentVO;
import com.spring.project.comment.mapper.CommentDataMapper;
import com.spring.project.message.DTO.MessageVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDataMapper dataMapper;
	
	@Override
	public CommentVO[] getComments(CommentVO vo) {
		return dataMapper.getComments(vo);
	}

	@Override
	public int CommentCnt() {
		return dataMapper.CommentCnt();
	}

	@Override
	public int blind(CommentVO vo) {
		return dataMapper.blind(vo);
	}
	
	
	@Override
	public void addComment(CommentVO comment) {
		dataMapper.addComment(comment);
	};
	
	@Override
	public void deleteComment(Integer commentId) {
		dataMapper.deleteComment(commentId);
	}
	
	@Override
	public void commentReport(Integer commentId, Integer reportNum) {
		dataMapper.commentReport(commentId, reportNum);
	}
	
	@Override
	public Integer getCommentReport(Integer commentId) {
		return dataMapper.getCommentReport(commentId); 
	}
}
