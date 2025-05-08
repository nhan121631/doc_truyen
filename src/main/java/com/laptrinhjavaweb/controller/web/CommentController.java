package com.laptrinhjavaweb.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.laptrinhjavaweb.service.impl.CommentService;
import com.laptrinhjavaweb.util.SecurityUtils;

@Controller(value = "commenControllertOfWeb")
public class CommentController {
	@Autowired 
	private CommentService commentService;
	
	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/addcomment")
	public String save(Model model,
			@RequestParam(value="newId", required = false)long idnew,
			@RequestParam(value="rating", required = false)Integer star,
			@RequestParam(value="firstname", required = false) String firstName,
			@RequestParam(value="lastname", required = false) String lastName,
			@RequestParam(value="comment", required = false)String cmt) {			
		if((star == null || star == 0) || firstName.isEmpty() || lastName.isEmpty()|| cmt.isEmpty()) {
			return "redirect:/story?id="+idnew+"&message=miss_value";
		}
	    if (firstName.trim().length() < 2) {
	        return "redirect:/story?id="+idnew+"&message=fistname_length"; // Thông báo lỗi cho tên tác giả không hợp lệ
	    }
//	    if (!firstName.matches("^[A-Za-zÀ-ỹà-ỹ\\s]+$")) {
//	        return "redirect:/story?id="+idnew+"&message=fistname_invalid"; // Thông báo lỗi cho tên tác giả không hợp lệ
//	    }
	    
	    if (lastName.trim().length() < 2) {
	        return "redirect:/story?id="+idnew+"&message=lastname_length"; // Thông báo lỗi cho tên tác giả không hợp lệ
	    }
	    
//	    if (!lastName.matches("^[A-Za-zÀ-ỹà-ỹ]+$")) {
//	        return "redirect:/story?id="+idnew+"&message=lastname_invalid"; // Thông báo lỗi cho tên tác giả không hợp lệ
//	    }
	        try {   
	        	
	            byte[] firstNameBytes = firstName.getBytes("ISO-8859-1");
	            String decodedFirstName = new String(firstNameBytes, "UTF-8");

	            if (!decodedFirstName.matches("^[A-Za-zÀ-ỹà-ỹ\\s]+$")) {
	    	        return "redirect:/story?id="+idnew+"&message=fistname_invalid"; // Thông báo lỗi cho tên tác giả không hợp lệ
	    	    }
	            byte[] lastNameBytes = lastName.getBytes("ISO-8859-1");
	            String decodedLastName = new String(lastNameBytes, "UTF-8");
	            
	            if (!decodedLastName.matches("^[A-Za-zÀ-ỹà-ỹ]+$")) {
	    	        return "redirect:/story?id="+idnew+"&message=lastname_invalid"; // Thông báo lỗi cho tên tác giả không hợp lệ
	    	    }
	            byte[] cmtBytes = cmt.getBytes("ISO-8859-1");
	            String decodedCmt = new String(cmtBytes, "UTF-8");
	            long idnd = SecurityUtils.getPrincipal().getId();
	            
	            commentService.addComment(decodedCmt, decodedFirstName, decodedLastName, star, idnew, idnd);	           	          
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return "redirect:/story?id="+idnew+"&message=review_success";
	}
	
	//
	
	@PreAuthorize("hasAnyRole('USER', 'ADMIN')")
	@RequestMapping(value = "/updatecomment")
	public String update(Model model,
			@RequestParam(value ="id", required = false)long idcmt,
			@RequestParam(value="newId", required = false)long idnew,
			@RequestParam(value="rating", required = false)Integer star,
			@RequestParam(value="firstname", required = false) String firstName,
			@RequestParam(value="lastname", required = false) String lastName,
			@RequestParam(value="comment", required = false)String cmt) {			
		if((star == null || star == 0) || firstName.isEmpty() || lastName.isEmpty()|| cmt.isEmpty()) {
			return "redirect:/story?id="+idnew+"&message=miss_value";
		}
	    if (firstName.trim().length() < 2) {
	        return "redirect:/story?id="+idnew+"&message=fistname_length"; // Thông báo lỗi cho tên tác giả không hợp lệ
	    }
	    if (!firstName.matches("^[A-Za-zÀ-ỹà-ỹ\\s]+$")) {
	        return "redirect:/story?id="+idnew+"&message=fistname_invalid"; // Thông báo lỗi cho tên tác giả không hợp lệ
	    }
	    
	    if (lastName.trim().length() < 2) {
	        return "redirect:/story?id="+idnew+"&message=lastname_length"; // Thông báo lỗi cho tên tác giả không hợp lệ
	    }
	    
	    if (!lastName.matches("^[A-Za-zÀ-ỹà-ỹ]+$")) {
	        return "redirect:/story?id="+idnew+"&message=lastname_invalid"; // Thông báo lỗi cho tên tác giả không hợp lệ
	    }
	        try {   
	        	
	            byte[] firstNameBytes = firstName.getBytes("ISO-8859-1");
	            String decodedFirstName = new String(firstNameBytes, "UTF-8");
	            
	            byte[] lastNameBytes = lastName.getBytes("ISO-8859-1");
	            String decodedLastName = new String(lastNameBytes, "UTF-8");
	            	      
	            byte[] cmtBytes = cmt.getBytes("ISO-8859-1");
	            String decodedCmt = new String(cmtBytes, "UTF-8");
	            
	            
	            commentService.updateComment(cmt, firstName, lastName, star, idcmt);	           	          
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return "redirect:/story?id="+idnew+"&message=updatereview_success";
		
	}
}
