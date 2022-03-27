package com.spring.project.member.DTO;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String birthday;
	private String post;
	private String addr1;
	private String addr2;
	private int member_type;
	private String email;
}
