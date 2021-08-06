package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.BoardDao;
import com.javaex.vo.BoardVo;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	
	
	//페이징 연습용 리스트
	public Map<String, Object> getList2(int crtPage, String searchWord) {
		
		System.out.println("/service/list2");
		System.out.println(crtPage);
		
		//crtPage의 크기 수정
		//삼항 연산자
		crtPage = (crtPage <= 0) ? 1 : crtPage;
		
//		if(crtPage <= 0) {
//			crtPage = 1;
//		}
		//리스트의 갯수 정하기
		int listCnt = 10;
		//시작 번호
		int startNum = ((crtPage - 1) * listCnt ) + 1;
		//끝 번호
		int endNum = crtPage * listCnt;
//		int endNum = (startNum + listCnt) - 1;
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startNum", startNum);
		pageMap.put("endNum", endNum);
		pageMap.put("searchWord", searchWord);
		
		List<BoardVo> boardList = boardDao.selectList2(pageMap);
		
		System.out.println(boardList);
		
//		필요한 페이지의 갯수 구하기
		//게시글의 총 갯수
		int totalCnt = boardDao.selectCnt(searchWord);
		
		//페이지 버튼 갯수
		int pageBtnCnt = 5;
		
		//마지막 버튼 번호
		int endPageBtnNo = (int)Math.ceil((crtPage/(double)pageBtnCnt)) * pageBtnCnt;
		
		//시작 버튼 번호
		int startPageBtnNo = endPageBtnNo - (pageBtnCnt -1);
		
		boolean next = false;
		//다음 화살표 표현 유무
		if( (endPageBtnNo * listCnt)  < totalCnt) {
			next = true;
		} else {
			endPageBtnNo = (int)Math.ceil(totalCnt/(double)listCnt);
		}
		
		boolean prev = false;
		//이전 화살표 표현 유무
		if(startPageBtnNo != 1) {
			prev = true;
		}

		//리턴하기
		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("boardList", boardList);
		listMap.put("endPageBtnNo", endPageBtnNo);
		listMap.put("startPageBtnNo", startPageBtnNo);
		listMap.put("next", next);
		listMap.put("prev", prev);
		listMap.put("searchWord", searchWord);
		return listMap;
	}
	
	
	
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
//		for(int i = 0; i < 127; i++) {
//			boardWrite.setTitle(i + "번째 제목 입니다");
//			boardWrite.setContent(i + "번째 글 입니다");
			boardDao.insert(boardWrite);
//		}
		
	}
	
	public BoardVo modifyForm(int boardNo) {
		return boardDao.selectOneBoard(boardNo);
	}
	
	public void modify(BoardVo boardModified) {
		boardDao.updateBoard(boardModified);
	}
	
}
