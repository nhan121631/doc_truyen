package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.entity.NewEntity;


public interface NewRepository extends JpaRepository<NewEntity, Long>{
	
	@Modifying
	@Query(value = "update new set view = view+1 where id = :id", nativeQuery = true)
	void updateView(@Param("id")Long id);
	
	@Query(value = "SELECT * FROM new\r\n"
			+ "ORDER BY view DESC\r\n"
			+ "LIMIT 20", nativeQuery = true)
	List<NewEntity> getAll();
	
	@Query(value = "select*from new where category_id= :id", nativeQuery = true)
	List<NewEntity> getByCategory(@Param("id") Long id);
	
//	List<NewEntity> getByTitle(String name);
	@Query("SELECT n FROM NewEntity n WHERE n.title LIKE %:name%")
    List<NewEntity> getByTitle(@Param("name") String name);
	
	@Query(value = "SELECT COALESCE(AVG(star), 0.0) FROM comment WHERE new_id = :new_id\r\n"
			+ "", nativeQuery = true)
	double findStar(@Param("new_id") Long newid);	
	
	@Query(value = "SELECT COUNT(new_id) FROM comment WHERE new_id = :new_id", nativeQuery = true)
    Long countluot(@Param("new_id") Long id);
}
