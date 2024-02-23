package com.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.json.JsonService;
import com.project.json.JsonVO;

@Controller
public class JsonController {
	
	@Autowired
	private JsonService service;

    @GetMapping("jsonInsert.do")
    String jsonInsert(JsonVO vo) throws Exception {
    	
        StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/15111395/v1/uddi:8c528230-eda4-4d83-855a-bee73605e49f");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
                + "=qL0TIp1SqhZyXibAUGDBeK3EOQJeQtC0brnIeUqsacuSolQCo164CVkuGYcDf98VtO6sHpXXs0aed2KvrQLSPw%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("returnType", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("page", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("perPage", "UTF-8") + "=" + URLEncoder.encode("150", "UTF-8"));
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb);

        try {
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(sb.toString());
            JSONArray data = (JSONArray) jsonObject.get("data");
            System.out.println("data=========>" + data);
            System.out.println("* items *");
            
            for(int i=1; i< 150; i++){
                System.out.println("=items_"+i+" ===========================================");
                JSONObject object = (JSONObject) data.get(i);
                if((String) object.get("도로명주소")!=null) {     
                	vo.setRoadAddress((String) object.get("도로명주소"));
                	}  else {
                		vo.setRoadAddress(" ");
                	}
	              vo.setFacility((String) object.get("시설명"));
	              vo.setLatitude((String) object.get("위도"));
	              vo.setLongitude((String) object.get("경도"));
	              vo.setTelephone((String) object.get("전화번호"));
	              vo.setFacilityInfo((String) object.get("시설 소개"));
	              vo.setFacilityFeature((String) object.get("시설 특징"));
	              vo.setHomepage((String) object.get("홈페이지"));
	              vo.setFacilElectric((String) object.get("부대시설 전기"));
	              vo.setFacilHotwater((String) object.get("부대시설 온수"));
	              vo.setFacilWifi((String) object.get("부대시설 무선인터넷"));
	              vo.setFacilFirewood((String) object.get("부대시설 장작판매"));
	              vo.setFacilMarket((String) object.get("부대시설 마트"));
	              System.out.println(vo.getRoadAddress());
	              
	              service.jsonInsert(vo);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
      return "redirect:/getJsonList.do";
   }
    
	@GetMapping("/getCampList.do")
	String getJsonList(Model model, JsonVO vo) {
		
		int tc = service.totalCount();
		
	    int pagesize = 10;
	    int pageListSize = 10 ;
	    int totalPage = (int) Math.ceil((double) tc / pagesize);
		
		int start;
		if (vo.getStart() == 0) {
			start = 1;			
		}else {
			start = vo.getStart();			
		}
		vo.setCh2(vo.getCh2());
		int nowPage = start / pagesize + 1;
	      
		int listStartPage = (nowPage - 1) / pageListSize * pageListSize + 1;
		int listEndPage = listStartPage + pageListSize - 1 ;
		
		vo.setPageSize( pagesize );	
		vo.setStart(start);
		
		model.addAttribute("li",service.getJsonList(vo));
			
		model.addAttribute("start", start);
		model.addAttribute("tc", tc);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pagesize);
		model.addAttribute("pageListSize", pageListSize);
	  
		model.addAttribute("listStartPage", listStartPage);
		model.addAttribute("listEndPage", listEndPage);
		
		model.addAttribute("ch1", vo.getCh1());
		model.addAttribute("ch2", vo.getCh2());
		
		return "/camp/getCampList.jsp";
	}
	
	@GetMapping("/getCamp.do")
	String getJson(Model model, JsonVO vo) {
		
		service.cnt(vo);
		model.addAttribute("m",service.getJson(vo));
		
		return "/camp/getCamp.jsp";
	}
    
   
}