package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public UserVo selectUser(UserVo userVo) {
		
		UserVo authUser = sqlSession.selectOne("user.selectUser", userVo);
		
		return authUser;
		
	}
	
	public UserVo selectUserModify(int userNo) {
		
		UserVo userModify = sqlSession.selectOne("user.selectUserModify", userNo);
		
		return userModify;
		
	}
	
	
}
