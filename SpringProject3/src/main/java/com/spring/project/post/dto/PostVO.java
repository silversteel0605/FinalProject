package com.spring.project.post.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PostVO {
	private int rownumber;
	private int post_id;
	private String member_id;
	private int comment_id;
	private String title;
	private String content;
	private String reg_date;
	private String edit_date;
	private int board_class;
	private int contents_category;
	private int process;
	
}