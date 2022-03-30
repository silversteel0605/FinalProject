package com.spring.project.member.DTO;

import com.spring.project.utill.PageSearchVO;

import lombok.Data;

@Data
public class MemberVO extends PageSearchVO{
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String birthday;
	private String post;
	private String addr1;
	private String addr2;
	private String camp;
	private int member_type;
	private String email;
	private String tel;
	private int permit;
	private int total;
	private int rn;
}
