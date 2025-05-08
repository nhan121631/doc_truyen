package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.dto.ChapterDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.ChapterEntity;
import com.laptrinhjavaweb.entity.NewEntity;

@Component
public class ChapterConverter {
	
	public ChapterDTO toDto(ChapterEntity entity) {
		ChapterDTO result = new ChapterDTO();
		result.setId(entity.getId());
		result.setContent(entity.getContent());
		result.setNameChapter(entity.getNameChapter());
		result.setNew_id(entity.getNews().getId());
		return result;
	}
	
	public ChapterEntity toEntity(ChapterDTO dto) {
		ChapterEntity result = new ChapterEntity();
		result.setContent(dto.getContent());
		result.setNameChapter(dto.getNameChapter());
		NewEntity n = new NewEntity();
	
		//result.setNews(null);
		return result;
	}
	
	public ChapterEntity toEntity(ChapterEntity result, ChapterDTO dto) {		
		result.setContent(dto.getContent());
		result.setNameChapter(dto.getNameChapter());
		return result;
	}
}
