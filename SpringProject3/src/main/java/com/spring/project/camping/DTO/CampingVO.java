package com.spring.project.camping.DTO;


import lombok.Data;

@Data
public class CampingVO {

	private String contentId;
	private String facltNm;
	private String lineIntro;
	private String addr1;
	private String addr2;
	private String firstImageUrl;
	private String doNm;
	private String sigunguNm;
	private String lctCl;
	private String facltDivNm;
	private String induty;
	private String themaEnvrnCl;
	private String sbrsCl;
	private String total; // total은 db 컬럼에 포함 안됌
	private String mapX;
	private String mapY;
	private String tagId;
	private int views;
	private int rn;
	private String intro;
	private String tel;
	private String homepage;
	private String operDeCl;
}
