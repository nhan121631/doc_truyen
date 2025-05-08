package com.laptrinhjavaweb.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.service.impl.UserService;

@Controller
public class RegistrationController {

    @Autowired
    private UserService userService;

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new UserEntity());  // Tạo đối tượng User mới để binding form
        return "register";  // Trả về trang đăng ký
    }

//    @PostMapping("/register")
//    public String registerUser(@ModelAttribute("user") UserEntity user, Model model) throws UnsupportedEncodingException {
//        if (userService.isUsernameExists(user.getUserName())) {
//            model.addAttribute("errorMessage", "Tên đăng nhập đã tồn tại");
//            System.out.println("TT");
//            return "register"; 
//        }
//        byte[] fname = user.getFullName().getBytes("ISO-8859-1");
//        String dfname = new String(fname, "UTF-8");
//        user.setFullName(dfname);
//        // Lưu người dùng mới
//        userService.save(user);
//        return "redirect:/dang-nhap";  // Chuyển hướng đến trang đăng nhập sau khi đăng ký thành công
//    }
    
    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") UserEntity user, Model model) throws UnsupportedEncodingException {
        // Kiểm tra tên đăng nhập
    	 if (user.getFullName().length() < 6) {
             model.addAttribute("errorMessage", "Họ và tên phải có ít nhất 6 ký tự");
             return "register";
         }
    	 
    	 if (!user.getFullName().matches("^[A-Za-zÀ-ỹà-ỹ\\s]+$")) {
    		    model.addAttribute("errorMessage", "Họ và tên chỉ được chứa chữ");
    		    return "register";
    		}
    	 
    	if (user.getUserName().length() < 6) {
            model.addAttribute("errorMessage", "Tên đăng nhập phải có ít nhất 6 ký tự");
            return "register";
        }
        
       

        // Kiểm tra ký tự hợp lệ (không chứa ký tự đặc biệt)
        if (!user.getUserName().matches("^[a-zA-Z0-9]*$")) {
            model.addAttribute("errorMessage", "Tên đăng nhập chỉ được chứa chữ cái và số");
            return "register";
        }

        // Kiểm tra tên đăng nhập đã tồn tại
        if (userService.isUsernameExists(user.getUserName())) {
            model.addAttribute("errorMessage", "Tên đăng nhập đã tồn tại");
            return "register"; 
        }

        byte[] fname = user.getFullName().getBytes("ISO-8859-1");
        String dfname = new String(fname, "UTF-8");
        user.setFullName(dfname);
        
        // Lưu người dùng mới
        userService.save(user);
        return "redirect:/dang-nhap";  // Chuyển hướng đến trang đăng nhập sau khi đăng ký thành công
    }

    }

