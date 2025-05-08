package com.laptrinhjavaweb.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.laptrinhjavaweb.dto.ChapterDTO;
import com.laptrinhjavaweb.service.IChapterService;
import com.laptrinhjavaweb.service.INewService;

@Controller(value = "chapterControllerOfWeb")
public class ChapterController {
	@Autowired
	private IChapterService chapterService;
	@Autowired
	private INewService newService;

	@RequestMapping(value = "/chapter", method = RequestMethod.GET)
	public String index(Model model, @RequestParam(name = "id", required = false) long id) {
		
		ChapterDTO dto = chapterService.findById(id);
		model.addAttribute("news", newService.findById(dto.getNew_id()));
		model.addAttribute("model", dto);
		return "web/chapter";
	}
}
