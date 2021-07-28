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
	
	public void delete(Map<String, Object> deleteMap) {
		guestBookDao.delete(deleteMap);
	}
}
