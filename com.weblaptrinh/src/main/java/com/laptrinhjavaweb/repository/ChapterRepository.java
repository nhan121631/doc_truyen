package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.dto.ChapterDTO;
import com.laptrinhjavaweb.entity.ChapterEntity;

public interface ChapterRepository extends JpaRepository<ChapterEntity, Long>{
	
	@Query(value= "select*from chapter where new_id=:id",nativeQuery = true)
	List<ChapterEntity> findByNew_id(@Param("id") Long new_id); 

}
