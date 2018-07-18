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

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.recommendfood.factory.DatabaseFactory;
import com.recommendfood.model.AdminCheck;
import com.recommendfood.model.Food;
import com.recommendfood.model.FoodCategory;
import com.recommendfood.model.FoodSeasoning;
import com.recommendfood.model.FoodStuff;
import com.recommendfood.model.Step;
import com.recommendfood.model.User;
import com.recommendfood.model.UserComment;
import com.recommendfood.model.UserRecommend;
import com.recommendfood.service.AdminCheckService;
import com.recommendfood.service.CommonService;
import com.recommendfood.service.FoodCategoryService;
import com.recommendfood.service.FoodService;
import com.recommendfood.service.NoteService;
import com.recommendfood.service.UserCommentService;
import com.recommendfood.service.UserRecommendService;
import com.recommendfood.service.UserService;
import com.recommendfood.util.FileUtil;
import com.recommendfood.util.FormatUtil;
import com.recommendfood.util.JsonUtil;
import com.recommendfood.util.PatternUtil;
import com.recommendfood.util.SearchObject;
import com.recommendfood.util.SearchRelation;
import com.recommendfood.util.SearchUtil;

import freemarker.core.Comment;

//美食操作类
public class FoodAction extends CommonAction {
	private String foodname;//食物名称
	private String foodintroduction;//食物介绍
	private List<File> foodPic;//食物图片
	private List<String> foodPicFileName;
	private List<String> foodPicContentType;
	private List<String> stepnote;//操作过程
	private List<File> steppic;//操作图解
	private List<String> steppicFileName;//
	private List<String> steppicContentType;//
	private List<FoodStuff> stuffs;//主料
	private List<FoodSeasoning> seasonings;//辅料
	private List<String> foodcs;//所属类型
	private String foodTypes;//所属类型
	private List<Step> steps;//操作步骤
	
	private boolean endpage;//是否是尾页
	private String queryinfo;//查询信息
	private String foodId;//美食的id
	
	
	
