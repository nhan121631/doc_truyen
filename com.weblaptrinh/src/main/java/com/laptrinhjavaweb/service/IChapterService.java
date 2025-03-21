package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.dto.ChapterDTO;
import com.laptrinhjavaweb.entity.ChapterEntity;

public interface IChapterService {
	 List<ChapterDTO> findAll(Pageable pageable);
	 int getTotalItem();
	 ChapterDTO findById(long id);
	 ChapterDTO save(ChapterDTO dto);
	 void delete(long []ids);
	 
	 //web
	 List<ChapterEntity> getALL();
	 List<ChapterEntity> findByNew_id(Long id);
	 
	 
	// Map<Long, String> getNews();
}
