package com.spring.project.member.mapper;


import com.spring.project.member.DTO.MemberSearchVO;
import com.spring.project.member.DTO.MemberVO;

public interface MemberDataMapper {
	
	public int idChk(MemberVO vo);
	
	public int signin(MemberVO vo);
	
	public int join(MemberVO vo);
	
	public String findid(MemberVO vo);
	
	public int findpw(MemberVO vo);
	
	public int MemberCnt();
	
	public MemberVO[] getMembers(MemberSearchVO vo);
}
