package com.laptrinhjavaweb.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.service.INewService;

@RestController(value = "newAPIOfWeb")
public class NewAPI {
	@Autowired
	private INewService newService;
	
//	@PutMapping("/api/update")
//	public void updateView(long id) {
//		System.out.println("update");
//		newService.updateView(id);
//	}
	
    @GetMapping("/api/data")
    public ResponseEntity<String> getData() {
        return ResponseEntity.ok("Hello from Spring MVC");
    }

//    @PostMapping("/data")
//    public ResponseEntity<String> postData(@RequestBody MyData data) {
//        // Xử lý dữ liệu
//        return ResponseEntity.ok("Data received");
//    }
}
