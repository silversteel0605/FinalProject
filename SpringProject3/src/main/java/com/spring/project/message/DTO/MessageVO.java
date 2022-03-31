package com.spring.project.message.DTO;

import java.sql.Date;

import lombok.Data;

@Data
public class MessageVO {
	private String member_id;
	private String msg;
	private Date send_date;
	private int read;
	
	public void messaging(String content, String blindContent) {
		String msg = String.format("본문: %s / 블라인드 사유:%s", content, blindContent);
		setMsg(msg);
	}
}
