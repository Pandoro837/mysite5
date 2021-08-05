package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.GalleryVo;

@Repository
public class GalleryDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(GalleryVo galleryVo) {
		
		return sqlSession.insert("gallery.insert", galleryVo);
	}
	
	//리스트 가져오기
	public List<GalleryVo> selectList(){
		return sqlSession.selectList("gallery.selectList");
	}
	
	public GalleryVo selectOne(int galleryNo) {
		return sqlSession.selectOne("gallery.selectOne", galleryNo);
	}
	
	public int delete(int galleryNo) {
		
		return sqlSession.delete("gallery.delete", galleryNo);
	}
	
}
