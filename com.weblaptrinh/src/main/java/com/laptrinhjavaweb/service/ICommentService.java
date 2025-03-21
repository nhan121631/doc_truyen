package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.entity.CommentEntity;

public interface ICommentService {
	  void addComment(String comment, String firstname, String lastname, Integer star, Long newId, Long userId);
	  void updateComment(String comment,String firstname,String lastname,Integer star,Long idcmt);

	  List<CommentEntity> findByNewId(long newId);
	  
	  CommentEntity findByNewIdAndUserId(long newid, long userid);

}
