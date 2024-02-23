package com.project.json;

import java.util.List;

public interface JsonService {

	List<JsonVO> getJsonList(JsonVO vo);
	JsonVO getJson(JsonVO vo);
	
	void jsonInsert(JsonVO vo);
	
	int totalCount();
	int cnt(JsonVO vo);
}
