package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.ChapterConverter;
import com.laptrinhjavaweb.dto.ChapterDTO;
import com.laptrinhjavaweb.entity.ChapterEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.ChapterRepository;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.service.IChapterService;

@Service
public class ChapterService implements IChapterService{
	@Autowired
	private ChapterConverter chapterConverter;
	@Autowired
	private ChapterRepository chapterRepository;
	@Autowired
	private NewRepository newRepository;


	@Override
	public List<ChapterDTO> findAll(Pageable pageable) {
		List<ChapterDTO> models = new ArrayList<>();
		List<ChapterEntity> entities = chapterRepository.findAll(pageable).getContent();
		for (ChapterEntity item: entities) {
			ChapterDTO chapter = chapterConverter.toDto(item);
			models.add(chapter);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) chapterRepository.count();
	}

	@Override
	public ChapterDTO findById(long id) {
		ChapterEntity entity = chapterRepository.findOne(id);
		return chapterConverter.toDto(entity);
	}
	
	@Override
	@Transactional
	public ChapterDTO save(ChapterDTO dto) {
		NewEntity newEntity = newRepository.findOne(dto.getNew_id());
		ChapterEntity chapteEntity = new ChapterEntity();
		if(dto.getId() !=null && !dto.getId().equals("")) {
			ChapterEntity oldNew = chapterRepository.findOne(dto.getId());
			oldNew.setNews(newEntity);
			chapteEntity = chapterConverter.toEntity(oldNew, dto);
		}else {
			chapteEntity = chapterConverter.toEntity(dto);
			System.out.println("id: \n"+dto.getNew_id());
			chapteEntity.setNews(newEntity);
		}
		return chapterConverter.toDto(chapterRepository.save(chapteEntity));	
	}

	@Override
	@Transactional
	public void delete(long []ids) {
		for(long id: ids) {
		chapterRepository.delete(id);
		}
	}
	@Override
	public List<ChapterEntity> getALL() {
		List<ChapterEntity> list = chapterRepository.findAll();
		return list;
	}

	@Override
	public List<ChapterEntity> findByNew_id(Long id) {
		List<ChapterEntity> list = chapterRepository.findByNew_id(id);
		return list;
	}
}
