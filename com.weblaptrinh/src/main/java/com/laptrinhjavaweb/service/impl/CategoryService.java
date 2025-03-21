package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.CategoryConverter;
import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService{

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private CategoryConverter categoryConverter;
	
	
	
	@Override
	public Map<String, String> findAll() {
		Map<String, String>  result = new HashMap<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for(CategoryEntity item:entities) {
			//CategoryDTO dto = categoryConverter.toDto(item);
			result.put(item.getCode(), item.getName());
		}
		
		return result;
	}

	@Override
	public List<CategoryDTO> getAll(Pageable pageable) {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entities = categoryRepository.findAll(pageable).getContent();
		for (CategoryEntity item: entities) {
			CategoryDTO CategoryDTO = categoryConverter.toDto(item);
			models.add(CategoryDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) categoryRepository.count();

	}

	@Override
	public CategoryDTO findById(long id) {
		CategoryEntity entity = categoryRepository.findOne(id);
		return categoryConverter.toDto(entity);
	}

	@Override
	@Transactional
	public CategoryDTO save(CategoryDTO dto) {
		//CategoryEntity category = categoryRepository.findOneByCode(dto.getCategoryCode());
		CategoryEntity categoryEntity = new CategoryEntity();
		if(dto.getId() !=null) {
			System.out.println(dto.getId());
			CategoryEntity oldCategory = categoryRepository.findOne(dto.getId());
		//	oldNew.setCategory(category);
			categoryEntity = categoryConverter.toEntity(oldCategory, dto);
		}else {
			System.out.println("id: "+dto.getId());
			categoryEntity = categoryConverter.toEntity(dto);
			//newEntity.setCategory(category);
		}
		
		return categoryConverter.toDto(categoryRepository.save(categoryEntity));
	}

//	@Override
//	@Transactional
//	public CategoryDTO save(CategoryDTO dto) {
//		CategoryEntity categoryEntity = new CategoryEntity();
//		categoryEntity = categoryConverter.toEntity(dto);
//		return categoryConverter.toDto(categoryRepository.save(categoryEntity));
//	}
//	
//	@Override
//	@Transactional
//	public CategoryDTO update(CategoryDTO dto) {
//		CategoryEntity categoryEntity = new CategoryEntity();
//		CategoryEntity oldCategory = categoryRepository.findOne(dto.getId());
//	//	oldNew.setCategory(category);
//		oldCategory = categoryConverter.toEntity(oldCategory, dto);
//		return categoryConverter.toDto(categoryRepository.save(categoryEntity));
//
//	}
	
	@Override
	@Transactional
	public void delete(long []ids) {
		for(long id: ids) {
		categoryRepository.delete(id);
		}
	}

	@Override
	public List<CategoryEntity> listAll() {
		List<CategoryEntity> list = categoryRepository.findAll();
		return list;
	}

	@Override
	public CategoryEntity findOByCode(String code) {
		CategoryEntity dto = categoryRepository.findOneByCode(code);
		return dto;
	}

	@Override
	public boolean isCodeExists(String code) {
		return categoryRepository.existsByCode(code);
	}
	
}
