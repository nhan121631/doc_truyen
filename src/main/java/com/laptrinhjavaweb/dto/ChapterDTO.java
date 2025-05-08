package com.laptrinhjavaweb.dto;

public class ChapterDTO extends AbstractDTO<ChapterDTO>{
	
	private String nameChapter;
	private String content;
	private Long new_id;
	
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
	public Long getNew_id() {
		return new_id;
	}
	public void setNew_id(Long new_id) {
		this.new_id = new_id;
	}

}
