package com.benworld.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.benworld.domain.BoardVO;
import com.benworld.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void resiterGET(BoardVO vo, Model model) throws Exception{
		logger.info("register get ..........");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(BoardVO vo, Model model) throws Exception {
		logger.info("register Post .............");
		logger.info(vo.toString());
		
		service.regist(vo);
		
		model.addAttribute("result", "success");
		
		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value="/listAll", method= RequestMethod.GET)
	public void listAll(Model model)throws Exception{
		logger.info("show all list.........");
	}
	

}
