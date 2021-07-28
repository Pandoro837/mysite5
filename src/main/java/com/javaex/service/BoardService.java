package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.BoardDao;
import com.javaex.vo.BoardVo;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	
	public BoardVo getBoard(int boardNo) {

		//조회수 올리기
		boardDao.updateHit(boardNo);
		
		//게시글 가져오기
		BoardVo boardRead = boardDao.selectOneBoard(boardNo);
		
		return boardRead;
	}

}
