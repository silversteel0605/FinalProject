package com.spring.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.member.DTO.MemberSearchVO;
import com.spring.project.member.DTO.MemberVO;
import com.spring.project.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/rest")
public class RestMemberController {
	
	@Autowired
	MemberService service;
	
	@GetMapping(value = "/signin")
	public int idcheck(MemberVO vo) {
		return service.idChk(vo);
	}
	
	@PostMapping(value = "/signin")
	public int signin(MemberVO vo) {
		return service.signin(vo);
	}
	
	@GetMapping(value = "/join")
	public int join(MemberVO vo) {
		return service.join(vo);
	}
	
	@PostMapping(value = "/findpw")
	public int findpw(MemberVO vo) {
		return service.findpw(vo);
	}
	
	@GetMapping(value="/manager/member")
	public MemberVO[] getMembers(MemberSearchVO vo) {
		vo.calcStartEnd(10);
		MemberVO[] mvo = service.getMembers(vo);
		mvo[0].setTotal(service.MemberCnt());
		return mvo;
	}
}
