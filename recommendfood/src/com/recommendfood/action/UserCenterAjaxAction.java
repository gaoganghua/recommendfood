package com.recommendfood.action;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.recommendfood.factory.DatabaseFactory;
import com.recommendfood.model.User;
import com.recommendfood.model.UserComment;
import com.recommendfood.model.UserFavorites;
import com.recommendfood.model.UserFoodThumbsup;
import com.recommendfood.service.CommonService;
import com.recommendfood.service.UserCommentService;
import com.recommendfood.service.UserFavoritesService;
import com.recommendfood.service.UserFoodThumbsupService;
import com.recommendfood.service.UserService;
import com.recommendfood.util.JsonUtil;
import com.recommendfood.util.SearchObject;
import com.recommendfood.util.SearchUtil;

//个人中心ajax请求类
public class UserCenterAjaxAction extends CommonAction<Object>{
	private static final long serialVersionUID = 1L;
	private String foodId;
	private User user;
	private String oldpassword;//
	private String newpassword;//
	private String comment;//评论
	
	
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getFoodId() {
		return foodId;
	}
	public void setFoodId(String foodId) {
		this.foodId = foodId;
	}
	public String getOldpassword() {
		return oldpassword;
	}
	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}
	public String getNewpassword() {
		return newpassword;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	//检验密码
	public String checkPassword(){
		try {
//			System.out.println(getOldpassword());
			user = new User();
			user = (User) getSession().get(LOGIN_USER);
			UserService us=  DatabaseFactory.getUserService(ServletActionContext.getServletContext());
			
			user = us.get(user.getId());
			if(user.getLoginPassword().equals(getOldpassword())){
				setJsondata(JsonUtil.ajax(true, null));
			}else{
				setJsondata(JsonUtil.ajax(false, "密码错误"));
			}
//			System.out.println(getJsondata());
		} catch (Exception e) {
		}
		return "checkpassword";
	}
	//修改密码
	public String modifyPassword(){
		try {
			user = new User();
			user = (User) getSession().get(LOGIN_USER);
			UserService us=  DatabaseFactory.getUserService(ServletActionContext.getServletContext());
			
			
			user = us.get(user.getId());
			user.setLoginPassword(getNewpassword());
			us.update(user);
			setJsondata(JsonUtil.ajax(true, null));
		} catch (Exception e) {
			setJsondata(JsonUtil.ajax(false, "密码修改失败"));
		}
		
		return "modifypassword";
	}
	//点赞
	public String userThumbsup(){
		try{
			user = new User();
			user = (User) getSession().get(LOGIN_USER);
//			System.out.println("ajax");
	
			Object[] values = {user.getId(), Integer.parseInt(foodId), 1};
			String sql = "select count(*) from user_food_thumbsup where user_id=? and food_id=? and type=?";
			CommonService cs = DatabaseFactory.getCommonService(ServletActionContext.getServletContext());
			
			List<Object> all = cs.executeSqlWithReport(sql, values);
			BigInteger bi = new BigInteger(String.valueOf(all.get(0)));
			
			int total = bi.intValue();
			String msg = null;
			if(total>0){
				msg = "你已经赞过了";
				setJsondata(JsonUtil.ajax(false, msg));
			}else{
				Object[] values3 = {user.getId(), Long.parseLong(foodId)};
				sql = "select count(*) from user_food_thumbsup where user_id=? and food_id=?";
				all = cs.executeSqlWithReport(sql, values3);
				bi = new BigInteger(String.valueOf(all.get(0)));
//				System.out.println(bi.intValue());
				if(bi.intValue()>0){
					Object[] values2 = {1, user.getId(), Long.parseLong(foodId)};
					sql="update user_food_thumbsup set type=? where user_id=? and food_id=?";
					boolean flag= cs.updateSql(sql, values2);
					if(flag)
						setJsondata(JsonUtil.ajax(true, msg));
					else{
						msg = "点赞失败";
						setJsondata(JsonUtil.ajax(false, msg));
					}
				}else{
					byte b = 1;
					UserFoodThumbsup uft = new UserFoodThumbsup();
					uft.setUserId(user.getId());
					uft.setFoodId(Long.parseLong(foodId));
					uft.setType(b);
					uft.setThumbsupTime(new Date());
					UserFoodThumbsupService ufts = DatabaseFactory.getUserFoodThumbsupService(ServletActionContext.getServletContext());
					ufts.save(uft);
					setJsondata(JsonUtil.ajax(true, msg));
				}
			}
		}catch (Exception e) {
		}
		return "userthumbsup";
	}
	//取消点赞
	public String userThumbsupCancel(){
		try{
			user = new User();
			user = (User) getSession().get(LOGIN_USER);
			
			Object[] values = {user.getId(), Long.parseLong(foodId), 0};
			String sql = "select count(*) from user_food_thumbsup where user_id=? and food_id=? and type=?";
			CommonService cs = DatabaseFactory.getCommonService(ServletActionContext.getServletContext());
			
			List<Object> all = cs.executeSqlWithReport(sql, values);
			BigInteger bi = new BigInteger(String.valueOf(all.get(0)));
			
			int total = bi.intValue();
			String msg = null;
			if(total>0){
				msg = "你已经取消了点赞";
				setJsondata(JsonUtil.ajax(false, msg));
			}else{
				Object[] values2 = {0, user.getId(), Long.parseLong(foodId)};
				sql="update user_food_thumbsup set type=? where user_id=? and food_id=?";
				boolean flag = cs.updateSql(sql, values2);
				if(flag)
					setJsondata(JsonUtil.ajax(true, msg));
				else{
					msg = "点赞失败";
					setJsondata(JsonUtil.ajax(false, msg));
				}
				
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return "userthumbsupcancel";
	}
	//收藏
	public String userFavorites(){
		user = new User();
		user = (User) getSession().get(LOGIN_USER);
		
		Object[] values = {user.getId(), Integer.parseInt(foodId)};
		String sql = "select count(*) from user_favorites where user_id=? and food_id=?";
		CommonService cs = DatabaseFactory.getCommonService(ServletActionContext.getServletContext());
		
		List<Object> all = cs.executeSqlWithReport(sql, values);
		BigInteger bi = new BigInteger(String.valueOf(all.get(0)));
		
		int total = bi.intValue();
		String msg = null;
		if(total>0){
			msg = "你已经收藏过了";
			setJsondata(JsonUtil.ajax(false, msg));
		}else{
//			byte b = 1;
			UserFavorites uf = new UserFavorites();
			uf.setUserId(user.getId());
			uf.setFoodId(Long.parseLong(foodId));
			uf.setCollectTime(new Date());
			UserFavoritesService ufs = DatabaseFactory.getUserFavoritesService(ServletActionContext.getServletContext());
//			ufts.save(uft);
			ufs.save(uf);
			setJsondata(JsonUtil.ajax(true, msg));
		}
		
		return "userfavorites";
	}
	//取消收藏
	public String favoriteCancel(){
		user = new User();
		user = (User) getSession().get(LOGIN_USER);
		
		UserFavoritesService ufs = DatabaseFactory.getUserFavoritesService(ServletActionContext.getServletContext());
		CommonService cs = DatabaseFactory.getCommonService(ServletActionContext.getServletContext());
		
		List<SearchObject> params = new ArrayList<SearchObject>();
		params.add(SearchUtil.add(false, "userId", user.getId(),"="));
		params.add(SearchUtil.add(false, "foodId", Long.parseLong(foodId), "="));
		List<UserFavorites> all = ufs.findUserListByParams(params);
		String msg = null;
		if(all!=null && all.size()>0){
			for(UserFavorites uf:all){
				ufs.remove(uf);
			}
			setJsondata(JsonUtil.ajax(true, null));
		}else{
			msg = "你已经取消收藏";
			setJsondata(JsonUtil.ajax(false,msg));
		}
		return "favoritecancel";
	}
	public String userComment(){
		try{
			user = new User();
			user = (User) getSession().get(LOGIN_USER);
//			System.out.println(user.getLoginName());
			
			UserCommentService ucs = DatabaseFactory.getUserCommentService(ServletActionContext.getServletContext());
			CommonService cs = DatabaseFactory.getCommonService(ServletActionContext.getServletContext());
			
			UserComment uc=  new UserComment();
			uc.setFoodId(Long.parseLong(getFoodId()));
			uc.setUserId(user.getId());
			uc.setComment(getComment());
			uc.setCommentTime(new Date());
			String msg = null;
			ucs.save(uc);
			setJsondata(JsonUtil.ajax(true, null));
		}catch (Exception e) {
		}
		
		return "usercomment";
	}
}
