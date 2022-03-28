package com.spring.project.camping.DTO;

import lombok.Data;

@Data
public class ReviewSearchVO {
	private String searchTy;
	private String keyword;
	private String title;
	private String content;
	private String uri;
	private String[] titles;
	private String[] contents;
	private String order;
	private int start;
	private int end;
	
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	
	public void setConditionUri() {
		uri = String.format("&searchTy=%s&keyword=%s&title=%s&content=%s", searchTy, keyword, title, content);
		if(titles != null && titles.length != 0) {			
			for(String info : titles) {
				uri += "&title=" + info;
			}
		}
		if(contents != null && contents.length != 0) {			
			for(String info : contents) {
				uri += "&content=" + info;
			}
		}
	}
	
	public void setOrderUri() {
		if (order != null) {
			if (uri != null) {				
				uri += "&order=" + order;
			} else {
				uri = "&order=" + order;
			}
		}
	}
}
