package com.project.board;

import java.util.List;

import com.project.json.JsonVO;

public interface BoardService {

	List<BoardVO> getBoardList(BoardVO vo);
	BoardVO getBoard(BoardVO vo);
	
	void boardInsert(BoardVO vo);
	void boardUpdate(BoardVO vo);
	void boardDelete(BoardVO vo);
	
	int cnt(BoardVO vo);
}
