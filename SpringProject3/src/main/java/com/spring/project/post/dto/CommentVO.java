package com.spring.project.post.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentVO {

	private Integer comment_id;
	private Integer post_id;
	private Integer category_id;
	private String member_id;
	private String comments;
	private Integer classnum;
	private Integer ordernum;
	private Integer groupnum;
}
