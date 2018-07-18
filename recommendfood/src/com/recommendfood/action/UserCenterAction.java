package com.recommendfood.action;

import java.io.File;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;
import com.recommendfood.factory.DatabaseFactory;
import com.recommendfood.model.Food;
import com.recommendfood.model.Note;
import com.recommendfood.model.NoteReply;
import com.recommendfood.model.User;
import com.recommendfood.model.UserComment;
import com.recommendfood.model.UserFavorites;
import com.recommendfood.model.UserRecommend;
import com.recommendfood.service.CommonService;
import com.recommendfood.service.FoodCategoryService;
import com.recommendfood.service.FoodService;
import com.recommendfood.service.NoteReplyService;
import com.recommendfood.service.NoteService;
import com.recommendfood.service.UserCommentService;
import com.recommendfood.service.UserFavoritesService;
import com.recommendfood.service.UserRecommendService;
import com.recommendfood.service.UserService;
import com.recommendfood.util.FileUtil;
import com.recommendfood.util.FormatUtil;
import com.recommendfood.util.JsonUtil;
import com.recommendfood.util.PatternUtil;
import com.recommendfood.util.QueryTypeEnum;
import com.recommendfood.util.SearchObject;
import com.recommendfood.util.SearchRelation;
import com.recommendfood.util.SearchUtil;

//用户中心类
public class UserCenterAction extends CommonAction implements ModelDriven<User>{
	private User user=new User();
	private File file;
	private String fileFileName;
	private String fileContentType;
	private boolean endpage;//是否已经是尾页
	private String uid;//用户的id
	
