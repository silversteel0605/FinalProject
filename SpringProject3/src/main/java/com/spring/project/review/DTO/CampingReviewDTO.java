package com.spring.project.review.DTO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CampingReviewDTO {
	private int reviewId;
	private int loginId;
	private int contentId;
	private String title;
	private Date createDate;
	private String contentValue;
	private String imgUrl;
	private int starRanking;
	private int clickNum;
}
