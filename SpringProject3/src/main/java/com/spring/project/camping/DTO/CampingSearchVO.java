package com.spring.project.camping.DTO;

import lombok.Data;

@Data
public class CampingSearchVO {
	private String searchTy;
	private String keyword;
	private String sido;
	private String gugun;
	private String locThem;
	private String uri;
	private String[] facltDivNm;
	private String[] induty;
	private String[] themaEnvrnCl;
	private String[] sbrsCl;
	private String[] tagId;
	private String order;
	private String contentId;
	private int start;
	private int end;
	
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	
	public void setConditionUri() {
		uri = String.format("&searchTy=%s&keyword=%s&sido=%s&gugun=%s&locThem=%s", searchTy, keyword, sido, gugun, locThem);
		if(facltDivNm != null && facltDivNm.length != 0) {			
			for(String info : facltDivNm) {
				uri += "&facltDivNm=" + info;
			}
		}
		if(induty != null && induty.length != 0) {			
			for(String info : induty) {
				uri += "&induty=" + info;
			}
		}
		if(themaEnvrnCl != null && themaEnvrnCl.length != 0) {			
			for(String info : themaEnvrnCl) {
				uri += "&themaEnvrnCl=" + info;
			}
		}
		if(sbrsCl != null && sbrsCl.length != 0) {			
			for(String info : sbrsCl) {
				uri += "&sbrsCl=" + info;
			}
		}
	}
	public void setTagUri() {
		uri = String.format("&searchTy=%s", searchTy);
		System.out.println(searchTy);
		if(tagId != null) {
			for (String info : tagId) {
				uri += "&tagId=" + info;
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
