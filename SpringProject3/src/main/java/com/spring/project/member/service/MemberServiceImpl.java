package com.spring.project.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.member.DTO.MemberVO;
import com.spring.project.member.mapper.MemberDataMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDataMapper dataMapper;
	
	@Override
	public int idChk(MemberVO vo) {
		return dataMapper.idChk(vo);
	}

	@Override
	public int signin(MemberVO vo) {
		return dataMapper.signin(vo);
	}

	@Override
	public int join(MemberVO vo) {
		return dataMapper.join(vo);
	}
	
}
