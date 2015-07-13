package com.sml.weather;

import java.io.BufferedInputStream;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

public class WeatherParser {
	private URL seoul = new URL(
			"http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1168066000");
	private URL suwon = new URL(
			"http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=4111760000");
	private URL incheon = new URL(
			"http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=2871025000");
	private URL sungnam = new URL(
			"http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=4113566500");
	private URL anyang = new URL(
			"http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=4117363000");
	private URL deagu = new URL(
			"http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=2720065000");
	private URL ulsan = new URL(
			"http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=3114056000");
	private URL jeju = new URL(
			"http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=5013025300");
	private URL busanl = new URL(
			"http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=2644058000");
	
	private ArrayList<WeatherDTO> list = new ArrayList<WeatherDTO>();
	private ArrayList<URL> urlList = new ArrayList<URL>();	
	private String[] sido={"서울", "수원", "인천", "성남", "안양", "대구", "울산", "제주", "부산"};
	private int count=0;
	
	public WeatherParser() throws Exception {
	}

	public ArrayList<WeatherDTO> xmlRssParser() throws Exception {

		urlList.add(seoul);
		urlList.add(suwon);
		urlList.add(incheon);
		urlList.add(sungnam);
		urlList.add(anyang);
		urlList.add(deagu);
		urlList.add(ulsan);
		urlList.add(jeju);
		urlList.add(busanl);
		
		for (URL url : urlList) {
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser xpp = factory.newPullParser();
			BufferedInputStream bis = new BufferedInputStream(url.openStream());
			xpp.setInput(bis, "utf-8");
			String tag = null;
			String temp = null; //현재 온도
			String sky = null; //하늘 상태 코드 0, 1, 2, 3
			String pty = null; //강수 상태 코드 
			String wfKor = null; // 날씨 한국어
			String pop = null; //강수 확률
			String r12 = null; //12시간 예상강수량
			String s12 = null; //12시간 예상적설량
			String city = null; //시이름
			int eventType = xpp.getEventType();
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = xpp.getName();
				} else if (eventType == XmlPullParser.TEXT) {
					if (tag.equals("temp") && !xpp.getText().contains("\n")) {
						temp = xpp.getText();
					} else if (tag.equals("sky") && !xpp.getText().contains("\n")) {
						sky = xpp.getText();
					} else if (tag.equals("pty") && !xpp.getText().contains("\n")) {
						pty = xpp.getText();
					} else if (tag.equals("wfKor") && !xpp.getText().contains("\n")) {
						wfKor = xpp.getText();
					} else if (tag.equals("pop") && !xpp.getText().contains("\n")) {
						pop = xpp.getText();
					} else if (tag.equals("r12") && !xpp.getText().contains("\n")) {
						r12 = xpp.getText();
					} else if (tag.equals("s12") && !xpp.getText().contains("\n")) {
						s12 = xpp.getText();
					}
				} else if (eventType == XmlPullParser.END_TAG) {
					tag = xpp.getName();
					
					//category=시도
					if (tag.equals("data")) {
						WeatherDTO entity = new WeatherDTO();
						entity.setTemp(temp);
						entity.setSky(sky);
						entity.setPty(pty);
						entity.setWfKor(wfKor);
						entity.setPop(pop);
						entity.setR12(r12);
						entity.setS12(s12);
						entity.setSido(sido[count++]);
						list.add(entity);												
					}
					
					if (tag.equals("data")) {						
						break;					
					}
				}
				eventType = xpp.next();
			}			
		}
		//printResult(list);
		return list;
	}
/*
	private void printResult(ArrayList<WeatherDTO> list) {
			for (WeatherDTO entity : list) {System.out.println("시:" + entity.getSido() + " 온도:" + entity.getTemp() + " 날씨 : "+ entity.getWfKor());
		}
	}*/

	public static void main(String[] args) {
		try {
			new WeatherParser();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
