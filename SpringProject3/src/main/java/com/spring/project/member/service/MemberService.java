package com.spring.project.member.service;

import com.spring.project.member.DTO.MemberVO;

public interface MemberService {
	
	public int idChk(MemberVO vo);
	
	public int signin(MemberVO vo);
	
	public int join(MemberVO vo);
}
