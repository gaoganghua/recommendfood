package com.recommendfood.model;

import java.util.Date;

public class UserComment {
	private long id;
	private long userId;
	private long foodId;
	private double score;
	private String comment;
	private Date commentTime;
	
	//添加
	private String userName;
	private String userPicture;
//	private String recommendUserName;
//	private Date recommendTime;
	private String foodName;
	private String foodIntroduction;
	private String foodPictures;
	private String foodType;
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
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
//	public String getRecommendUserName() {
//		return recommendUserName;
//	}
//	public void setRecommendUserName(String recommendUserName) {
//		this.recommendUserName = recommendUserName;
//	}
//	public Date getRecommendTime() {
//		return recommendTime;
//	}
//	public void setRecommendTime(Date recommendTime) {
//		this.recommendTime = recommendTime;
//	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getFoodIntroduction() {
		return foodIntroduction;
	}
	public void setFoodIntroduction(String foodIntroduction) {
		this.foodIntroduction = foodIntroduction;
	}
	public String getFoodPictures() {
		return foodPictures;
	}
	public void setFoodPictures(String foodPictures) {
		this.foodPictures = foodPictures;
	}
	public String getFoodType() {
		return foodType;
	}
	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}
	public String getUserPicture() {
		return userPicture;
	}
	public void setUserPicture(String userPicture) {
		this.userPicture = userPicture;
	}
	
}
