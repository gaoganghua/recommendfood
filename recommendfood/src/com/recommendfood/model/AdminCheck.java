package com.recommendfood.model;

import java.util.Date;

public class AdminCheck {
	private long id;
	private long recommendId;
	private int checkInfo;
	private Date checkTime;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getRecommendId() {
		return recommendId;
	}
	public void setRecommendId(long recommendId) {
		this.recommendId = recommendId;
	}
	public int getCheckInfo() {
		return checkInfo;
	}
	public void setCheckInfo(int checkInfo) {
		this.checkInfo = checkInfo;
	}
	public Date getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}
	
}
