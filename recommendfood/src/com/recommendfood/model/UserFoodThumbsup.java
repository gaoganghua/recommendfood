package com.recommendfood.model;

import java.util.Date;

public class UserFoodThumbsup {
	private long id;
	private long userId;
	private long foodId;
	private Date thumbsupTime;
	private byte type;
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
	public Date getThumbsupTime() {
		return thumbsupTime;
	}
	public void setThumbsupTime(Date thumbsupTime) {
		this.thumbsupTime = thumbsupTime;
	}
//	public int getType() {
//		return type;
//	}
//	public void setType(int type) {
//		this.type = type;
//	}
	public byte getType() {
		return type;
	}
	public void setType(byte type) {
		this.type = type;
	}
//	public short getType() {
//		return type;
//	}
//	public void setType(short type) {
//		this.type = type;
//	}
	
}
