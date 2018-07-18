package com.recommendfood.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.recommendfood.factory.DatabaseFactory;
import com.recommendfood.model.AdminCheck;
import com.recommendfood.model.Food;
import com.recommendfood.model.FoodCategory;
import com.recommendfood.model.User;
import com.recommendfood.model.UserRecommend;
import com.recommendfood.service.AdminCheckService;
import com.recommendfood.service.CommonService;
import com.recommendfood.service.FoodCategoryService;
import com.recommendfood.service.FoodService;
import com.recommendfood.service.UserRecommendService;
import com.recommendfood.service.UserService;
import com.recommendfood.util.JsonUtil;
import com.recommendfood.util.QueryTypeEnum;
import com.recommendfood.util.SearchObject;
import com.recommendfood.util.SearchRelation;
import com.recommendfood.util.SearchUtil;

//管理员界面类
public class AdminManagerAction extends CommonAction{
	private User user = new User();
	private String ids;//传过来的id
	private String pageType;//页面类型
	private int pageTotal;//页面总数
	private int recordSize;//总记录数
	private String status;//更新状态;
	private List all;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getPageType() {
		return pageType;
	}
	public void setPageType(String pageType) {
		this.pageType = pageType;
	}
	public int getPageTotal() {
		return pageTotal;
	}
	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}
	public int getRecordSize() {
		return recordSize;
	}
	public void setRecordSize(int recordSize) {
		this.recordSize = recordSize;
	}
	public List getAll() {
		return all;
	}
	public void setAll(List all) {
		this.all = all;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	//加载用户数据
	public String userControl(){
		try{
			UserService us = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
			
			user = (User) getSession().get(LOGIN_USER);
			int pageSize = 5;
			
			List<SearchObject> params = new ArrayList<SearchObject>();
			params.add(SearchUtil.add(false,"userType", 1, "="));
			if(getQuery()!=null && !("").equals(getQuery())){
				List<SearchObject> lists = new ArrayList<SearchObject>();
				lists.add(SearchUtil.add(false, "loginName", getQuery(),true));
				lists.add(SearchUtil.add(true, "phone", getQuery(),true));
				lists.add(SearchUtil.add(true, "email", getQuery(),true));
				params.add(SearchUtil.add(false, lists));
			}
			long total = us.findTotalRecord(params, QueryTypeEnum.TOTAL_RECORD);
			long pageTotal = (total%pageSize==0?(total/pageSize):(total/pageSize)+1);
			setPageTotal((int)pageTotal);
			setRecordSize((int)total);
			if(pageType!=null && "endpage".equals(pageType)){
				setPageIndex((int) pageTotal);
			}else{
				if(getPageIndex()<=0){
					setPageIndex(1);
				}else if(getPageIndex()>pageTotal){
					setPageIndex((int)pageTotal);
				}
			}
			
			int firstResult = (getPageIndex()-1)*pageSize;
			
			Map<String, String> orderColumns = new HashMap<String, String>();
			orderColumns.put("status", "desc");
			List<User> all =  us.findUserListByParamsWithOrderAndPage(params, orderColumns, firstResult, pageSize);
	//		System.out.println(all.size());
			setDataList(all);
		}catch (Exception e) {
			setMessage("");
		}
		return "usercontrol";
	}
	//改变用户的状态
	public String changeUserStatus(){
		try{
//			System.out.println("ids:"+ids);
			
			CommonService cs = DatabaseFactory.getCommonService(ServletActionContext.getServletContext());
			UserService us = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
			
			String msg = null;
			String[] idarr = ids.split(",");
			if(idarr!=null && idarr.length>0){
				String sql = "update user set status=? where id=?";
				for(String s:idarr){
					User u = us.get(Long.parseLong(s));
					if(u!=null){
						int status=(u.getStatus()==1)?0:1;
						u.setStatus(status);
						us.update(u);
					}else{
						msg = "更新失败";
					}
				}
			}
			if(msg!=null && msg.length()>0){
				setJsondata(JsonUtil.ajax(false, msg));
			}else{
				setJsondata(JsonUtil.ajax(true, msg));
			}
		}catch (Exception e) {
			setMessage("");
		}
		
		return "changeuserstatus";
	}
	//上传申请
	public String recommendCheck(){
		try{
			UserService us = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
			
			user = (User) getSession().get(LOGIN_USER);
			int pageSize = 5;
			
			List<SearchObject> params = new ArrayList<SearchObject>();
			params.add(SearchUtil.add(false,"userType", 1, "="));
			
			long total = us.findTotalRecord(params, QueryTypeEnum.TOTAL_RECORD);
			long pageTotal = (total%pageSize==0?(total/pageSize):(total/pageSize)+1);
			if(pageType!=null && "endpage".equals(pageType)){
				setPageIndex((int) pageTotal);
			}else{
				if(getPageIndex()<=0){
					setPageIndex(1);
				}else if(getPageIndex()>pageTotal){
					setPageIndex((int)pageTotal);
				}
			}
			
			int firstResult = (getPageIndex()-1)*pageSize;
			
			Map<String, String> orderColumns = new HashMap<String, String>();
			orderColumns.put("status", "desc");
			List<User> all =  us.findUserListByParamsWithOrderAndPage(params, orderColumns, firstResult, pageSize);
	//		System.out.println(all.size());
			setDataList(all);
		}catch (Exception e) {
			setMessage("");
		}
		return "recommendcheck";
	}
	
	/*审核申请查询*/
	public String reviewFood() {
		UserRecommendService fs = DatabaseFactory.getUserRecommendService(ServletActionContext.getServletContext());
		FoodCategoryService fcs = DatabaseFactory.getFoodCategoryService(ServletActionContext.getServletContext());
		List<SearchObject> params = new ArrayList<SearchObject>();
		List<SearchObject> params2 = new ArrayList<SearchObject>();
		params2.add(SearchUtil.add(false, "checkInfo", 2));
		List<SearchRelation> relations = new ArrayList<SearchRelation>();
		relations.add(SearchUtil.addRelation("Food", "id", "f", true, null, "UserRecommend", "foodId"));
		relations.add(SearchUtil.addRelation("User", "id", "user", true, null, "UserRecommend", "userId"));
		relations.add(SearchUtil.addRelation("AdminCheck", "recommendId", "ac", false, params2, "UserRecommend", "id"));
		List<Object[]> foods = fs.getListByParams(params, relations);
		
		//查看未审核对象
		List<UserRecommend> allList = new ArrayList<UserRecommend>();
		for(Object[] objs:foods){
			UserRecommend ur = (UserRecommend) objs[0];
			Food food = (Food) objs[1];
			User user = (User) objs[2];
			ur.setFoodName(food.getName());
			ur.setFoodIntroduce(food.getIntroduction());
			ur.setFoodPictures(food.getPictures().split("%")[0]);
			String urId = food.getFoodType();
			String[] ids = urId.split(",");
			StringBuffer sb = new StringBuffer();
			for(String s : ids) {
				String fsname = fcs.get(Integer.parseInt(s)).getName();
				sb.append(fsname + ",");
			}
			ur.setFoodTypes(sb.toString());
			ur.setUserLoginName(user.getLoginName());
			allList.add(ur);
		}
		setDataList(allList);
		
		List<SearchObject> paramss= new ArrayList<SearchObject>();
		List<SearchObject> params3 = new ArrayList<SearchObject>();
		params3.add(SearchUtil.add(false, "checkInfo", 2, "!="));
		List<SearchRelation> relations3 = new ArrayList<SearchRelation>();
		relations3.add(SearchUtil.addRelation("Food", "id", "f", true, null, "UserRecommend", "foodId"));
		relations3.add(SearchUtil.addRelation("User", "id", "user", true, null, "UserRecommend", "userId"));
		relations3.add(SearchUtil.addRelation("AdminCheck", "recommendId", "ac", true, params3, "UserRecommend", "id"));
		List<Object[]> foods2 = fs.getListByParams(paramss, relations3);
		
		//查询审核对象
		List<UserRecommend> allList2 = new ArrayList<UserRecommend>();
		for(Object[] objs:foods2) {
			UserRecommend ur = (UserRecommend) objs[0];
			Food food = (Food) objs[1];
			User user = (User) objs[2];
			AdminCheck ac = (AdminCheck)objs[3];
			ur.setFoodName(food.getName());
			ur.setFoodIntroduce(food.getIntroduction());
			ur.setFoodPictures(food.getPictures().split("%")[0]);
			String urId = food.getFoodType();
			String[] ids = urId.split(",");
			StringBuffer sb = new StringBuffer();
			for(String s : ids) {
				String fsname = fcs.get(Integer.parseInt(s)).getName();
				sb.append(fsname + ",");
			}
			ur.setFoodTypes(sb.toString());
			ur.setUserLoginName(user.getLoginName());
			ur.setPassCheck(ac.getCheckInfo()==1?true:false);
			allList2.add(ur);
		}
		setAll(allList2);
		
		return "reviewfood";
	}
	//管理员审核
	public String adminCheck(){
		try{
			ServletContext sc = ServletActionContext.getServletContext();
			CommonService cs = DatabaseFactory.getCommonService(sc);
			AdminCheckService acs = DatabaseFactory.getAdminCheckService(sc);
			FoodService fs = DatabaseFactory.getFoodService(sc);
			UserRecommendService urs = DatabaseFactory.getUserRecommendService(sc);
			
			int checkstatus = 0;
//			System.out.println(getStatus());
			if(getStatus()!=null && ("agree").equals(getStatus())){
				checkstatus=1;
			}else if(getStatus()!=null && ("disagree").equals(getStatus())){
				checkstatus=0;
			}
//			System.out.println(checkstatus);
			for(String s:ids.split(",")){
				AdminCheck ac = acs.get(Long.parseLong(s));
				ac.setCheckInfo(checkstatus);
				acs.update(ac);
				Food f = fs.get(urs.get(ac.getRecommendId()).getFoodId());
				f.setStatus(checkstatus);
				fs.update(f);
			}
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return "admincheck";
	}
}
