package com.ordering.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

@Scope("prototype")
@Repository
public class Images {
	private Integer id;
	private String url;
	private boolean listImage;
	private Foods foods;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public boolean isListImage() {
		return listImage;
	}
	public void setListImage(boolean listImage) {
		this.listImage = listImage;
	}
	public Foods getFoods() {
		return foods;
	}
	public void setFoods(Foods foods) {
		this.foods = foods;
	}
	
	
}
