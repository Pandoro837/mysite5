package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	//로그인 사용자 정보 가져오기
	public UserVo getUser(UserVo userVo) {

		return userDao.selectUser(userVo);
		
	}
	
	//수정할 회원의 정보 가져오기
	public UserVo getModify(int userNo) {
		
		return userDao.selectUserModify(userNo);
		
	}
	
}
