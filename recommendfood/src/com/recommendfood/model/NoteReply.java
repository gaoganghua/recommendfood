package com.recommendfood.model;

import java.util.Date;
import java.util.List;

public class NoteReply {
	private long id;
	private long userId;
	private long noteId;
	private String replyMsg;
	private Date replyTime;
	private boolean read;//是否已读
	private long parentId;//父类
	private Integer floorNumber;//楼号
	private Integer level;//等级(预留字段)
	private long respUserId;//@回应的用户id
	
	
	//添加
	private String userPic;//用户照片
	private String userName;
	private List<NoteReply> replys;//回复集合
	private Note indexNote;//主贴
	private String respNoteUserName;//@回应帖子的用户名
	
	public NoteReply() {
		super();
	}
	public NoteReply(long id, long userId, long noteId, String replyMsg, Date replyTime, boolean read, long parentId,
			Integer floorNumber, String userName, List<NoteReply> replys, Note indexNote) {
		super();
		this.id = id;
		this.userId = userId;
		this.noteId = noteId;
		this.replyMsg = replyMsg;
		this.replyTime = replyTime;
		this.read = read;
		this.parentId = parentId;
		this.floorNumber = floorNumber;
		this.userName = userName;
		this.replys = replys;
		this.indexNote = indexNote;
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
	public long getNoteId() {
		return noteId;
	}
	public void setNoteId(long noteId) {
		this.noteId = noteId;
	}
	public String getReplyMsg() {
		return replyMsg;
	}
	public void setReplyMsg(String replyMsg) {
		this.replyMsg = replyMsg;
	}
	public Date getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}
	public boolean isRead() {
		return read;
	}
	public void setRead(boolean read) {
		this.read = read;
	}
	public long getParentId() {
		return parentId;
	}
	public void setParentId(long parentId) {
		this.parentId = parentId;
	}
	public List<NoteReply> getReplys() {
		return replys;
	}
	public void setReplys(List<NoteReply> replys) {
		this.replys = replys;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Note getIndexNote() {
		return indexNote;
	}
	public void setIndexNote(Note indexNote) {
		this.indexNote = indexNote;
	}
	public Integer getFloorNumber() {
		return floorNumber;
	}
	public void setFloorNumber(Integer floorNumber) {
		this.floorNumber = floorNumber;
	}
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getRespNoteUserName() {
		return respNoteUserName;
	}
	public void setRespNoteUserName(String respNoteUserName) {
		this.respNoteUserName = respNoteUserName;
	}
	public long getRespUserId() {
		return respUserId;
	}
	public void setRespUserId(long respUserId) {
		this.respUserId = respUserId;
	}
	
}
