package com.spring.project.utill;

import lombok.Data;

@Data
public class PageSearchVO {
	private int start;
	private int end;
	private String nowPage;
	
	public void calcStartEnd(int cntPerPage) {
		setEnd(Integer.parseInt(nowPage) * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
}
