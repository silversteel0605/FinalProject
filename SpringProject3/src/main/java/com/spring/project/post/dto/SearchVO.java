package com.spring.project.post.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SearchVO {
	private Integer board_class;
	private Integer category;
	private String searchByWhat;
	private String searchKeyword;
}
