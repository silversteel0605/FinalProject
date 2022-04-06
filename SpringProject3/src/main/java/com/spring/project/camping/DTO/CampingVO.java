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
	
	private String total; // total은 db 컬럼에 포함 안됌
	private String mapX;
	private String mapY;
	private String tagId;
	
	private String intro;
	private String tel;
	private String homepage;
	private String operDeCl;
	
	//잔디, 파쇄석, 테크, 자갈, 맨흙
	private String siteBottomCl1;
	private String siteBottomCl2;
	private String siteBottomCl3;
	private String siteBottomCl4;
	private String siteBottomCl5;
	
	private String gnrlSiteCo;		// 일반야영장 개수
	private String autoSiteCo;		// 자동차야영장 개수
	private String glampSiteCo;		// 글램핑 개수
	private String caravSiteCo;		// 카라반 개수
	
	private String sitedStnc;		// 사이트간의 거리
	
	private String sbrsCl;			// 부대시설
	private String sbrsEtc;			// 부대시설 기타
	private String posblFcltyCl;	// 주변이용가능시설
	private String posblFcltyEtc;	// 주변이용가능시설기타
	
	private String eqpmnLendCl;		// 캠핑장장비대여
	private String animalCmgCl;		// 애완동물
	
	private int views;
	private int rn;
	
}

