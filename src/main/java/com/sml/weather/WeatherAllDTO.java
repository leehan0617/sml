package com.sml.weather;

public class WeatherAllDTO {
	
	String tmEf = null; //시간	
	String region = null; //지
	String wf = null; //하늘 상태(예 구름많음)
	String tmn = null; //최저온도
	String tmx = null; //최고온도	
	
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getTmEf() {
		return tmEf;
	}
	public void setTmEf(String tmEf) {
		this.tmEf = tmEf;
	}
	public String getWf() {
		return wf;
	}
	public void setWf(String wf) {
		this.wf = wf;
	}
	public String getTmn() {
		return tmn;
	}
	public void setTmn(String tmn) {
		this.tmn = tmn;
	}
	public String getTmx() {
		return tmx;
	}
	public void setTmx(String tmx) {
		this.tmx = tmx;
	}

	
    
}