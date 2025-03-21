package com.laptrinhjavaweb.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.dto.ChapterDTO;
import com.laptrinhjavaweb.service.IChapterService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.util.MessageUtil;

@Controller
public class ChapterController {
	@Autowired
	private IChapterService chapterService;
	@Autowired
	private MessageUtil messageUtil;
	@Autowired 
	private INewService newService;

	@RequestMapping(value = "/quan-tri/chapter/list", method = RequestMethod.GET)
	 public String showList(Model m, @RequestParam("page") int page, 
								 @RequestParam("limit") int limit, HttpServletRequest request) {
		ChapterDTO model = new ChapterDTO();
		model.setPage(page);
		model.setLimit(limit);
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(chapterService.findAll(pageable));
		model.setTotalItem(chapterService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		m.addAttribute("model", model);
		if(request.getParameter("message")!=null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			m.addAttribute("alert", message.get("alert"));
			m.addAttribute("message", message.get("message"));
		}
		return "admin/chapter/list";
	}
	
	@RequestMapping(value = "/quan-tri/chapter/edit", method = RequestMethod.GET)
	public String editNew(Model m, @RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		ChapterDTO model = new ChapterDTO();
		if(id != null) {
			model = chapterService.findById(id);
		}
		if(request.getParameter("message")!=null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			m.addAttribute("alert", message.get("alert"));
			m.addAttribute("message", message.get("message"));
		}
		m.addAttribute("news", newService.getNews());
		m.addAttribute("model", model);
		return "admin/chapter/edit";
		
	}
	
//	@RequestMapping(value = "/quan-tri/chapter/add", method = RequestMethod.POST)
//	public String add(Model m, @ModelAttribute("model") ChapterDTO dto) {
//
//		System.out.println("name: "+dto.getNameChapter()+"content: "+dto.getContent()+"new_id "+dto.getNew_id());
//		if(dto.getNameChapter().equals("") || dto.getContent().equals("")) {
//			return "redirect:list?page=1&limit=2&message=error_system";
//		}
//		chapterService.save(dto);
//		return "redirect:list?page=1&limit=2&message=insert_success";	
//	}
	
	
}
