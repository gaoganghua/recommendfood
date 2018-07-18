package com.recommendfood.model;

import java.util.Date;

public class UserFavorites {
	private long id;
	private long userId;
	private long foodId;
	private Date collectTime;
	
	//添加
	private String foodName;
	private String foodPictures;
	private String foodTypes;
	private String introduce;
	private int favoritesTotal;//收藏量
	private int commentTotal;//评论量
	private int thumbsupTotal;//点赞量
	private boolean thumbsup;//是否点赞
	private boolean commentread;//是否有新阅读
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getFoodId() {
		return foodId;
	}
	public void setFoodId(long foodId) {
		this.foodId = foodId;
	}
	public Date getCollectTime() {
		return collectTime;
	}
	public void setCollectTime(Date collectTime) {
		this.collectTime = collectTime;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getFoodPictures() {
		return foodPictures;
	}
	public void setFoodPictures(String foodPictures) {
		this.foodPictures = foodPictures;
	}
	public String getFoodTypes() {
		return foodTypes;
	}
	public void setFoodTypes(String foodTypes) {
		this.foodTypes = foodTypes;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getFavoritesTotal() {
		return favoritesTotal;
	}
	public void setFavoritesTotal(int favoritesTotal) {
		this.favoritesTotal = favoritesTotal;
	}
	public int getCommentTotal() {
		return commentTotal;
	}
	public void setCommentTotal(int commentTotal) {
		this.commentTotal = commentTotal;
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
	public boolean isCommentread() {
		return commentread;
	}
	public void setCommentread(boolean commentread) {
		this.commentread = commentread;
	}
	
}
