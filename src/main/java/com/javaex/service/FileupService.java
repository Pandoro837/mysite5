package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.GalleryDao;
import com.javaex.vo.GalleryVo;

@Service
public class FileupService {

	@Autowired
	private GalleryDao galleryDao;

	// 파일 업로드 처리	- 인증받지 않은 사용자의 등록
	public String restore(MultipartFile file) {
		System.out.println("/restore");
		//저장 경로
		String saveDirectory = "C:\\JavaStudy\\upload";
		
		//원파일 이름
		String orgName = file.getOriginalFilename();
		System.out.println(orgName);
		
		//확장자
		int indexNum = file.getOriginalFilename().lastIndexOf(".");
		String exName = file.getOriginalFilename().substring(indexNum);
		System.out.println(exName);
		
		//저장파일 이름
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		System.out.println(saveName);
		
		//파일 패스
		String filePath = saveDirectory +"\\"+ saveName;
		System.out.println(filePath);
		
		//파일 사이즈
		long fileSize = file.getSize();
		System.out.println(fileSize);
		
		//파일을 서버 하드 디스크에 저장
		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bf = new BufferedOutputStream(out);
			
			bf.write(fileData);
			bf.close();
			
			System.out.println("전송 종료");
			
			GalleryVo galleryVo = new GalleryVo(filePath, orgName, saveName, fileSize);
			galleryVo.setUserNo(2);
			galleryVo.setContent("");
			System.out.println(galleryVo.toString());
			//파일 정보를 db에 저장
			int iCount = galleryDao.insert(galleryVo);
			
			System.out.println(iCount + "건이 저장되었습니다");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return saveName;
		
	}

}
