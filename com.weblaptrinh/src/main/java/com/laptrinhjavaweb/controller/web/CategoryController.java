package com.laptrinhjavaweb.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;

@Controller(value = "categoryOfWeb")
public class CategoryController {
	@Autowired 
	private INewService newService;
	@Autowired
	private ICategoryService categoryService;

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String home(Model model, @RequestParam(value = "id", required = false) Long id) {
		List<NewEntity> news = newService.getByCategory(id);
		model.addAttribute("news", news);
		model.addAttribute("categories", categoryService.listAll());
		return "web/home";
	}
}