	private String birthYear;
	private String birthMonth;
	private String birthDay;
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public boolean isEndpage() {
		return endpage;
	}
	public void setEndpage(boolean endpage) {
		this.endpage = endpage;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getBirthYear() {
		return birthYear;
	}
	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}
	public String getBirthMonth() {
		return birthMonth;
	}
	public void setBirthMonth(String birthMonth) {
		this.birthMonth = birthMonth;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return this.user;
	}
	@Override
	public String execute() throws Exception {
		UserService us = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
		User u = (User) getSession().get(LOGIN_USER);
		u = us.get(u.getId());
		ServletActionContext.getRequest().setAttribute("user", u);
		return "success";
	}
	public String modifyUser(){
		User u = new User();
		user = (User) getSession().get(LOGIN_USER);
		UserService us = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
		
		u = us.get(user.getId());
//		System.out.println(u.getAddress());
		ServletActionContext.getRequest().setAttribute("user", u);
		
		return "modifyuser";
	}
	//修改用户的全部信息
	public String modifyUserInfo(){
		try{
			UserService us = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
			us.update(user);
		}catch (Exception e) {
			setMessage("系统出现故障");
		}
		return "modifyInfo";
	}
	//修改用户的非全部信息
	public String modify(){
		try {
//			user = 
			UserService us = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
			
//			System.out.println(user.getLoginName());
			User usession = (User)getSession().get(LOGIN_USER);
			User u = us.get(usession.getId());
			if(user.getLoginName()!=null && !("").equals(user.getLoginName())){
				u.setLoginName(user.getLoginName());
			}
			if(user.getLoginPassword()!=null && !("").equals(user.getLoginPassword())){
				u.setLoginPassword(user.getLoginPassword());
			}
//			if(user.getPhone()!=null && !("").equals(user.getPhone()))
//				params.add(SearchUtil.add(false, "phone", user.getPhone()));
//			if(user.getEmail()!=null && !("").equals(user.getEmail()))
//				params.add(SearchUtil.add(false, "email", user.getEmail()));
			if(user.getNotes()!=null && !("").equals(user.getNotes())){
				u.setNotes(user.getNotes());
			}
			if(user.getAddressProvice()!=null && !("").equals(user.getAddressProvice()) && user.getAddressCity()!=null && !("").equals(user.getAddressCity())){
				u.setAddress(user.getAddressProvice()+"-"+user.getAddressCity());
			}
			if(getBirthYear()!=null&&!("").equals(getBirthYear())&&getBirthMonth()!=null && !("").equals(getBirthMonth())&&getBirthDay()!=null && !("").equals(getBirthDay())){
				String birth = getBirthYear() + "-" + getBirthMonth() + "-"+getBirthDay();
				u.setBirth(FormatUtil.parseDate(birth, "yyyy-MM-dd"));
			}
//			System.out.println(u.);
			us.update(u);
			setJsondata(JsonUtil.ajax(true, null));
		} catch (Exception e) {
			setJsondata(JsonUtil.ajax(false, null));
			setMessage("系统出现故障");
		}
		return "modify";
	}
	//上传图片
	public String modifyPhoto(){
		try{
			ServletContext sc = ServletActionContext.getServletContext();
			user = (User) getSession().get(LOGIN_USER);
			UserService us = DatabaseFactory.getUserService(sc);
			
			String photofile = FileUtil.uploadFile(file, fileFileName, fileContentType, "userphoto", -1, sc);
			
			User u = us.get(user.getId());
			u.setPhoto(photofile);
			us.update(u);
			setJsondata(JsonUtil.ajax(true, null));
//			}
		}catch (Exception e) {
			setMessage("系统出现故障");
		}
		return "modifyphoto";
	}
	//浏览个人收藏(仅美食没有帖子)
	public String userFavorites(){
		try{
			setPageIndex(1);
			int pageSize = 5; //每次查询得到的记录数
			int firstResult  = (getPageIndex()-1)*pageSize;//查询起始页
//			System.out.println(firstResult);
			
			user = (User) getSession().get(LOGIN_USER);
			ServletContext sc = ServletActionContext.getServletContext();
			UserFavoritesService ufs = DatabaseFactory.getUserFavoritesService(sc);
			CommonService css = DatabaseFactory.getCommonService(sc);
			FoodCategoryService fcs = DatabaseFactory.getFoodCategoryService(sc);
			
			List<SearchObject> params = new ArrayList<SearchObject>();
			params.add(SearchUtil.add(false, "userId", user.getId()));
			List<SearchObject> relationParams = new ArrayList<SearchObject>();
			relationParams.add(SearchUtil.add(false, "status", 1));
			
			List<SearchRelation> searchList = new ArrayList<SearchRelation>();
			searchList.add(SearchUtil.addRelation("Food", "id", "f", true, relationParams, "UserFavorites", "foodId"));
			Map<String, String> orderColumns = new HashMap<String, String>();
			orderColumns.put("collectTime", "desc");
			List<Object[]> lists = ufs.getListByParams(params, searchList);
			List<UserFavorites> favorites = new ArrayList<UserFavorites>();
//			System.out.println(lists.size());
			for(Object[] objs:lists){
				UserFavorites uf = (UserFavorites) objs[0];
				Food f = (Food) objs[1];
				uf.setFoodName(f.getName());
				uf.setFoodPictures(f.getPictures().split("%")[0]);
//				uf.setFoodTypes(f.getFoodType());
				StringBuffer foodTypeNames = new StringBuffer();
				String[] foodTypes = PatternUtil.extractStr(f.getFoodType(), ",");
				foodTypes = f.getFoodType().split(",");
				for(String s:foodTypes){
					if(s!=null && !("").equals(s)){
						foodTypeNames.append(fcs.get(Integer.parseInt(s)).getName() + "，");//标点为中文格式
					}
				}
				if(foodTypeNames.length()>0){
					foodTypeNames.deleteCharAt(foodTypeNames.length()-1);
				}
				uf.setFoodTypes(foodTypeNames.toString());
				uf.setIntroduce(f.getIntroduction());
				
				String sql="select count(*) from user_comment where food_id=?";
				Object[] values1 = {f.getId()};
				List<Object> commentTotal = css.executeSqlWithReport(sql, values1);
				BigInteger bi = new BigInteger(String.valueOf(commentTotal.get(0)));
				uf.setCommentTotal(bi.intValue());//评论量
				
				String sql2="select count(*) from user_favorites where food_id=?";
				List<Object> favoritesTotal = css.executeSqlWithReport(sql2, values1);
				bi = new BigInteger(String.valueOf(favoritesTotal.get(0)));
				uf.setFavoritesTotal(bi.intValue());//查询收藏量
				
				Object[] values2 = {f.getId(), 1};
				String sql3="select count(*) from user_food_thumbsup where food_id=? and type=?";
				List<Object> thumbsupTotal = css.executeSqlWithReport(sql3, values2);
				bi = new BigInteger(String.valueOf(thumbsupTotal.get(0)));
				uf.setThumbsupTotal(bi.intValue());//查询点赞量
				
				Object[] values5 = {user.getId(), f.getId(), 1};
				String sql4 = "select count(*) from user_food_thumbsup where user_id=? and food_id=? and type=?";
				List<Object> isthumbsup = css.executeSqlWithReport(sql4, values5);
				bi = new BigInteger(String.valueOf(isthumbsup.get(0)));
				if(bi.intValue()>0){
					uf.setThumbsup(true);
				}else{
					uf.setThumbsup(false);
				}//是否点赞
				
				favorites.add(uf);
			}
			setDataList(favorites);
		}catch (Exception e) {
			setMessage("系统出现故障");
		}
		return "favorites";
	}
	//浏览个人主贴
	public String userNotes(){
		/*try{
			setPageIndex(1);
			int pageSize = 5; //每次查询得到的记录数
			int firstResult  = (getPageIndex()-1)*pageSize;//查询起始页
			
			user.setId(1L);
			NoteService ns = DatabaseFactory.getNoteService(ServletActionContext.getServletContext());
			List<SearchObject> params = new ArrayList<SearchObject>();
			params.add(SearchUtil.add(false, "userId", 1L));
			Map<String, String> orderColumns = new HashMap<String, String>();
			orderColumns.put("noteTime", "desc");
			List<Note> lists = ns.findNoteListByParamsWithOrderAndPage(params, orderColumns, 0, pageSize);
			
			NoteReplyService brs = DatabaseFactory.getNoteReplyService(ServletActionContext.getServletContext());
			List<SearchObject> param = null;
			for(Note n:lists){
				param = new ArrayList<SearchObject>();
				param.add(SearchUtil.add(false, "noteId", n.getId()));
				Object o = brs.findReportRecord(param, QueryTypeEnum.TOTAL_RECORD, null);
				n.setReplyRecord((Long)o);//查询回复总量
				param.add(SearchUtil.add(false, "read", false));
				Object o2 = brs.findReportRecord(param, QueryTypeEnum.TOTAL_RECORD, null);
				boolean isRead = (Long)o2>0?true:false;
				n.setRead(isRead);//查询是否有未读回帖
//				System.out.println(n.getId() + ":" + n.getTitle());
			}
			setJsondata(JsonUtil.ajax(true, null, lists));
		}catch (Exception e) {
			setMessage("系统出现故障");
		}*/
		return "usernotes";
	}
	//查看个人评论
	public String userComments(){
		/*try{
			setPageIndex(1);
			int pageSize = 5; //每次查询得到的记录数
			int firstResult  = (getPageIndex()-1)*pageSize;//查询起始页
			
			user.setId(1L);
			CommonService cs = DatabaseFactory.getCommonService(ServletActionContext.getServletContext());
			NoteReplyService nrs = DatabaseFactory.getNoteReplyService(ServletActionContext.getServletContext());
			UserCommentService ucs = DatabaseFactory.getUserCommentService(ServletActionContext.getServletContext());
			FoodService fs = DatabaseFactory.getFoodService(ServletActionContext.getServletContext());
			NoteService nss = DatabaseFactory.getNoteService(ServletActionContext.getServletContext());
			UserService uss = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
			
			
			String sql="select id,comment_time,score from user_comment where user_id=? union all select id, reply_time, note_id from note_reply where user_id=? order by 2";
			List<Object> lists = new ArrayList<Object>();
			lists.add(1);
			lists.add(1);
			List<Object[]> alls = cs.executeSqlWithPage(sql, lists, 0, pageSize);
			
			String sqls = null;
			List<Object> dataList = new ArrayList<Object>();
			for(Object[] objs:alls){
				Object o = null;
				sqls = "select count(*) from user_comment where id=? and score=?";
				List<Object> oos = new ArrayList<Object>();
				oos.add(objs[0]);
				oos.add(Double.parseDouble(String.valueOf(objs[2])));
				List<Object> lists2 = cs.executeSqlWithReport(sqls, oos);
				BigInteger bi = new BigInteger(String.valueOf(lists2.get(0)));
				if(bi.intValue()>0){//查询的是美食评论
					UserComment uc = ucs.get(Long.parseLong(String.valueOf(objs[0])));
					
					List<SearchObject> searchObjects = new ArrayList<SearchObject>();
					searchObjects.add(SearchUtil.add(false, "id", uc.getFoodId()));
					List<SearchRelation> srs = new ArrayList<SearchRelation>();
					srs.add(SearchUtil.addRelation("UserRecommend", "foodId", "ur", true, new ArrayList<SearchObject>(), "Food", "id"));
					List<Object[]> oss = fs.getListByParams(searchObjects, srs);
					if(oss!=null && oss.size()>0){
						Food f = (Food) oss.get(0)[0];
						UserRecommend ur = (UserRecommend) oss.get(0)[1];
						uc.setFoodName(f.getName());
						uc.setUserName(f.getPictures());
						uc.setFoodType(f.getFoodType());
						uc.setFoodIntroduction(f.getIntroduction());
//						uc.setRecommendTime(ur.getRecommendTime());
//						uc.setRecommendUserName(uss.get(ur.getUserId()).getLoginName());
					}
					o = uc;
				}else{//查询的帖子
					NoteReply nr = nrs.get(Long.parseLong(String.valueOf(objs[0])));
					nr.setUserName(uss.get(nr.getUserId()).getLoginName());
					nr.setIndexNote(nss.get(nr.getNoteId()));//查找主贴
					nr.getIndexNote().setUserName(uss.get(nr.getIndexNote().getId()).getLoginName());
					
					List<SearchObject> nrseas = new ArrayList<SearchObject>();//查找评论的回复
					nrseas.add(SearchUtil.add(false, "noteId", nr.getNoteId(), "="));
					nrseas.add(SearchUtil.add(false, "parentId", nr.getId(), "="));
					List<NoteReply> notereplys = nrs.findFoodListByParams(nrseas);
					for(NoteReply n:notereplys){
						n.setUserName(uss.get(n.getUserId()).getLoginName());
					}
					nr.setReplys(notereplys);
					o = nr;
					
	//				System.out.println(nr.getId() + ":" + nr.getUserName() + ":" + nr.getIndexNote().getId() + ":" + nr.getIndexNote().getUserName() + ":" + nr.getIndexNote().getTitle());
	//				for(NoteReply n:nr.getReplys()){
	//					System.out.println(n.getId() + ":" + n.getUserName());
	//				}
				}
				dataList.add(o);
			}
		}catch (Exception e) {
			setMessage("系统出现故障");
		}
//		for(Object o:dataList){
//			System.out.println(o);
//		}*/
		return "usercomments";
	}
//	private boolean endpage;
	//浏览用户推荐
	public String userRecommends(){
		try{
			//System.out.println("userrecommend");
			user = (User) getSession().get(LOGIN_USER);
			if(getPageIndex()<=0){
				setPageIndex(1);
			}
			int pageSize = 3; //每次查询得到的记录数
			
			UserRecommendService urs = DatabaseFactory.getUserRecommendService(ServletActionContext.getServletContext());
			CommonService css = DatabaseFactory.getCommonService(ServletActionContext.getServletContext());
			FoodService fs = DatabaseFactory.getFoodService(ServletActionContext.getServletContext());
			FoodCategoryService fcs = DatabaseFactory.getFoodCategoryService(ServletActionContext.getServletContext());
			
			List<SearchObject> all = new ArrayList<SearchObject>();
			all.add(SearchUtil.add(false, "userId", user.getId(), "="));
			Map<String, String> orderColumns = new HashMap<String, String>();
			orderColumns.put("recommendTime", "desc");
			
			List<SearchObject> searchList = new ArrayList<SearchObject>();
			searchList.add(SearchUtil.add(false, "checkInfo", 1, "="));
			List<SearchRelation> relations = new ArrayList<SearchRelation>();
			relations.add(SearchUtil.addRelation("AdminCheck", "recommendId", "ac", false, searchList, "UserRecommend", "id"));
			
			int total = 0;//
			List<UserRecommend> alls = urs.getListByParams(all, relations);
			if(alls!=null && alls.size()>0){
				total = alls.size();
			}
//			if((getPageIndex())*pageSize>=total){
//				setPageIndex(total%pageSize==0?total/pageSize:(total/pageSize)+1);
//			}
//			if((getPageIndex()-1)*pageSize>=total && getPageIndex()>1){
				//setJsondata(JsonUtil.ajax(false, "加载完毕"));
//				return "usercommendsajax";
//			}
			int firstResult  = (getPageIndex()-1)*pageSize;//查询起始页
			
//			List<UserRecommend> allur = urs.getListByParamsWithPage(all, relations, orderColumns, firstResult, pageSize);
			List<UserRecommend> allur= urs.getListByParams(all, relations);
			
			for(UserRecommend ur:allur){
				Food f = fs.get(ur.getFoodId());
				ur.setFoodName(f.getName());
				ur.setFoodPictures(f.getPictures().split("%")[0]);
				
				StringBuffer foodTypeNames = new StringBuffer();
				String[] foodTypes = PatternUtil.extractStr(f.getFoodType(), ",");
				foodTypes = f.getFoodType().split(",");
				for(String s:foodTypes){
					if(s!=null && !("").equals(s)){
						foodTypeNames.append(fcs.get(Integer.parseInt(s)).getName() + "，");//标点为中文格式
					}
				}
				if(foodTypeNames.length()>0){
					foodTypeNames.deleteCharAt(foodTypeNames.length()-1);
				}
//				System.out.println();
				ur.setFoodTypes(foodTypeNames.toString());
				ur.setFoodIntroduce(f.getIntroduction());
				String sql="select count(*) from user_comment where food_id=?";
				Object[] values1 = {f.getId()};
				List<Object> commentTotal = css.executeSqlWithReport(sql, values1);
				BigInteger bi = new BigInteger(String.valueOf(commentTotal.get(0)));
				ur.setCommentTotal(bi.intValue());//查询评论量
				
				String sql2="select count(*) from user_favorites where food_id=?";
				List<Object> favoritesTotal = css.executeSqlWithReport(sql2, values1);
				bi = new BigInteger(String.valueOf(favoritesTotal.get(0)));
				ur.setFavoritesTotal(bi.intValue());//查询收藏量
				
				Object[] values2 = {f.getId(), 1};
				String sql3="select count(*) from user_food_thumbsup where food_id=? and type=?";
				List<Object> thumbsupTotal = css.executeSqlWithReport(sql3, values2);
				bi = new BigInteger(String.valueOf(thumbsupTotal.get(0)));
				ur.setThumbsupTotal(bi.intValue());//查询点赞量
				
				Object[] values5 = {user.getId(), f.getId(), 1};
				String sql4 = "select count(*) from user_food_thumbsup where user_id=? and food_id=? and type=?";
				List<Object> isthumbsup = css.executeSqlWithReport(sql4, values5);
				bi = new BigInteger(String.valueOf(isthumbsup.get(0)));
				if(bi.intValue()>0){
					ur.setThumbsup(true);
				}else{
					ur.setThumbsup(false);
				}//是否点赞
				Object[] values6 = {user.getId(), f.getId()};
				String sql5 = "select count(*) from user_favorites where user_id=? and food_id=?";
				List<Object> isFavorites = css.executeSqlWithReport(sql5, values6);
				bi = new BigInteger(String.valueOf(isFavorites.get(0)));
				if(bi.intValue()>0){
					ur.setFavorites(true);
				}else{
					ur.setFavorites(false);
				}//是否收藏
			}
			//System.out.println(allur.size());
//			if(getPageIndex()>1){
				//setJsondata(JsonUtil.getJsonByList(allur));
//				return "usercommendsajax";
//			}else{
				setDataList(allur);
//			}
		}catch (Exception e) {
			setMessage("系统出现故障");
		}
		return "userrecommends";
	}
}
