package com.spring.project.post.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostVO {
	private Integer rownumber;
	private Integer post_id;
	private String member_id;
	private String title;
	private String contents;
	private String reg_date;
	private Integer board_class;
	private Integer contents_category;
	private Integer process;
	private String imgURL;
	private Integer views;
	private Integer total;
	
}