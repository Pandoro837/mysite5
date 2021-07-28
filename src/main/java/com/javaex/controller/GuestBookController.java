package com.javaex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.GuestBookService;
import com.javaex.vo.GuestBookVo;

@Controller
@RequestMapping(value="/guestbook", method = {RequestMethod.GET, RequestMethod.POST})
public class GuestBookController {

	@Autowired
	private GuestBookService guestBookService;
	
	@RequestMapping(value="/addList", method = {RequestMethod.GET, RequestMethod.POST})
	public String addList(Model model) {
		
		List<GuestBookVo> guestBookList = guestBookService.getList();
		model.addAttribute("guestBookList",guestBookList);	
		
		return "/guestbook/addList";
	}
	
	@RequestMapping(value = "/add", method = {RequestMethod.GET, RequestMethod.POST})
	public String add(@ModelAttribute GuestBookVo guestBookAdd) {
		
		guestBookService.addGuestBook(guestBookAdd);
		
		return "redirect:/guestbook/addList";
	}
	
	@RequestMapping(value = "/deleteForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteForm(Model model,@RequestParam("no") int no) {
		
		model.addAttribute("no", no);
		
		return "/guestbook/deleteForm";
	}
	
	@RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(@RequestParam("no") int no, @RequestParam("password") String password) {
		
		Map<String, Object> deleteMap = new HashMap<String, Object>();
		deleteMap.put("no", no);
		deleteMap.put("password", password);
		
		guestBookService.delete(deleteMap);
		
		return "redirect:/guestbook/addList";
	}
}
