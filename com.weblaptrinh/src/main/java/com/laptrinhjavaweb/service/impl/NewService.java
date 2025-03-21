package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.NewConverter;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.service.INewService;

@Service
public class NewService implements INewService {
	
	@Autowired
	private NewRepository newRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private NewConverter newConverter;

	
	@Override
	public List<NewDTO> findAll(Pageable pageable) {
		List<NewDTO> models = new ArrayList<>();
		List<NewEntity> entities = newRepository.findAll(pageable).getContent();
		for (NewEntity item: entities) {
			NewDTO newDTO = newConverter.toDto(item);
			models.add(newDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) newRepository.count();
	}

	@Override
	public NewDTO findById(long id) {
		NewEntity entity = newRepository.findOne(id);
		return newConverter.toDto(entity);
	}
	
	@Override
	@Transactional
	public NewDTO save(NewDTO dto) {
		CategoryEntity category = categoryRepository.findOneByCode(dto.getCategoryCode());
		NewEntity newEntity = new NewEntity();
		if(dto.getId() !=null && !dto.getId().equals("")) {
			NewEntity oldNew = newRepository.findOne(dto.getId());
			oldNew.setCategory(category);
			newEntity = newConverter.toEntity(oldNew, dto);
		}else {
			newEntity = newConverter.toEntity(dto);
			newEntity.setCategory(category);
		}
		return newConverter.toDto(newRepository.save(newEntity));	
	}

	@Override
	@Transactional
	public void delete(long []ids) {
		for(long id: ids) {
		newRepository.delete(id);
		}
	}
	@Override
	public List<NewEntity> getALL() {
		List<NewEntity> list = newRepository.getAll();
		return list;
	}

	@Override
	public Map<Long, String> getNews() {
		Map<Long, String>  result = new HashMap<>();
		List<NewEntity> entities = newRepository.findAll();
		for(NewEntity item:entities) {
			//CategoryDTO dto = categoryConverter.toDto(item);
			result.put(item.getId(), item.getTitle());
		}
		
		return result;
	}

	@Override
	@Transactional
	public void updateView(Long id) {
		System.out.println("===ok===");
		newRepository.updateView(id);
	}

	@Override
	public List<NewEntity> getByCategory(Long id) {
		List<NewEntity> list = newRepository.getByCategory(id);
		return list;
	}

	@Override
	public List<NewEntity> findByName(String name) {
		List<NewEntity> list = newRepository.getByTitle(name);
		return list;
	}

	@Override
	public double findStar(long id) {
		return newRepository.findStar(id);
	}

	@Override
	public long countluot(long id) {
		
		return newRepository.countluot(id);
	}
}