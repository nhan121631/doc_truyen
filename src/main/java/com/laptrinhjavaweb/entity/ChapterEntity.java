package com.laptrinhjavaweb.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = ("chapter"))
public class ChapterEntity extends BaseEntity{
	
	@Column(name="namechapter")
	private String nameChapter;
	
	@Column(name="content", columnDefinition = "TEXT")
	private String content;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="new_id")
	private NewEntity newc;

	public String getNameChapter() {
		return nameChapter;
	}

	public void setNameChapter(String nameChapter) {
		this.nameChapter = nameChapter;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public NewEntity getNews() {
		return newc;
	}

	public void setNews(NewEntity newc) {
		this.newc = newc;
	}
	
	
}
