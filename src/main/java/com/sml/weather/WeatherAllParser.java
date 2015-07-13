package com.sml.weather;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

public class WeatherAllParser {
	private URL url = new URL(
			"http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108");	
	
	private ArrayList<WeatherAllDTO> list = new ArrayList<WeatherAllDTO>();	
	public WeatherAllParser() throws Exception {
	}

	public ArrayList<WeatherAllDTO> xmlRssParser() throws Exception {		
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		XmlPullParser xpp = factory.newPullParser();
		BufferedInputStream bis = new BufferedInputStream(url.openStream());
		xpp.setInput(bis, "utf-8");
		String tag = null;
		String region = null;
		String temp = null;
		String tmEf=null; //시간
		String wf = null; //하늘 상태(예 구름많음)
		String tmn = null; //최저온도
		String tmx = null; //최고온도
		
		int eventType = xpp.getEventType();
		while (eventType != XmlPullParser.END_DOCUMENT) {
			if (eventType == XmlPullParser.START_TAG) {
				tag = xpp.getName();
			} else if (eventType == XmlPullParser.TEXT) {
				if (tag.equals("province") && !xpp.getText().contains("\n")) {
					region=xpp.getText();
				}else if(tag.equals("tmEf") && !xpp.getText().contains("\n")) {
					tmEf=xpp.getText();
				}else if(tag.equals("wf") && !xpp.getText().contains("\n")) {
					wf=xpp.getText();
				}else if(tag.equals("tmn") && !xpp.getText().contains("\n")) {
					tmn=xpp.getText();
				}else if(tag.equals("tmx") && !xpp.getText().contains("\n")) {
					tmx=xpp.getText();
				}	
				
			} else if (eventType == XmlPullParser.END_TAG) {//엔드 태그만 읽는다.
				tag = xpp.getName();
				
				if (tag.equals("data")) {	
					WeatherAllDTO weatherDto = new WeatherAllDTO();
					weatherDto.setRegion(region);
					weatherDto.setTmEf(tmEf);
					weatherDto.setTmn(tmn);
					weatherDto.setTmx(tmx);
					weatherDto.setWf(wf);
					
					list.add(weatherDto);					
				}
				
				if (tag.equals("body")) {						
					break;					
				}
			}
			eventType = xpp.next();
		}			
		
		//printResult(list);
		return list;
	}

	/*private void printResult(ArrayList<WeatherDTO> list) {
			for (WeatherDTO entity : list) {System.out.println("시:" + entity.getSido() + " 온도:" + entity.getTemp() + " 날씨 : "+ entity.getWfKor());
		}
	}*/

	public static void main(String[] args) {
		try {
			new WeatherAllParser();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
