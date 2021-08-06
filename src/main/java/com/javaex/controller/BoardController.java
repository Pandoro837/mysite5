package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BoardService;
import com.javaex.vo.BoardVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="/board", method = {RequestMethod.GET, RequestMethod.POST})
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	 
	
	//페이징 연습용 리스트
	@RequestMapping(value="/list2", method = {RequestMethod.GET, RequestMethod.POST})
	public String list2(Model model, @RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage,
									 @RequestParam(value = "searchWord", required = false, defaultValue = "") String searchWord
			) {
		
		System.out.println("/controller/list2");
		System.out.println(crtPage);
		
		Map<String, Object> listMap = boardService.getList2(crtPage, searchWord);
		
		model.addAttribute("listMap", listMap);
		System.out.println(listMap);

		return "/board/list2";
	}
	
	
	@RequestMapping(value="/read", method = {RequestMethod.GET, RequestMethod.POST})
	public String read(Model model, @RequestParam("no") int no) {
		
		BoardVo boardRead = boardService.getBoard(no);
		model.addAttribute("boardRead", boardRead);
		
		return "/board/read";
	}
	
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(Model model, @RequestParam(value = "searchWord", required=false, defaultValue="") String searchWord) {
		
		List<BoardVo> boardList = boardService.getList(searchWord);
		
		model.addAttribute("boardList", boardList);
		
		return "/board/list";
	}
	
	
	
	@RequestMapping(value="/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(@RequestParam("no") int no) {
		
		boardService.delete(no);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/writeForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeForm() {
		return "/board/writeForm";
	}
	
	@RequestMapping(value="/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String write(@ModelAttribute BoardVo boardWrite, HttpSession session) {
		
		int userNo = ((UserVo)session.getAttribute("authUser")).getNo();
		boardWrite.setUserNo(userNo);
		boardService.write(boardWrite);
		
		return "redirect:/board/list";	
	}
	
	@RequestMapping(value="/modifyForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String modifyForm(Model model, @RequestParam("no") int boardNo) {
		
		BoardVo boardModify = boardService.modifyForm(boardNo);
		
		model.addAttribute("boardModify", boardModify);
		
		return "/board/modifyForm";
	}
	
	@RequestMapping(value="/modify", method = {RequestMethod.GET, RequestMethod.POST})
	public String modify(@ModelAttribute BoardVo boardModified) {
		
		boardService.modify(boardModified);
		
		return "redirect:/board/list";	
	}
}
