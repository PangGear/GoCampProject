package com.project.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JsonServiceImpl implements JsonService{

	@Autowired
	private JsonDao dao;
	
	@Override
	public List<JsonVO> getJsonList(JsonVO vo) {
		
		return dao.getJsonList(vo);
	}

	@Override
	public void jsonInsert(JsonVO vo) {
		
		dao.jsonInsert(vo);
	}

	@Override
	public JsonVO getJson(JsonVO vo) {
		
		return dao.getJson(vo);
	}

	@Override
	public int totalCount() {
		return dao.totalCount();
	}

	@Override
	public int cnt(JsonVO vo) {
		
		return dao.cnt(vo);
	}
}
