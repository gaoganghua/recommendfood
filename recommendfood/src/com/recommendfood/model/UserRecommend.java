package com.recommendfood.model;

import java.util.Date;

public class UserRecommend {
	private long id;
	private long userId;
	private long foodId;
	private Date recommendTime;
	
	//添加
	private String userLoginName;//用户名
	private String foodName;
	private String foodPictures;
	private String foodIntroduce;
	private String foodTypes;
	private int commentTotal;//评论数
	private int favoritesTotal;//收藏数
	private int thumbsupTotal;//点赞量
	private boolean thumbsup;//是否点赞
	private boolean favorites;//是否收藏
	private boolean passCheck;//是否通过检查
	
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
	public Date getRecommendTime() {
		return recommendTime;
	}
	public void setRecommendTime(Date recommendTime) {
		this.recommendTime = recommendTime;
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
	public String getFoodIntroduce() {
		return foodIntroduce;
	}
	public void setFoodIntroduce(String foodIntroduce) {
		this.foodIntroduce = foodIntroduce;
	}
	public String getFoodTypes() {
		return foodTypes;
	}
	public void setFoodTypes(String foodTypes) {
		this.foodTypes = foodTypes;
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
	public String getUserLoginName() {
		return userLoginName;
	}
	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName;
	}
	public boolean isPassCheck() {
		return passCheck;
	}
	public void setPassCheck(boolean passCheck) {
		this.passCheck = passCheck;
	}
	
}
