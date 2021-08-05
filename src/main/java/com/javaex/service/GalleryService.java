package com.javaex.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.GalleryDao;
import com.javaex.vo.GalleryVo;

@Service
public class GalleryService {

	@Autowired
	private GalleryDao galleryDao;
	
	public List<GalleryVo> getList(){
		
		return galleryDao.selectList();
	}
	
	public void restore(MultipartFile file, String content, int userNo) {
		
		String saveDirectory = "C:\\JavaStudy\\upload";
		
		String orgName = file.getOriginalFilename();
		
		int indexNum = file.getOriginalFilename().lastIndexOf(".");
		String exName = file.getOriginalFilename().substring(indexNum);
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		
		String filePath = saveDirectory + "\\" + saveName;
		long size = file.getSize();
		
		GalleryVo galleryVo = new GalleryVo();

		galleryDao.insert(null);
		
	}
	
}