	public List<Step> getSteps() {
		return steps;
	}
	public void setSteps(List<Step> steps) {
		this.steps = steps;
	}
	public String getFoodId() {
		return foodId;
	}
	public void setFoodId(String foodId) {
		this.foodId = foodId;
	}
	public List<String> getStepnote() {
		return stepnote;
	}
	public List<File> getFoodPic() {
		return foodPic;
	}
	public void setFoodPic(List<File> foodPic) {
		this.foodPic = foodPic;
	}
	public List<String> getFoodPicFileName() {
		return foodPicFileName;
	}
	public void setFoodPicFileName(List<String> foodPicFileName) {
		this.foodPicFileName = foodPicFileName;
	}
	public List<String> getFoodPicContentType() {
		return foodPicContentType;
	}
	public void setFoodPicContentType(List<String> foodPicContentType) {
		this.foodPicContentType = foodPicContentType;
	}
	public void setStepnote(List<String> stepnote) {
		this.stepnote = stepnote;
	}
	public List<File> getSteppic() {
		return steppic;
	}
	public void setSteppic(List<File> steppic) {
		this.steppic = steppic;
	}
	public List<String> getSteppicFileName() {
		return steppicFileName;
	}
	public void setSteppicFileName(List<String> steppicFileName) {
		this.steppicFileName = steppicFileName;
	}
	public List<String> getSteppicContentType() {
		return steppicContentType;
	}
	public void setSteppicContentType(List<String> steppicContentType) {
		this.steppicContentType = steppicContentType;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public String getFoodintroduction() {
		return foodintroduction;
	}
	public void setFoodintroduction(String foodintroduction) {
		this.foodintroduction = foodintroduction;
	}
	public List<FoodStuff> getStuffs() {
		return stuffs;
	}
	public void setStuffs(List<FoodStuff> stuffs) {
		this.stuffs = stuffs;
	}
	public List<String> getFoodcs() {
		return foodcs;
	}
	public void setFoodcs(List<String> foodcs) {
		this.foodcs = foodcs;
	}
	public List<FoodSeasoning> getSeasonings() {
		return seasonings;
	}
	public void setSeasonings(List<FoodSeasoning> seasonings) {
		this.seasonings = seasonings;
	}
	public String getFoodTypes() {
		return foodTypes;
	}
	public void setFoodTypes(String foodTypes) {
		this.foodTypes = foodTypes;
	}
	public boolean isEndpage() {
		return endpage;
	}
	public void setEndpage(boolean endpage) {
		this.endpage = endpage;
	}
	public String getQueryinfo() {
		return queryinfo;
	}
	public void setQueryinfo(String queryinfo) {
		this.queryinfo = queryinfo;
	}
	//食物推荐页面
	public String recommendFoodPage(){
		
		return "recommendfoodpage";
	}
	//申请食物推荐
	public String recommendFood(){
		User user = new User();
		user = (User) getSession().get(LOGIN_USER);
		FoodService fs = DatabaseFactory.getFoodService(ServletActionContext.getServletContext());
		UserRecommendService urs=  DatabaseFactory.getUserRecommendService(ServletActionContext.getServletContext());
		AdminCheckService acs = DatabaseFactory.getAdminCheckService(ServletActionContext.getServletContext());
		ServletContext sc = ServletActionContext.getServletContext();
		
		Date d = new Date();
		String format = "yyyyMMdd";
		Food f = new Food();
		String savePath="resource/pic";
		
		f.setName(foodname.trim());
		f.setIntroduction(foodintroduction.trim());
		
//		String path = getContentPath() + File.separator +savePath;
		StringBuffer pictures = new StringBuffer();
		for(int i=0;i<foodPicFileName.size();i++){
			File ff = foodPic.get(i);
			String ffName = foodPicFileName.get(i);
			
			pictures.append(FileUtil.uploadFile(ff, ffName, foodPicContentType.get(0), "foodpic", i, sc)+"%");
		}
//		System.out.println(pictures);
		pictures.deleteCharAt(pictures.length()-1);
		f.setPictures(pictures.toString());
		
		if(stuffs!=null && stuffs.size()>0){
			StringBuffer stuff = new StringBuffer();
			for(FoodStuff stu:stuffs){
				if(stu.getStuffName()!=null && !("").equals(stu.getStuffName()))
					stuff.append(stu.getStuffName().trim() + "="+stu.getStuffAmount().trim()+"%");
			}
			if(stuff.length()>0){
				stuff.deleteCharAt(stuff.length()-1);
			}
//			System.out.println(stuff);
			f.setStuff(stuff.toString());
		}
		if(seasonings!=null && seasonings.size()>0){
			StringBuffer seasoning = new StringBuffer();
			for(FoodSeasoning sea:seasonings){
				if(sea.getSeasoningName()!=null && !("").equals(sea.getSeasoningName().trim()))
					seasoning.append(sea.getSeasoningName().trim() + "="+sea.getSeasoningAmount().trim()+"%");
			}
			if(seasoning.length()>0){
				seasoning.deleteCharAt(seasoning.length()-1);
			}
//			System.out.println(seasoning);
			f.setSeasoning(seasoning.toString());
		}
		StringBuffer process = new StringBuffer();
		if(stepnote!=null && stepnote.size()>0){
			for(int i=0;i<stepnote.size();i++){
				process.append(stepnote.get(i)+"=");
				if(steppic.get(i)!=null){
					File ff = steppic.get(i);
					String ffName = steppicFileName.get(i);
					process.append(FileUtil.uploadFile(ff, ffName, steppicContentType.get(0), "foodprocess", i, sc)+"%");
				}
			}
			process.deleteCharAt(process.length()-1);
			f.setManufacturingProcess(process.toString());
		}
		f.setFoodType(foodTypes);
		f.setStatus(0);
		
		fs.save(f);
		
//		System.out.println(f.getId());
		//推送美食添加
		UserRecommend ur = new UserRecommend();
		ur.setUserId(user.getId());
		ur.setFoodId(f.getId());
		ur.setRecommendTime(new Date());
		urs.save(ur);
		//申请提交
		AdminCheck ac = new AdminCheck();
		ac.setRecommendId(ur.getId());
		ac.setCheckInfo(2);
		ac.setCheckTime(new Date());
		acs.save(ac);
		
		return "recommendfood";
	}
	//按照条件搜索
	public String searchFood(){
		try{
			User user = new User();
			user = (User) getSession().get(LOGIN_USER);
			if(getPageIndex()<=0){
				setPageIndex(1);
			}
			int pageSize = 3; //每次查询得到的记录数
			
			CommonService css = DatabaseFactory.getCommonService(ServletActionContext.getServletContext());
			FoodService fs = DatabaseFactory.getFoodService(ServletActionContext.getServletContext());
			FoodCategoryService fcs = DatabaseFactory.getFoodCategoryService(ServletActionContext.getServletContext());
			
			List<SearchObject> all = new ArrayList<SearchObject>();
			all.add(SearchUtil.add(false, "status", 1, "="));
			if(getQueryinfo()!=null && !("").equals(getQueryinfo().trim())){
				List<SearchObject> params = new ArrayList<SearchObject>();
				params.add(SearchUtil.add(false, "name", getQueryinfo(), true));
				params.add(SearchUtil.add(true, "stuff", getQueryinfo(), true));
				all.add(SearchUtil.add(false, params));
			}
			int total = 0;//
			List<Food> alls = fs.findFoodListByParams(all);
			if(alls!=null && alls.size()>0){
				total = alls.size();
			}
//			System.out.println(total + ":" + getPageIndex());
			if((getPageIndex())*pageSize>=total){
				setPageIndex(total%pageSize==0?total/pageSize:(total/pageSize)+1);
				setEndpage(true);
			}else{
				setEndpage(false);
			}
			int firstResult  = (getPageIndex()-1)*pageSize;//查询起始页
			
			List<Food> allur = fs.findFoodListByParamsWithOrderAndPage(all, firstResult, pageSize);
			
			for(Food f:allur){
				f.setPictures(f.getPictures().split("%")[0]);
				StringBuffer foodTypeNames = new StringBuffer();
				String[] foodTypes = f.getFoodType().split(",");
				for(String s:foodTypes){
					if(s!=null && !("").equals(s)){
						foodTypeNames.append(fcs.get(Integer.parseInt(s)).getName() + "，");//标点为中文格式
					}
				}
				if(foodTypeNames.length()>0){
					foodTypeNames.deleteCharAt(foodTypeNames.length()-1);
				}
//				System.out.println(foodTypeNames.toString());
				f.setFoodType(foodTypeNames.toString());
				String sql="select count(*) from user_comment where food_id=?";
				Object[] values1 = {f.getId()};
				List<Object> commentTotal = css.executeSqlWithReport(sql, values1);
				BigInteger bi = new BigInteger(String.valueOf(commentTotal.get(0)));
				f.setCommentTotal(bi.intValue());//查询评论量
				
				String sql2="select count(*) from user_favorites where food_id=?";
				List<Object> favoritesTotal = css.executeSqlWithReport(sql2, values1);
				bi = new BigInteger(String.valueOf(favoritesTotal.get(0)));
				f.setFavoritesTotal(bi.intValue());//查询收藏量
				
				Object[] values2 = {f.getId(), 1};
				String sql3="select count(*) from user_food_thumbsup where food_id=? and type=?";
				List<Object> thumbsupTotal = css.executeSqlWithReport(sql3, values2);
				bi = new BigInteger(String.valueOf(thumbsupTotal.get(0)));
				f.setThumbsupTotal(bi.intValue());//查询点赞量
				
				/*Object[] values5 = {user.getId(), f.getId(), 1};
				String sql4 = "select count(*) from user_food_thumbsup where user_id=? and food_id=? and type=?";
				List<Object> isthumbsup = css.executeSqlWithReport(sql4, values5);
				bi = new BigInteger(String.valueOf(isthumbsup.get(0)));
				if(bi.intValue()>0){
					ur.setThumbsup(true);
				}else{
					ur.setThumbsup(false);
				}//是否点赞*/
				/*Object[] values6 = {user.getId(), f.getId()};
				String sql5 = "select count(*) from user_favorites where user_id=? and food_id=?";
				List<Object> isFavorites = css.executeSqlWithReport(sql5, values6);
				bi = new BigInteger(String.valueOf(isFavorites.get(0)));
				if(bi.intValue()>0){
					ur.setFavorites(true);
				}else{
					ur.setFavorites(false);
				}//是否收藏*/
			}
			setDataList(allur);
//			System.out.println(allur.size());
		}catch (Exception e) {
			setMessage("系统出现故障");
		}
		return "searchfood";
	}
	//查看美食的详细信息
	public String foodInfo(){
		try {
//			System.out.println(getFoodId());
//			System.out.println(getQueryinfo());
			User u = new User();
			u = (User) getSession().get(LOGIN_USER);
			long foodid = Integer.parseInt(getFoodId());
			FoodService fs = DatabaseFactory.getFoodService(ServletActionContext.getServletContext());
			FoodCategoryService fcs = DatabaseFactory.getFoodCategoryService(ServletActionContext.getServletContext());
			UserService us = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
			CommonService cs = DatabaseFactory.getCommonService(ServletActionContext.getServletContext());
			Food f = fs.get(foodid);
			
			//配料
			List<FoodStuff> list1 = new ArrayList<FoodStuff>();
			for(String s:f.getStuff().split("%")){
				FoodStuff stuff = new FoodStuff();
				stuff.setStuffName(s.split("=")[0]);
				stuff.setStuffAmount(s.split("=")[1]);
				list1.add(stuff); 
			}
			setStuffs(list1);
			
			//辅料
			List<FoodSeasoning> list2 = new ArrayList<FoodSeasoning>();
			for(String s:f.getSeasoning().split("%")) {
				FoodSeasoning seasoning = new FoodSeasoning();
				seasoning.setSeasoningName(s.split("=")[0]);
				seasoning.setSeasoningAmount(s.split("=")[1]);
				list2.add(seasoning);
			}
			setSeasonings(list2);
			
			//图片
			f.setPictures(f.getPictures().split("%")[0]);
			
			//步骤
			List<Step> list4 = new ArrayList<Step>();
			for(String s:f.getManufacturingProcess().split("%")) {
				Step step = new Step();
				step.setIntroduce(s.split("=")[0]);
				step.setPicture(s.split("=")[1]);
				list4.add(step);
			}
			setSteps(list4);
			
			//类型
			String foodtype = f.getFoodType();			
			String[] foodtypes = foodtype.split(",");
			StringBuffer sb = new StringBuffer();
			
			for(String s : foodtypes) {
				String fsname = fcs.get(Integer.parseInt(s)).getName();
				sb.append(fsname + "，");
			}
			f.setFoodType(sb.toString());

			//评论
			UserCommentService urs = DatabaseFactory.getUserCommentService(ServletActionContext.getServletContext());
			List<SearchObject> params = new ArrayList<SearchObject>();
			params.add(SearchUtil.add(false, "foodId", f.getId(), "="));
			Map<String, String> orders = new HashMap<String, String>();
			orders.put("commentTime", "desc");
			List<SearchRelation> relations = new ArrayList<SearchRelation>();
			relations.add(SearchUtil.addRelation("User", "id", "user", true, null, "UserComment", "userId"));
			
			List<Object[]> reas = urs.getListByParamsWithOrder(params, relations, orders);
			List<UserComment> allurs = new ArrayList<UserComment>();
			for(Object[] objs:reas){
				UserComment uc = (UserComment) objs[0];
				User uu = (User) objs[1];
				uc.setUserName(uu.getLoginName());
				uc.setUserPicture(uu.getPhoto());
				allurs.add(uc);
			}
			Object[] values1 = {f.getId()};
			String sql="select count(*) from user_favorites where food_id=?";
			List<Object> favoritesTotal = cs.executeSqlWithReport(sql, values1);
			BigInteger bi = new BigInteger(String.valueOf(favoritesTotal.get(0)));
			ServletActionContext.getRequest().setAttribute("favoritestotal", bi.intValue());//查询收藏量
			
			Object[] values2 = {f.getId(), 1};
			String sql2="select count(*) from user_food_thumbsup where food_id=? and type=?";
			List<Object> thumbsupTotal = cs.executeSqlWithReport(sql2, values2);
			bi = new BigInteger(String.valueOf(thumbsupTotal.get(0)));
			ServletActionContext.getRequest().setAttribute("thumbuptotal", bi.intValue());//查询点赞量
			
			Object[] values5 = {u.getId(), f.getId(), 1};
			String sql4 = "select count(*) from user_food_thumbsup where user_id=? and food_id=? and type=?";
			List<Object> isthumbsup = cs.executeSqlWithReport(sql4, values5);
			bi = new BigInteger(String.valueOf(isthumbsup.get(0)));
			if(bi.intValue()>0){
				ServletActionContext.getRequest().setAttribute("thumbup",true);
			}else{
				ServletActionContext.getRequest().setAttribute("thumbup", false);
			}//是否点赞
			Object[] values6 = {u.getId(), f.getId()};
			String sql5 = "select count(*) from user_favorites where user_id=? and food_id=?";
			List<Object> isFavorites = cs.executeSqlWithReport(sql5, values6);
			bi = new BigInteger(String.valueOf(isFavorites.get(0)));
			if(bi.intValue()>0){
				ServletActionContext.getRequest().setAttribute("favorites", true);
			}else{
				ServletActionContext.getRequest().setAttribute("favorites", false);
			}//是否收藏
			
			ServletActionContext.getRequest().setAttribute("comments", allurs);
			ServletActionContext.getRequest().setAttribute("user", us.get(u.getId()));
			
		} catch (Exception e) {
		}
		return "foodinfo";
	}
	
	public String loadFoodCategory(){
		FoodCategoryService fcs = DatabaseFactory.getFoodCategoryService(ServletActionContext.getServletContext());
		List<SearchObject> params = new ArrayList<SearchObject>();
		params.add(SearchUtil.add(false, "systemCategory", 1));
//		params.add(SearchUtil.add(true, "systemCategory", 1L));
		
		List<FoodCategory> datas = fcs.findFoodCategoryListByParams(params);
//		System.out.println(datas.size());
		setJsondata(JsonUtil.ajax(true, "", datas));
		return "loadfoodcategory";
	}
	
	public String getFileName(String modifyStr, String fileName, int i){
		Date d = new Date();
		String format = "yyyyMMddHHmmss";
		String fName = null;
		if(i==-1){
			fName = modifyStr + FormatUtil.formatDate(d, format)  + FileUtil.getType(fileName);
		}else{
			fName = modifyStr + FormatUtil.formatDate(d, format)  + i +  FileUtil.getType(fileName);
		}
		return fName;
	}
	public String getContentPath(){
		return ServletActionContext.getServletContext().getRealPath("");
	}
}
