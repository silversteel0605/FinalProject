package com.spring.project.message.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.comment.DTO.CommentVO;
import com.spring.project.message.DTO.MessageVO;
import com.spring.project.message.mapper.MessageDataMapper;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	MessageDataMapper dataMapper;
	
	@Override
	public int blindMsg(CommentVO cvo) {
		MessageVO vo = new MessageVO();
		vo.setMember_id(cvo.getMember_id());
		vo.messaging(cvo.getComments(), cvo.getBlindComment());
		return dataMapper.blindMsg(vo);
	}

}
