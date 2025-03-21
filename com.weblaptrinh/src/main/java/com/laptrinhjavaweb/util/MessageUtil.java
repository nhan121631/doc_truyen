package com.laptrinhjavaweb.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class MessageUtil {
	
	public Map<String, String> getMessage(String message) {
		Map<String, String> result = new HashMap<>();
		if (message.equals("update_success")) {
			result.put("message", "Update Success");
			result.put("alert", "success");
		} else if (message.equals("insert_success")) {
			result.put("alert", "success");
			result.put("message", "Insert Success");
		} else if (message.equals("error_system")) {
			result.put("alert", "danger");
			result.put("message", "Error System");
		} else if (message.equals("delete_success")) {
			result.put("alert", "success");
			result.put("message", "Delete Success");
		} else if (message.equals("miss_value")) {
			result.put("alert", "danger");
			result.put("message", "Vui lòng nhập đầy đủ thông tin!");
		} else if (message.equals("fail_photo")) {
			result.put("alert", "danger");
			result.put("message", "Incorrect image format");
		} else if (message.equals("title_length")) {
			result.put("alert", "danger");
			result.put("message", "Tên bài viết phải chứa ít nhất 5 ký tự không bao gồm khoảng trắng.");
		} else if (message.equals("title_invalid")) {
			result.put("alert", "danger");
			result.put("message", "Tên bài viết chỉ được chứa chữ cái và khoảng trống.");
		} else if (message.equals("short_description_length")) {
			result.put("alert", "danger");
			result.put("message", "Mô tả ngắn phải có ít nhất 10 ký tự không bao gồm khoảng trắng.");
		} else if (message.equals("author_length")) {
			result.put("alert", "danger");
			result.put("message", "Tên tác giả phải chứa ít nhất 2 ký tự không bao gồm khoảng trắng.");
		} else if (message.equals("author_invalid")) {
			result.put("alert", "danger");
			result.put("message", "Tên tác giả chỉ được chứa chữ cái và khoảng trống.");
		}
		else if (message.equals("fistname_length")) {
			result.put("alert", "danger");
			result.put("message", "FirstName phải chứa ít nhất 2 kí tự không bao gồm khoảng trống");
		}
		
		else if (message.equals("fistname_invalid")) {
			result.put("alert", "danger");
			result.put("message", "FirstName Không chứa kí tự đặc biệt và số");
		}
		else if (message.equals("lastname_length")) {
			result.put("alert", "danger");
			result.put("message", "LastName phải chứa ít nhất 2 kí tự");
		}
		
		else if (message.equals("lastname_invalid")) {
			result.put("alert", "danger");
			result.put("message", "LastName không đuọc chứa kí tự đặc biệt");
		}
		
		if (message.equals("review_success")) {
			result.put("message", "Review Success");
			result.put("alert", "success");
		}
		if (message.equals("updatereview_success")) {
			result.put("message", "Update Review Success");
			result.put("alert", "success");
		}
		return result;
	}
}
