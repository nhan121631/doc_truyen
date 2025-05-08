package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.ChapterDTO;
import com.laptrinhjavaweb.service.IChapterService;

@RestController(value = "chapterAPIOfAdmin")
public class ChapterAPI {
		@Autowired
		private IChapterService chapterService;
		
		@PostMapping("/api/chapter")
		public ChapterDTO createNew(@RequestBody ChapterDTO chapterDTO) {
			System.out.println("insert");
			return chapterService.save(chapterDTO);
		}
		@PutMapping("/api/chapter")
		public ChapterDTO updateNew(@RequestBody ChapterDTO chapterDTO) {
			System.out.println("update");
			return chapterService.save(chapterDTO);
		}
		@DeleteMapping("/api/chapter")
		public void deleteNew(@RequestBody long[] ids) {
			chapterService.delete(ids);
		}
		
}
