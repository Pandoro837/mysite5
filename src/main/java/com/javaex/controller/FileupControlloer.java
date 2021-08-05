package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.FileupService;

@Controller
@RequestMapping(value = "/fileup", method = {RequestMethod.GET, RequestMethod.POST})
public class FileupControlloer {
	
	@Autowired
	private FileupService fileupService;
	
	@RequestMapping(value= "/form", method = {RequestMethod.GET, RequestMethod.POST})
	public String form() {
		
		return "/fileup/form";
	}

	@RequestMapping(value= "/upload", method = {RequestMethod.GET, RequestMethod.POST})
	public String upload(Model model,@RequestParam("file") MultipartFile file) {
		System.out.print("/upload");

		//파일을 비즈니스 로직으로 넘김
		String saveName = fileupService.restore(file);
		
		//파일의 이름을 jsp로 전달 - model.addAttribute
		model.addAttribute("saveName",saveName);
		
		return "/fileup/result";
	}
}
