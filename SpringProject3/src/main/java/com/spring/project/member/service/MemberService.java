package com.spring.project.member.service;

import java.util.HashMap;

import com.spring.project.member.DTO.MemberSearchVO;
import com.spring.project.member.DTO.MemberVO;

public interface MemberService {
	
	public int idChk(MemberVO vo);
	
	public int signin(MemberVO vo);
	
	public int join(MemberVO vo);
	
	public String getAccessToken (String authorize_code);
	
	public HashMap<String, Object> getUserInfo(String access_Token);
	
	public String findid(MemberVO vo);
	
	public int findpw(MemberVO vo);
	
	public MemberVO[] getMembers(MemberVO vo);
	
	public int MemberCnt(MemberVO vo);
	
	public int isPermit(MemberVO vo);
	
	public int permitting(MemberVO vo);
	
}
