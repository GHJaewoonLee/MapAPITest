package service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class SearchTourService {

	public static final String SERVICE_KEY = "qtc%2Bc5kjFD5ZL52A5hc9Gl9K7R19TiwhA2aX76hrsj7NHyOSJD56dtN4t7G1RHxKfmXAxI%2Fn8c18V0FbmoIWFA%3D%3D";
	
	public String getKeywordSearch(String location, String place) throws IOException {
		StringBuilder urlString = new StringBuilder();
		StringBuilder result = new StringBuilder();
		
		urlString.append("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?");		// 키워드로 검색
		urlString.append("ServiceKey="+SERVICE_KEY+"&");																	// 서비스 키
		urlString.append("numOfRows="+"50"+"&");															// 페이지 내의 결과 수
		urlString.append("pageNo="+"1"+"&");																// 현재 페이지
		urlString.append("MobileOS=ETC&");																	// IOS(아이폰), AND(안드로이드), WIN(원도우폰), ETC
		urlString.append("MobileApp=AppTest&");																// 모바일 앱 = 앱 이름
		urlString.append("listYN="+"Y"+"&");																// 목록 구분 = (Y=목록, N=개수)
		urlString.append("arrange="+"A"+"&");																// 정렬 = (A=제목순, B=조회순, C=수정일순, D=생성일순)
		urlString.append("contentTypeId="+"12"+"&");														// 관광타입(관광지, 숙박 등) ID = 12 (관광지)
		urlString.append("areacode="+Integer.parseInt(location)+"&");										// 지역코드
		urlString.append("keyword="+URLEncoder.encode((place).trim(), "UTF-8"));			// 검색할 키워드 (한글인 경우 UTF-8 인코딩 필수)
		
		URL url = new URL(urlString.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		
		BufferedReader reader;
		if ((conn.getResponseCode() >= 200) && (conn.getResponseCode() <= 300)) {
            reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        } else {
            reader = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
        }
		
		String line;
		while ((line = reader.readLine()) != null) {
            result.append(line);
        }
		
		reader.close();
        conn.disconnect();
		
		return result.toString();
	}

}
