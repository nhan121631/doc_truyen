package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {
	
	@RequestMapping(value = "quan-tri/home", method = RequestMethod.GET)
	public String home(Model model) {
		return "admin/home";
	}

}
