package com.javaex.api.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.GuestBookService;
import com.javaex.vo.GuestBookVo;

@Controller
@RequestMapping(value="/api/guestbook", method = {RequestMethod.GET, RequestMethod.POST})
public class ApiGuestBookController {
	
	@Autowired
	private GuestBookService guestBookService;
	
	//ajax 리스트 가져오기
	@ResponseBody		//일반적인 방식으로 보내는 것이 아니라, Response의 Body 영역으로 보내라
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	public List<GuestBookVo> list() {
		
		List<GuestBookVo> guestBookList = guestBookService.getList();
		for(GuestBookVo guestBookInfo : guestBookList)
			System.out.println(guestBookInfo);
		
		return guestBookList;
	}
	
	//ajax 방명록 저장
	@ResponseBody
	@RequestMapping(value="/write" , method = {RequestMethod.GET, RequestMethod.POST})
	public GuestBookVo write(@ModelAttribute GuestBookVo guestBookVo) {
		GuestBookVo guestBookAdd = guestBookService.ajaxAdd(guestBookVo);
		System.out.println(guestBookAdd);
		return guestBookAdd;
	}
	
	//ajax 방명록 삭제
	@ResponseBody
	@RequestMapping(value="/remove", method = {RequestMethod.GET, RequestMethod.POST})
	public int remove(@RequestParam("no") int no, @RequestParam("password") String password) {
		
		System.out.println("remove");
		
		Map<String, Object> removeMap = new HashMap<String, Object>();
		removeMap.put("no", no);
		removeMap.put("password", password);
		
		System.out.println(removeMap);
		
		return guestBookService.delete(removeMap);
	}  
	
	//ajax 방명록 저장 - App
	@ResponseBody
	@RequestMapping(value="/write2", method= {RequestMethod.GET, RequestMethod.POST}) 
	public void write2(@RequestBody GuestBookVo guestbookVo){
		
		System.out.println("write2");
		System.out.println(guestbookVo.toString());
		
		guestBookService.addGuestBook(guestbookVo);
		
	}
	
}
