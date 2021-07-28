package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.GuestBookVo;

@Repository
public class GuestBookDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<GuestBookVo> selectList(){
		
		List<GuestBookVo> guestBookList = sqlSession.selectList("guestbook.selectList");
		
		return guestBookList;
	}
	
	public void insert(GuestBookVo guestBookAdd) {
		sqlSession.insert("guestbook.insertGuestBook", guestBookAdd);
	}
	
	public void delete(Map<String, Object> deleteMap) {
		sqlSession.delete("guestbook.delete",deleteMap);
	}
	
}
