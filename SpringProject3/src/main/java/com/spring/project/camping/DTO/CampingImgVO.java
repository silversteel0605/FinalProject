package com.spring.project.camping.DTO;

import lombok.Data;

@Data
public class CampingImgVO {
	private String contentId;		// Camping ID
	private String imgURL;			// IMG URL
	private String serialnum;		// Serial Number
	private String createdtime;		// Create Day
	private String modifiedtime;	// Update Day
}
