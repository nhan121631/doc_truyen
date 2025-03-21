package com.laptrinhjavaweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.CommentEntity;
import com.laptrinhjavaweb.repository.CommentRepository;
import com.laptrinhjavaweb.service.ICommentService;

@Service
public class CommentService implements ICommentService{

	@Autowired 
	CommentRepository commentRepository;

	@Override
	public void addComment(String comment, String firstname, String lastname, Integer star, Long newId, Long userId) {
		commentRepository.insert(comment, firstname, lastname, star, newId, userId);
		
	}

	@Override
	public List<CommentEntity> findByNewId(long newId) {
		return commentRepository.findByNewId(newId);
	}

	@Override
	public CommentEntity findByNewIdAndUserId(long newid, long userid) {
		return commentRepository.findByNewIdAndUserId(newid, userid);
	}

	@Override
	public void updateComment(String comment, String firstname, String lastname, Integer star, Long idcmt) {
		commentRepository.update(comment, firstname, lastname, star, idcmt);
		
	}


}
