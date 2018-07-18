package com.recommendfood.action;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.hibernate.hql.internal.ast.tree.IndexNode;

import com.opensymphony.xwork2.ActionContext;
import com.recommendfood.factory.DatabaseFactory;
import com.recommendfood.model.Note;
import com.recommendfood.model.NoteReply;
import com.recommendfood.model.User;
import com.recommendfood.service.CommonService;
import com.recommendfood.service.NoteReplyService;
import com.recommendfood.service.NoteService;
import com.recommendfood.service.UserService;
import com.recommendfood.util.JsonUtil;
import com.recommendfood.util.QueryTypeEnum;
import com.recommendfood.util.SearchObject;
import com.recommendfood.util.SearchRelation;
import com.recommendfood.util.SearchUtil;

//社区处理类
public class CommunityAction extends CommonAction<Object>{
	
	private Long noteId;
	private Long parentId;//回帖的id
	private List<Note> notes = null;
	private List<NoteReply> noteReplys = null;
	private String content;//回帖和发帖的内容
	private String title;//发布帖子的标题
	private String relUrl;
	private String childUrl;//菜单栏的编号
	private Long respUserId;//@用户的id
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getRespUserId() {
		return respUserId;
	}
	public void setRespUserId(Long respUserId) {
		this.respUserId = respUserId;
	}
	public String getRelUrl() {
		return relUrl;
	}
	public void setRelUrl(String relUrl) {
		this.relUrl = relUrl;
	}
	public String getChildUrl() {
		return childUrl;
	}
	public void setChildUrl(String childUrl) {
		this.childUrl = childUrl;
	}
	public Long getNoteId() {
		return noteId;
	}
	public void setNoteId(Long noteId) {
		this.noteId = noteId;
	}
	public List<Note> getNotes() {
		return notes;
	}
	public void setNotes(List<Note> notes) {
		this.notes = notes;
	}
	public List<NoteReply> getNoteReplys() {
		return noteReplys;
	}
	public void setNoteReplys(List<NoteReply> noteReplys) {
		this.noteReplys = noteReplys;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	//社区主页方法
	public String index(){
		
		return "index";
	}
	//查看新帖的方法
	public String newNotes(){
		NoteService ns = DatabaseFactory.getNoteService(ServletActionContext.getServletContext());
		
		List<SearchObject> params = new LinkedList<SearchObject>();
		params.add(SearchUtil.add(false, "status", true));
		List<SearchRelation> relations = new LinkedList<SearchRelation>();
		relations.add(SearchUtil.addRelation("User", "id", "u", true, null, "Note", "userId"));
		Map<String, String> orderColumns = new HashMap<String, String>();
		orderColumns.put("noteTime", "desc");
		List<Object[]> objss = ns.getListByParamsWithPage(params, relations, orderColumns, -1, -1);
//		System.out.println(objss.size());
		notes = new LinkedList<Note>();
		for(Object[] objs:objss){
			Note n = (Note) objs[0];
			User u = (User) objs[1];
			n.setUserName(u.getLoginName());
			notes.add(n);
		}
		return "newnotes";
	}
	//查看热帖的方法
	public String hotNotes(){
		NoteService ns = DatabaseFactory.getNoteService(ServletActionContext.getServletContext());
		
		List<SearchObject> params = new LinkedList<SearchObject>();
		params.add(SearchUtil.add(false, "status", true));
		List<SearchRelation> relations = new LinkedList<SearchRelation>();
		relations.add(SearchUtil.addRelation("User", "id", "u", true, null, "Note", "userId"));
		Map<String, String> orderColumns = new HashMap<String, String>();
		orderColumns.put("commentTotal", "desc");
		List<Object[]> objss = ns.getListByParamsWithPage(params, relations, orderColumns, -1, -1);
//		System.out.println(objss.size());
		notes = new LinkedList<Note>();
		for(Object[] objs:objss){
			Note n = (Note) objs[0];
			User u = (User) objs[1];
			n.setUserName(u.getLoginName());
			notes.add(n);
		}
		
		return "hotnotes";
	}
	//专家建议
	public String expertAdvice(){
		System.out.println("fsadfasdfasd");
		return "expertadvice";
	}
	//我的帖子
	public String myNotes(){
//		System.out.println("mynotes");
		NoteService ns = DatabaseFactory.getNoteService(ServletActionContext.getServletContext());
		User u = (User) getSession().get(LOGIN_USER);
		if(u!=null){
			List<SearchObject> params = new LinkedList<SearchObject>();
			params.add(SearchUtil.add(false, "userId", u.getId()));
			params.add(SearchUtil.add(false, "status", true));
			notes = ns.findNoteListByParams(params);
		}
		return "mynotes";
	}
	//查看帖子的信息
	public String noteInfo(){
//		System.out.println(noteId);
		NoteService ns = DatabaseFactory.getNoteService(ServletActionContext.getServletContext());
		NoteReplyService nrs = DatabaseFactory.getNoteReplyService(ServletActionContext.getServletContext());
		UserService us = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
		CommonService cs = DatabaseFactory.getCommonService(ServletActionContext.getServletContext());
		
		//查询主帖
		Note indexNote = ns.get(noteId);
		User uu = us.get(indexNote.getUserId());
		indexNote.setUserName(uu.getLoginName());
		indexNote.setUserPic(uu.getPhoto());
		ServletActionContext.getRequest().setAttribute("indexNote", indexNote);
//		System.out.println(indexNote.getUserName());
		//查询一级回贴
		List<SearchObject> params = new LinkedList<SearchObject>();
		params.add(SearchUtil.add(false, "noteId", noteId));
		params.add(SearchUtil.add(false, "parentId", 0L));
		List<SearchRelation> searchRelations = new LinkedList<SearchRelation>();
		searchRelations.add(SearchUtil.addRelation("User", "id", "u", true, null, "NoteReply", "userId"));
		Map<String, String> orderColumns = new HashMap<String, String>();
		orderColumns.put("floorNumber", "asc");
		List<Object[]> objss = nrs.getListByParamsWithPage(params, searchRelations, orderColumns, -1, -1);
		
		noteReplys = new LinkedList<NoteReply>();
		for(Object[] objs:objss){
			NoteReply nr = (NoteReply) objs[0];
			User u = (User) objs[1];
			nr.setUserName(u.getLoginName());
			nr.setUserPic(u.getPhoto());
			//查询二级回帖
			List<SearchObject> lists = new LinkedList<SearchObject>();
			lists.add(SearchUtil.add(false, "parentId", nr.getId()));
			lists.add(SearchUtil.add(false, "noteId", getNoteId()));
			List<Object[]> objsss = nrs.getListByParamsWithPage(lists, searchRelations, orderColumns, -1, -1);
			
			List<NoteReply> secondreplys = new LinkedList<NoteReply>();
			System.out.println("id:"+nr.getId());
			for(Object[] sobjs:objsss){
				NoteReply snr = (NoteReply) sobjs[0];
				User su = (User) sobjs[1];
				snr.setUserName(su.getLoginName());
				snr.setUserPic(su.getPhoto());
				//查询是否有@回应帖子
				if(snr.getRespUserId()!=0L){
					String sql = "select login_name from user where id=?";
					List<Object> names = cs.executeSql(sql, new Long[]{snr.getRespUserId()});
					snr.setRespNoteUserName(names.get(0).toString());
				}
				
				secondreplys.add(snr);
				System.out.println(snr.getId());
			}
			System.out.println("---------------------------");
			nr.setReplys(secondreplys);
			noteReplys.add(nr);
		}
		
		return "noteinfo";
	}
	//回复和发表评论
	public String replyNote(){
		NoteReplyService nrs = DatabaseFactory.getNoteReplyService(ServletActionContext.getServletContext());
		UserService us = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
		NoteService ns=  DatabaseFactory.getNoteService(ServletActionContext.getServletContext());
		User u = (User) ActionContext.getContext().getSession().get(LOGIN_USER);
		
		List<SearchObject> params = new LinkedList<SearchObject>();
		params.add(SearchUtil.add(false, "noteId", getNoteId()));
		params.add(SearchUtil.add(false, "parentId", getParentId()));
		Object maxnumber = nrs.findReportRecord(params, QueryTypeEnum.MAX_RECORD, new String[]{"floorNumber"});
		int num = 1;
		if(maxnumber!=null){
			num = (int)maxnumber+1;
		}
		
		NoteReply nr = new NoteReply();
		nr.setUserId(u.getId());
		nr.setNoteId(noteId);
		nr.setReplyMsg(content);
		nr.setReplyTime(new Date());
		nr.setParentId(parentId);
		nr.setFloorNumber(num);
		if(respUserId!=null && respUserId!=0L){
			nr.setRespUserId(respUserId);
			nr.setRespNoteUserName(us.get(respUserId).getLoginName());
		}
		nr.setRead(false);
		nrs.save(nr);
		
		nr.setUserName(u.getLoginName());
		nr.setUserPic(u.getPhoto());
		//如果是对主贴评论
		if(getParentId()==0){
			Note n = ns.get(getNoteId());
			n.setCommentTotal(n.getCommentTotal()+1);
			ns.update(n);
		}
		
		setJsondata(JsonUtil.ajax(true, getContent(), nr));
		
		return "replynote";
	}
	//删除帖子
	public String deleteNote(){
		NoteService ns = DatabaseFactory.getNoteService(ServletActionContext.getServletContext());
		
		if(getNoteId()!=0L){
			Note n = ns.get(getNoteId());
			n.setStatus(false);
			ns.update(n);
			setJsondata(JsonUtil.ajax(true, null));
		}
		
		return "delnote";
	}
	//发布帖子
	public String addNote(){
		NoteService ns = DatabaseFactory.getNoteService(ServletActionContext.getServletContext());
		
		User u = (User) ActionContext.getContext().getSession().get(LOGIN_USER);
		Note n = new Note();
		n.setUserId(u.getId());
		n.setTitle(title);
		n.setNoteMsg(content);
		n.setNoteTime(new Date());
		n.setUpvoteTotal(0);
		n.setCommentTotal(0);
		n.setStatus(true);
		
		ns.save(n);
		n.setUserName(u.getLoginName());
		setJsondata(JsonUtil.ajax(true, null, n));
		return "addnote";
	}
	//退出社区
	public String indexPage(){
		
		return "success";
	}
}
