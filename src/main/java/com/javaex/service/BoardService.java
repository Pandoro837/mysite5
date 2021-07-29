package com.javaex.service;

import java.util.List;

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
	
	public List<BoardVo> getList(String searchWord) {
		//리스트 가져오기
		return boardDao.selectList(searchWord);
	}
	
	public void delete(int no) {
		boardDao.delete(no);
	}
	
	public void write(BoardVo boardWrite) {
		boardDao.insert(boardWrite);
	}
	
	public BoardVo modifyForm(int boardNo) {
		return boardDao.selectOneBoard(boardNo);
	}
	
	public void modify(BoardVo boardModified) {
		boardDao.updateBoard(boardModified);
	}
	
}
