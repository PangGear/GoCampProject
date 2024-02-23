package com.project.json;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JsonDao {

	List<JsonVO> getJsonList(JsonVO vo);
	JsonVO getJson(JsonVO vo);
	
	void jsonInsert(JsonVO vo);
	
	int totalCount();
	int cnt(JsonVO vo);
}
