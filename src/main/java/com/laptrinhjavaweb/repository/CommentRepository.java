package com.laptrinhjavaweb.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.entity.CommentEntity;

public interface CommentRepository extends JpaRepository<CommentEntity, Long>{
    @Modifying
    @Transactional
	@Query(value = "INSERT INTO comment (comment, firstname, lastname, star, new_id, user_id) VALUES (:comment, :firstname, :lastname, :star, :newId, :userId)", nativeQuery = true)
    void insert(
            @Param("comment") String comment,
            @Param("firstname") String firstname,
            @Param("lastname") String lastname,
            @Param("star") Integer star,
            @Param("newId") Long newId,
            @Param("userId") Long userId);
    @Query(value="SELECT * FROM comment WHERE new_id = :new_id", nativeQuery = true)
    List<CommentEntity> findByNewId(@Param("new_id") long newId);
    
    @Query(value = "SELECT * FROM comment WHERE new_id = :new_id AND user_id = :user_id", nativeQuery = true)
    CommentEntity findByNewIdAndUserId(@Param("new_id") long newId, @Param("user_id") long userId);

    @Modifying
    @Transactional
    @Query(value = "UPDATE comment SET comment = :comment, firstname = :firstname, lastname = :lastname, star = :star WHERE id = :idcmt", nativeQuery = true)
    void update(
            @Param("comment") String comment,
            @Param("firstname") String firstname,
            @Param("lastname") String lastname,
            @Param("star") Integer star,
            @Param("idcmt") Long idcmt);

 
}
