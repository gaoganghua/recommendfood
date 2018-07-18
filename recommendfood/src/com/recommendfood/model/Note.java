package com.recommendfood.model;

import java.util.Date;

public class Note {
	private long id;
	private long userId;
	private String title;
	private String noteMsg;
	private Date noteTime;
	private int upvoteTotal;//点赞数
	private int commentTotal;//评论数
	private boolean status;//帖子的状态
	
	//添加
	private String userPic;//用户照片
	private long replyRecord;//回复数
	private boolean read;//是否有新的未读回复
	private String userName;//用户名
	
	
	
	public Note() {
		super();
	}
	public Note(long id, long userId, String title, String noteMsg, Date noteTime, int favoritesTotal, int commentTotal,
			long replyRecord, boolean read, String userName) {
		super();
		this.id = id;
		this.userId = userId;
		this.title = title;
		this.noteMsg = noteMsg;
		this.noteTime = noteTime;
		this.upvoteTotal = favoritesTotal;
		this.commentTotal = commentTotal;
		this.replyRecord = replyRecord;
		this.read = read;
		this.userName = userName;
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNoteMsg() {
		return noteMsg;
	}
	public void setNoteMsg(String noteMsg) {
		this.noteMsg = noteMsg;
	}
	public Date getNoteTime() {
		return noteTime;
	}
	public void setNoteTime(Date noteTime) {
		this.noteTime = noteTime;
	}
	public boolean isRead() {
		return read;
	}
	public void setRead(boolean read) {
		this.read = read;
	}
	
	public int getUpvoteTotal() {
		return upvoteTotal;
	}
	public void setUpvoteTotal(int upvoteTotal) {
		this.upvoteTotal = upvoteTotal;
	}
	public int getCommentTotal() {
		return commentTotal;
	}
	public void setCommentTotal(int commentTotal) {
		this.commentTotal = commentTotal;
	}
	public long getReplyRecord() {
		return replyRecord;
	}
	public void setReplyRecord(long replyRecord) {
		this.replyRecord = replyRecord;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
}
