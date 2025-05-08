package com.laptrinhjavaweb.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.NewEntity;

public interface INewService {

	 List<NewDTO> findAll(Pageable pageable);
	 int getTotalItem();
	 NewDTO findById(long id);
	 NewDTO save(NewDTO dto);
	 void delete(long []ids);
	 
	 //web
	 List<NewEntity> getALL();
	 
	 Map<Long, String> getNews();
	 
	 void updateView(Long id);
	 
	 List<NewEntity> getByCategory(Long id);
	 
	 List<NewEntity> findByName(String name);
	 double findStar(long id);
	 
	 long countluot(long id);
	 

}
