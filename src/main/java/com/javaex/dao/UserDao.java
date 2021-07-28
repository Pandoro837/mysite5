package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//로그인
	public UserVo selectUser(UserVo userVo) {
		
		UserVo authUser = sqlSession.selectOne("user.selectUser", userVo);
		
		return authUser;
		
	}
	
	//수정 할 회원의 정보 가져오기
	public UserVo selectUserModify(int userNo) {
		
		UserVo userModify = sqlSession.selectOne("user.selectUserModify", userNo);
		
		return userModify;
		
	}
	
	//회원 정보 수정
	public void update(UserVo userModify) {
		
		sqlSession.update("user.updateUser", userModify);
		
	}
	
	//회원가입
	public void insert(UserVo userJoin) {
		
		sqlSession.insert("user.insertUser", userJoin);
		
	}
	
	
}
