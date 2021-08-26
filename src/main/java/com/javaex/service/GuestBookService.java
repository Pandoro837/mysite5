package com.javaex.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.GuestBookDao;
import com.javaex.vo.GuestBookVo;

@Service
public class GuestBookService {

	@Autowired
	private GuestBookDao guestBookDao;
	
	public List<GuestBookVo> getList(){
		return guestBookDao.selectList();
	}
	
	public void addGuestBook(GuestBookVo guestBookAdd) {
		guestBookDao.insert(guestBookAdd);
	}
	
	//ajax용 insert
	public GuestBookVo ajaxAdd(GuestBookVo guestBookAdd) {
		//저장
		//저장된 갯수 return + guestBookAdd에 no 추가
		guestBookDao.ajaxInsert(guestBookAdd);	
		//no 저장하기
		int no = guestBookAdd.getNo();
		
		//글 가져오기
		GuestBookVo guestBookReturn = guestBookDao.selectOne(no);
		return guestBookReturn;
	}
	
	public GuestBookVo getGuestBookVo(GuestBookVo requestVo) {
		
		int no = requestVo.getNo();
		
		GuestBookVo guetsBookVo = guestBookDao.selectOne(no);
		
		return guetsBookVo;
		
	}
		
	public int delete(Map<String, Object> deleteMap) {
		return guestBookDao.delete(deleteMap);
	}
	
}
