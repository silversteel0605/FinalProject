package com.spring.project.camping.service;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.camping.DTO.CampingImgVO;
import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.SearchVO;
import com.spring.project.camping.DTO.TourImgVO;
import com.spring.project.camping.DTO.TourismVO;
import com.spring.project.camping.mapper.CampingDataMapper;
import com.spring.project.review.DTO.CampingReviewDTO;
import com.spring.project.utill.PagingVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CampingServiceImpl implements CampingService{
	
	@Autowired
	CampingDataMapper dataMapper;

	Element body;
	
	@Override
	public void getSearchXML(String nowPage) throws  IOException, JDOMException {
		StringBuffer sb = new StringBuffer("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?");
		
		sb.append("ServiceKey=g0wEuuHHfi9739JVMZEXUYrz5%2F12c86SzjoT%2BGS5UmE2E8HC1u9N0I64ZUa3jHRh2l6%2FQdBpQ%2BDmGVWi1Ai0Vw%3D%3D");
		sb.append("&numOfRows=9");
		sb.append("&pageNo=" + nowPage);
		sb.append("&MobileOS=ETC");
		sb.append("&MobileApp=AppTest");
		
		URL url = new URL(sb.toString());
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Content-Type","application/xml");
		
		conn.connect();
		SAXBuilder builder = new SAXBuilder();
		
		Document document = builder.build(conn.getInputStream());
		
		Element root = document.getRootElement();
		//루트의 자식!이니까 child를 얻어야한다!
		body = root.getChild("body");
	
	}
	
	@Override
	public void getAllXML() throws IOException, JDOMException {
		StringBuffer sb = new StringBuffer("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?");
		getSearchXML("1");
		int total = getTotal();
		
		sb.append("ServiceKey=g0wEuuHHfi9739JVMZEXUYrz5%2F12c86SzjoT%2BGS5UmE2E8HC1u9N0I64ZUa3jHRh2l6%2FQdBpQ%2BDmGVWi1Ai0Vw%3D%3D");
		sb.append("&MobileOS=ETC");
		sb.append("&MobileApp=AppTest");
		sb.append("&numOfRows=" + total);
		
		URL url = new URL(sb.toString());
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Content-Type","application/xml");
		
		conn.connect();
		SAXBuilder builder = new SAXBuilder();
		
		Document document = builder.build(conn.getInputStream());
		
		Element root = document.getRootElement();
		body = root.getChild("body");
		
	}
	
	//img
	@Override
	public List<CampingImgVO> getCampingImgXML(String contentId) throws IOException, JDOMException {
		// TODO Auto-generated method stub
		
		StringBuffer sb = new StringBuffer("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/imageList?");
		
		sb.append("ServiceKey=BSB%2BAVJtGeeYeTI1z0QkTWviASTC4BHieJzLrJls7C%2F0tpX9h75z347M%2FqQwTZsuya4Z2fMERT5YYljGpkDwog%3D%3D");
		sb.append("&MobileOS=ETC");
		sb.append("&MobileApp=AppTest");
		sb.append("&contentId="+contentId);
		
		URL url = new URL(sb.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Content-Type","application/xml");
		
		conn.connect();
		SAXBuilder builder = new SAXBuilder();
		
		Document document = builder.build(conn.getInputStream());
		
		Element root = document.getRootElement();
		//루트의 자식!이니까 child를 얻어야한다!
		body = root.getChild("body");
		
		Element items = body.getChild("items");
		List<Element> item_list = items.getChildren("item");
		List<CampingImgVO> vos = new ArrayList<CampingImgVO>();
		
		for(Element item:item_list) {
			
			CampingImgVO vo = new CampingImgVO();
			
			vo.setContentId(item.getChildText("contentId"));
			vo.setImgURL(item.getChildText("imageUrl"));
			vo.setSerialnum(item.getChildText("serialnum"));
			vo.setCreatedtime(item.getChildText("createdtim"));
			vo.setModifiedtime(item.getChildText("modifiedtime"));
			
			vos.add(vo);
		}
		
		return vos;
	}
	
	
	//주변 관광지
	@Override
	public void tourXML(TourismVO vo) throws  IOException, JDOMException {
		StringBuffer sb = new StringBuffer("http://api.visitkorea.or.kr/openapi/service/rest/EngService/areaBasedList");
		
		sb.append("ServiceKey=BSB%2BAVJtGeeYeTI1z0QkTWviASTC4BHieJzLrJls7C%2F0tpX9h75z347M%2FqQwTZsuya4Z2fMERT5YYljGpkDwog%3D%3D");
		sb.append("&numOfRows=10");
		sb.append("&pageNo=1");
		sb.append("&MobileOS=ETC");
		sb.append("&MobileApp=AppTest");
		
		URL url = new URL(sb.toString());
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Content-Type","application/xml");
		
		conn.connect();
		SAXBuilder builder = new SAXBuilder();
		
		Document document = builder.build(conn.getInputStream());
		
		Element root = document.getRootElement();
		body = root.getChild("body");
	}
	
	@Override
	public TourismVO[] getTourismXML() {
		Element items = body.getChild("items");
		//items안에있는 자식들을 가져오자 ! 여러개니까 리스트여야겠지 ? 타입은 엘리먼트 !!
		List<Element> item_list = items.getChildren("item");
		TourismVO[] ar = new TourismVO[item_list.size()];
		
		int i =0;
		for(Element item:item_list) {
			TourismVO vo = new TourismVO();

			ar[i++] = vo;
		}
		
		return ar;
				
	}
	
	//주변 관광지 이미지
	@Override
	public List<TourImgVO> getTourImgXML(String contentId) throws IOException, JDOMException {
		StringBuffer sb = new StringBuffer("http://api.visitkorea.or.kr/openapi/service/rest/EngService/detailImage");
		
		sb.append("ServiceKey=BSB%2BAVJtGeeYeTI1z0QkTWviASTC4BHieJzLrJls7C%2F0tpX9h75z347M%2FqQwTZsuya4Z2fMERT5YYljGpkDwog%3D%3D");
		sb.append("&numOfRows=10");
		sb.append("pageNo=1");
		sb.append("&MobileOS=ETC");
		sb.append("&MobileApp=AppTest");
		sb.append("&contentId="+contentId);
		
		URL url = new URL(sb.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Content-Type","application/xml");
		
		conn.connect();
		SAXBuilder builder = new SAXBuilder();
		
		Document document = builder.build(conn.getInputStream());
		
		Element root = document.getRootElement();
		//루트의 자식!이니까 child를 얻어야한다!
		body = root.getChild("body");
		
		Element items = body.getChild("items");
		List<Element> item_list = items.getChildren("item");
		List<TourImgVO> vos = new ArrayList<TourImgVO>();
		
		for(Element item:item_list) {
			
			TourImgVO vo = new TourImgVO();
			
			vo.setContentid(item.getChildText("contentId"));
			vo.setImgname(item.getChildText("imgname"));
			vo.setOriginimgurl(item.getChildText("originimgurl"));
			vo.setSerialnum(item.getChildText("serialnum"));
			vo.setSmallimageurl(item.getChildText("smallimageurl"));
			
			vos.add(vo);
		}
		
		return vos;
		
		
	}
	
	@Override
	public CampingVO[] getXMLData() {
		Element items = body.getChild("items");
		//items안에있는 자식들을 가져오자 ! 여러개니까 리스트여야겠지 ? 타입은 엘리먼트 !!
		List<Element> item_list = items.getChildren("item");
		CampingVO[] ar = new CampingVO[item_list.size()];
		
		int i = 0;
		for(Element item:item_list) {
			
			CampingVO vo = new CampingVO();
			vo.setContentId(item.getChildText("contentId"));
			vo.setFacltNm(item.getChildText("facltNm"));
			vo.setLineIntro(item.getChildText("lineIntro"));
			vo.setAddr1(item.getChildText("addr1"));
			vo.setAddr2(item.getChildText("addr2"));
			vo.setFirstImageUrl(item.getChildText("firstImageUrl") != null ? 
					item.getChildText("firstImageUrl") : "https://via.placeholder.com/300");
			vo.setDoNm(item.getChildText("doNm"));
			vo.setSigunguNm(item.getChildText("sigunguNm"));
			vo.setLctCl(item.getChildText("lctCl"));
			vo.setFacltDivNm(item.getChildText("facltDivNm"));
			vo.setInduty(item.getChildText("induty"));
			vo.setThemaEnvrnCl(item.getChildText("themaEnvrnCl"));
			
			vo.setSbrsCl(item.getChildText("sbrsCl")); 
			
			vo.setMapX(item.getChildText("mapX"));
			vo.setMapY(item.getChildText("mapY"));
			
			vo.setIntro(item.getChildText("intro"));
			vo.setTel(item.getChildText("tel"));
			vo.setHomepage(item.getChildText("homepage"));
			vo.setOperDeCl(item.getChildText("operDeCl"));
			
			vo.setGnrlSiteCo(item.getChildText("gnrlSiteCo"));
			vo.setAutoSiteCo(item.getChildText("autoSiteCo"));
			vo.setGlampSiteCo(item.getChildText("glampSiteCo"));
			vo.setCaravSiteCo(item.getChildText("CaravSiteCo"));
			vo.setSitedStnc(item.getChildText("sitedStnc"));
			vo.setSbrsEtc(item.getChildText("sbrsEtc"));
			vo.setPosblFcltyCl(item.getChildText("posblFcltyCl"));
			vo.setPosblFcltyEtc(item.getChildText("posblFcltyEtc"));
			
			vo.setEqpmnLendCl(item.getChildText("eqpmnLendCl"));
			vo.setAnimalCmgCl(item.getChildText("animalCmgCl"));

			ar[i++] = vo;
		}
		
		return ar;
	}
	
	
	@Override
	public CampingVO[] getDbSearchData(SearchVO vo) {
		return dataMapper.getSearchData(vo);
	}

	@Override
	public int initData(CampingVO vo){
		return dataMapper.initData(vo);
	}
	
	@Override
	public int getTotal() {
		return Integer.parseInt(body.getChildText("totalCount"));
	}
	
	@Override
	public int getDbSearchTotal(SearchVO vo) {
		return dataMapper.getSearchTotal(vo);
	}

	@Override
	public CampingVO getInfo(String contentId) {
		return dataMapper.getInfo(contentId);
	}

	@Override
	public int addData(CampingVO vo) {
		return dataMapper.addData(vo);
	}

	@Override
	public int updateData(CampingVO vo) {
		return dataMapper.updateData(vo);
	}

	@Override
	public int deleteData(String contentId) {
		dataMapper.deleteData(contentId);
		return 1;
	}
	
	public void addViews(String contentId) {
		dataMapper.addViews(contentId);
	}

	@Override
	public void getTourismXML(TourismVO vo) {
		
		
	}

	@Override
	public TourismVO[] getTourismData() {
		
		return null;
	}

	@Override
	public int addCampingUpdataData(CampingVO vo) {
		return dataMapper.addCampingUpdataData(vo);
	}

}
