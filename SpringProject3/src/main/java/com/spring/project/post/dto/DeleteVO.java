package com.spring.project.post.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DeleteVO {

	private Integer post_id;
	private boolean delete;
}
