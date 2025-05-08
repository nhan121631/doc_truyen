package com.laptrinhjavaweb.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;

public interface ICategoryService {
	 Map<String, String> findAll();
	 int getTotalItem();
	 CategoryDTO findById(long id);
	 CategoryDTO save(CategoryDTO dto);
	 void delete(long []ids);
	 List<CategoryDTO> getAll(Pageable pageable);
	 
	 boolean isCodeExists(String code);
	 
	 ///web
	 List<CategoryEntity> listAll();
	 CategoryEntity findOByCode(String code);
}
