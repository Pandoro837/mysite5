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
	
	//정보 수정
	public void modify(UserVo userModify) {
		
		userDao.update(userModify);
		
	}
	
	//회원 가입
	public void join(UserVo userJoin) {
		
		userDao.insert(userJoin);
		
	}
	
	//회원 가입 시, 아이디 중복 체크
	public boolean idCheck(String id) {
		
		System.out.println("idCheck - service");
		System.out.println(id);
		
		
		boolean idCheck = false;
		
		//id가 db에 없는 경우
		if(userDao.selectId(id) == null || userDao.selectId(id).getId() == null)
		{
			idCheck =true;
		} 
		
		return idCheck;
	}
	
}
