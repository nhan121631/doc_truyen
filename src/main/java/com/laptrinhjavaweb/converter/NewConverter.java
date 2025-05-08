package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.NewEntity;

@Component
public class NewConverter {

	public NewDTO toDto (NewEntity entity) {
		NewDTO result = new NewDTO();
		result.setId(entity.getId());
		result.setTitle(entity.getTitle());
		result.setShortDescription(entity.getShortDescription());
		result.setAuthor(entity.getAuthor());
		result.setThumbnail(entity.getThumbnail());
		result.setStatus(entity.getStatus());
		result.setView(entity.getView());
		result.setCategoryCode(entity.getCategory().getCode());
		return result;
	}
	public NewEntity toEntity (NewDTO dto) {
		NewEntity result = new NewEntity();
		result.setTitle(dto.getTitle());
		result.setShortDescription(dto.getShortDescription());
		result.setAuthor(dto.getAuthor());
		result.setThumbnail(dto.getThumbnail());
		result.setStatus(dto.getStatus());
//      result.setCategoryCode(dto.getCategory().getCode());
		return result;
	}
	
	public NewEntity toEntity (NewEntity result, NewDTO dto) {
		result.setTitle(dto.getTitle());
		result.setShortDescription(dto.getShortDescription());
//		result.setContent(dto.getContent());
//		result.setThumnail(dto.getThumbnail());
//sult.setCategoryCode(dto.getCategory().getCode());
		return result;
	}
}
