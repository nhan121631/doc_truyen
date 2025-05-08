package com.laptrinhjavaweb.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.util.MessageUtil;

@Controller(value = "NewControllerOfAdmin")
public class NewController {
	@Autowired
		private INewService newService;
	@Autowired
		private ICategoryService categoryService;
	@Autowired
		private MessageUtil messageUtil;

	@RequestMapping(value = "/quan-tri/new/list", method = RequestMethod.GET)
	 public String showList(Model m, @RequestParam("page") int page, 
								 @RequestParam("limit") int limit, HttpServletRequest request) {
		NewDTO model = new NewDTO();
		model.setPage(page);
		model.setLimit(limit);
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(newService.findAll(pageable));
		model.setTotalItem(newService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		m.addAttribute("model", model);
		if(request.getParameter("message")!=null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			m.addAttribute("alert", message.get("alert"));
			m.addAttribute("message", message.get("message"));
		}
		return "admin/new/list";
	}
	
		@RequestMapping(value = "/quan-tri/new/edit", method = RequestMethod.GET)
		public String editNew(Model m, @RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
			NewDTO model = new NewDTO();
			if(id != null) {
				model = newService.findById(id);
			}
			if(request.getParameter("message")!=null) {
				Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
				m.addAttribute("alert", message.get("alert"));
				m.addAttribute("message", message.get("message"));
			}
			m.addAttribute("categories", categoryService.findAll());
			m.addAttribute("model", model);
			return "admin/new/edit";
			
		}
		
		
		@RequestMapping(value = "/quan-tri/new/viewadd", method = RequestMethod.GET)
		public String viewadd(Model m, HttpServletRequest request) {		
			NewDTO model = new NewDTO();

			if(request.getParameter("message")!=null) {
				Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
				m.addAttribute("alert", message.get("alert"));
				m.addAttribute("message", message.get("message"));
			}
			m.addAttribute("categories", categoryService.findAll());
			m.addAttribute("model",model);
			return "admin/new/add";
			
		}
		@RequestMapping(value="/quan-tri/new/add", method = RequestMethod.POST)
		public String addOrUpdate(Model model, 
		                           @RequestParam(value="thumbnail", required = false) MultipartFile photo,
		                           @RequestParam(value = "title", required = false) String title,
		                           @RequestParam(value = "shortDescription", required = false) String shortDescription,
		                           @RequestParam(value = "author", required = false) String author,
		                           @RequestParam(value = "newId", required = false) Long newId,
		                           @RequestParam(value = "categoryCode", required = false) String categoryCode) throws UnsupportedEncodingException {

		    // Kiểm tra các trường bắt buộc
		    if (title == null || title.trim().isEmpty() || 
		        shortDescription == null || shortDescription.trim().isEmpty() ||
		        author == null || author.trim().isEmpty() ||
		        categoryCode == null || categoryCode.trim().isEmpty() || photo.isEmpty()) {
		    	System.out.println("title "+title+ "s "+shortDescription+"cate "+ categoryCode);
		    	return "redirect:viewadd?message=miss_value";
		    }
		    
		    
		    if (title.replaceAll("\\s", "").length() < 5) {
		        return "redirect:viewadd?message=title_length"; // Thông báo lỗi cho tên bài viết quá ngắn
		    }


//				if (!title.matches("^[a-zA-Z\\s]+$")) {
//				    return "redirect:viewadd?message=title_invalid"; // Thông báo lỗi cho tên bài viết không hợp lệ
//				}
		    if (shortDescription.length() < 10 || shortDescription.trim().length() < 10) {
		        return "redirect:viewadd?message=short_description_length"; // Thông báo lỗi cho mô tả ngắn quá ngắn
		    }
		    if (author.replaceAll("\\s", "").length() < 2) {
		        return "redirect:viewadd?message=author_length"; // Thông báo lỗi cho tên tác giả quá ngắn
		    }

//
//		    if (!author.matches("^[A-Za-zÀ-ỹà-ỹ\\s]+$")) {
//		        return "redirect:viewadd?message=author_invalid"; // Thông báo lỗi cho tên tác giả không hợp lệ
//		    }
		    
		    // Kiểm tra định dạng tệp tin
		    String fileName = photo.getOriginalFilename();
		    String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		    List<String> validExtensions = Arrays.asList("jpg", "jpeg", "png", "gif");
		    
		    if (!validExtensions.contains(fileExtension)) {
		        return "redirect:viewadd?message=fail_photo";
		    }

		    byte[] titleBytes = title.getBytes("ISO-8859-1");
		    String dtitle = new String(titleBytes, "UTF-8");
		    
		    if (!dtitle.matches("^[A-Za-zÀ-ỹà-ỹ\\s]+$")) {
			    return "redirect:viewadd?message=title_invalid"; // Thông báo lỗi cho tên bài viết không hợp lệ
			}

		    byte[] dcriBytes = shortDescription.getBytes("ISO-8859-1");
		    String ddcri = new String(dcriBytes, "UTF-8");

		    byte[] authorsBytes = author.getBytes("ISO-8859-1");
		    String dauthor = new String(authorsBytes, "UTF-8");
		    
		    if (!dauthor.matches("^[A-Za-zÀ-ỹà-ỹ\\s]+$")) {
	        return "redirect:viewadd?message=author_invalid"; // Thông báo lỗi cho tên tác giả không hợp lệ
	    }
		    
		    
		    NewDTO dto = new NewDTO();
		    dto.setCategoryCode(categoryCode);
		    dto.setTitle(dtitle);
		    dto.setAuthor(dauthor);
		    dto.setId(newId);
		    dto.setShortDescription(ddcri);
		    dto.setThumbnail(saveFile(photo));
		    System.out.println(dto.toString());

		    System.out.println("====save=====");
		    
		    newService.save(dto);
		    return "redirect:list?page=1&limit=2&message=insert_success";
		}

		
		
		@RequestMapping(value="/quan-tri/new/update")
		public String Update(Model model, @RequestParam(value="thumbnail", required = false) MultipartFile photo,
				@RequestParam(value = "title", required = false) String title,
				@RequestParam(value = "shortDescription", required = false) String shortDescription,
				@RequestParam(value = "author", required = false) String author,
				@RequestParam(value = "categoryCode", required = false) String categoryCode,
				HttpServletRequest request) throws UnsupportedEncodingException {
			
			
		    if (title == null || title.trim().isEmpty() || 
		        shortDescription == null || shortDescription.trim().isEmpty() ||
		        author == null || author.trim().isEmpty() ||
		        categoryCode == null || categoryCode.trim().isEmpty() || photo.isEmpty()) {

		        //model.addAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin!");
		        return "redirect:edit?message=miss_value";
		    }
		    
		    
		    if (title.replaceAll("\\s", "").length() < 5) {
		        return "redirect:viewadd?message=title_length"; // Thông báo lỗi cho tên bài viết quá ngắn
		    }
//
//			if (!title.matches("^[A-Za-zÀ-ỹà-ỹ\\s]+$/")) {
//			    return "redirect:viewadd?message=title_invalid"; // Thông báo lỗi cho tên bài viết không hợp lệ
//			}
		    if (shortDescription.length() < 10 || shortDescription.trim().length() < 10) {
		        return "redirect:viewadd?message=short_description_length"; // Thông báo lỗi cho mô tả ngắn quá ngắn
		    }
		    if (author.replaceAll("\\s", "").length() < 2) {
		        return "redirect:viewadd?message=author_length"; // Thông báo lỗi cho tên tác giả quá ngắn
		    }
//	
//		    if (!author.matches("^[A-Za-zÀ-ỹà-ỹ\\s]+$")) {
//		        return "redirect:viewadd?message=author_invalid"; // Thông báo lỗi cho tên tác giả không hợp lệ
//		    }
		    
		    // Kiểm tra định dạng tệp tin
		    String fileName = photo.getOriginalFilename();
		    String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		    List<String> validExtensions = Arrays.asList("jpg", "jpeg", "png", "gif");
		    
		    if (!validExtensions.contains(fileExtension)) {
		        return "redirect:edit?message=fail_photo";
		    }
			
			  String id = request.getParameter("id");
	            byte[] titleBytes = title.getBytes("ISO-8859-1");
	            String dtitle = new String(titleBytes, "UTF-8");

	            if (!dtitle.matches("^[A-Za-zÀ-ỹà-ỹ\\s]+$")) {
				    return "redirect:viewadd?message=title_invalid"; // Thông báo lỗi cho tên bài viết không hợp lệ
				}
	            
	            byte[] dcriBytes = shortDescription.getBytes("ISO-8859-1");
	            String ddcri = new String(dcriBytes, "UTF-8");

	            byte[] authorsBytes = author.getBytes("ISO-8859-1");
	            String dauthor = new String(authorsBytes, "UTF-8");

			    if (!dauthor.matches("^[A-Za-zÀ-ỹà-ỹ\\s]+$")) {
			        return "redirect:viewadd?message=author_invalid"; // Thông báo lỗi cho tên tác giả không hợp lệ
			    }
			NewDTO dto = new NewDTO();
				dto.setCategoryCode(categoryCode);
				dto.setTitle(dtitle);
				dto.setAuthor(dauthor);
				dto.setId(Long.parseLong(id));
				dto.setShortDescription(ddcri);
				dto.setThumbnail(saveFile(photo));
				System.out.println(dto.toString());
		 

			
			System.out.println("====update=====");
			System.out.println("id: "+id);
			newService.save(dto);
			return "redirect:list?page=1&limit=2&message=update_success";
		}
		

		private String saveFile(MultipartFile file) {
			if(file != null && !file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();
					String rootPath = System.getProperty("catalina.home");
					//tao forder save
					File dir = new File(rootPath+File.separator+"uploads");
					if(!dir.exists()) {
						dir.mkdir();
					}
					
					// creating the file on server
					String name = String.valueOf(new Date().getTime()+".jpg");
					File serverFile = new File(dir.getAbsoluteFile()+File.separator+name);
					//
					System.out.println("====== Path of image on server: "+serverFile.getPath());
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
					return name;
					
				} catch (IOException e) {
					System.out.println("======== Error upload file: "+e.getMessage());
					
				}
				
			}else {
				System.out.println("====== File not exist");
			}
			return null;
		}

		
		
}
