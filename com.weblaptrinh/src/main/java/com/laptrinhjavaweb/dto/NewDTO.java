package com.laptrinhjavaweb.dto;

public class NewDTO extends AbstractDTO<NewDTO> {
	
	private String title;
	private String thumbnail;
	private String shortDescription;
	private int view;
	private String author;
	private int status;
	private Long categoryId;
	private String categoryCode;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getShortDescription() {
		return shortDescription;
	}
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		status = status;
	}
	@Override
	public String toString() {
		return "NewDTO [title=" + title + ", thumbnail=" + thumbnail + ", shortDescription=" + shortDescription
				+ ", view=" + view + ", author=" + author + ", Status=" + status 
				+ ", categoryId=" + categoryId + ", categoryCode=" + categoryCode + "]";
	}
	
	
	
}