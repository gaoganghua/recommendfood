package com.recommendfood.model;

public class Food {
	private long id;
	private String name;
	private String pictures;//食物照片
	private String stuff;//材料
	private String seasoning;//调料
	private String manufacturingProcess;//制作过程
	private String introduction;//食物功能介绍
	private int status;//食物状态
	private String foodType;//食物所属类别
	
	//添加
	private int commentTotal;//评论量
	private int favoritesTotal;//收藏量
	private int thumbsupTotal;//点赞量
	private boolean thumbsup;//是否点赞
	private boolean favorites;//是否收藏
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPictures() {
		return pictures;
	}
	public void setPictures(String pictures) {
		this.pictures = pictures;
	}
	public String getStuff() {
		return stuff;
	}
	public void setStuff(String stuff) {
		this.stuff = stuff;
	}
	public String getSeasoning() {
		return seasoning;
	}
	public void setSeasoning(String seasoning) {
		this.seasoning = seasoning;
	}
	public String getManufacturingProcess() {
		return manufacturingProcess;
	}
	public void setManufacturingProcess(String manufacturingProcess) {
		this.manufacturingProcess = manufacturingProcess;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getFoodType() {
		return foodType;
	}
	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}
	public int getCommentTotal() {
		return commentTotal;
	}
	public void setCommentTotal(int commentTotal) {
		this.commentTotal = commentTotal;
	}
	public int getFavoritesTotal() {
		return favoritesTotal;
	}
	public void setFavoritesTotal(int favoritesTotal) {
		this.favoritesTotal = favoritesTotal;
	}
	public int getThumbsupTotal() {
		return thumbsupTotal;
	}
	public void setThumbsupTotal(int thumbsupTotal) {
		this.thumbsupTotal = thumbsupTotal;
	}
	public boolean isThumbsup() {
		return thumbsup;
	}
	public void setThumbsup(boolean thumbsup) {
		this.thumbsup = thumbsup;
	}
	public boolean isFavorites() {
		return favorites;
	}
	public void setFavorites(boolean favorites) {
		this.favorites = favorites;
	}
	
}
