package com.javaex.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.GalleryService;
import com.javaex.vo.GalleryVo;

@Controller
@RequestMapping(value = "/api/gallery", method = {RequestMethod.GET, RequestMethod.POST})
public class ApiGalleryController {
	
	@Autowired
	private GalleryService galleryService;
	
	@ResponseBody
	@RequestMapping(value = "/show", method = {RequestMethod.GET, RequestMethod.POST})
	public GalleryVo show(@RequestParam("galleryNo") int galleryNo) {
		
		GalleryVo showVo = galleryService.getImg(galleryNo);
		
		return showVo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/remove", method = {RequestMethod.GET, RequestMethod.POST})
	public int remove(@RequestParam("galleryNo") int galleryNo) {

		return galleryService.remove(galleryNo);
	}
	
}
