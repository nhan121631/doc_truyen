package com.laptrinhjavaweb.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	@Autowired
	private INewService newService;
	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public String home(Model model) {
		List<NewEntity> news = newService.getALL();
		model.addAttribute("news", news);
		model.addAttribute("categories", categoryService.listAll());
		return "web/home";
	}
	

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public String loginPage(Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/thoat", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
	}
		return "redirect:/trang-chu";
}
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDenied(Model model) {
		return "redirect:/dang-nhap?accessDenied";
	}

}
