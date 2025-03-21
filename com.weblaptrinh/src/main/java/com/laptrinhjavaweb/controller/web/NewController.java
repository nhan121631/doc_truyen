package com.laptrinhjavaweb.controller.web;
import com.laptrinhjavaweb.util.SecurityUtils;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.CommentEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.IChapterService;
import com.laptrinhjavaweb.service.ICommentService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.service.impl.CommentService;
import com.laptrinhjavaweb.service.impl.NewService;
import com.laptrinhjavaweb.util.MessageUtil;

@Controller
public class NewController {
	@Autowired
	private INewService service;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IChapterService chapterService;
	@Autowired
	private ICommentService commentService;
	@Autowired
	private MessageUtil messageUtil;
	
	@RequestMapping(value = "/story")
	public String index(Model model,
			@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		NewDTO dto = service.findById(id);
		model.addAttribute("news", dto);
		model.addAttribute("tl", categoryService.findOByCode(dto.getCategoryCode()));
		model.addAttribute("chapters", chapterService.findByNew_id(dto.getId()));
		model.addAttribute("categories", categoryService.listAll());
		model.addAttribute("star",Math.round(service.findStar(id) * 10.0) / 10.0 );
		model.addAttribute("luot", service.countluot(id));
		model.addAttribute("comments", commentService.findByNewId(id));

		 try {
		        long idnd = SecurityUtils.getPrincipal().getId();
				CommentEntity cmt = commentService.findByNewIdAndUserId(id, idnd);
				model.addAttribute("usercmt", cmt);
				System.out.println("idcmt: "+cmt.getId()+"star: "+cmt.getStar());
		    } catch (Exception e) {
		        System.out.println("Người dùng chưa đăng nhập");
		    }

		
//		System.out.println(dto.toString());
		if(request.getParameter("message")!=null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			model.addAttribute("alert", message.get("alert"));
			model.addAttribute("message", message.get("message"));
		}
		return "web/story";
	}
	
	@RequestMapping(value = "/updateview")
	public String updateview(Model model,
			@RequestParam(value = "id", required = false) Long id) {
		System.out.println("id: "+id);
		service.updateView(id);
		System.out.println("id: "+id);
		return "redirect:/story?id="+id;
	}
	
	@RequestMapping(value = "/search" , method = RequestMethod.GET)
	public String search(Model model, @RequestParam(value = "name", required = false) String name) {
		List<NewEntity> news = service.findByName(name);
		model.addAttribute("news", news);
		model.addAttribute("categories", categoryService.listAll());
		return "web/home";
	}
}
