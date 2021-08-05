package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
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
		
		String filePath = saveDirectory +"\\"+ saveName;
		long size = file.getSize();
		
		try {
			//파일 정보를 하드 디스크에 저장
			byte[] fileData = file.getBytes();
			
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bf = new BufferedOutputStream(out);
			
			bf.write(fileData);
			bf.close();
			
			//파일 정보를 db에 저장
			GalleryVo galleryVo = new GalleryVo(userNo, filePath, orgName, saveName, content, size);
			galleryDao.insert(galleryVo);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public GalleryVo getImg(int galleryNo) {
		return galleryDao.selectOne(galleryNo);
	}
	
	public int remove(int galleryNo) {
		return galleryDao.delete(galleryNo);
	}
	
}
