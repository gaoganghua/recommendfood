package com.recommendfood.action;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.recommendfood.factory.DatabaseFactory;
import com.recommendfood.model.Food;
import com.recommendfood.model.UserComment;
import com.recommendfood.model.UserFoodThumbsup;
import com.recommendfood.service.CommonService;
import com.recommendfood.service.FoodCategoryService;
import com.recommendfood.service.FoodService;
import com.recommendfood.service.UserCommentService;
import com.recommendfood.service.UserFoodThumbsupService;
import com.recommendfood.util.JsonUtil;
import com.recommendfood.util.SearchObject;
import com.recommendfood.util.SearchRelation;
import com.recommendfood.util.SearchUtil;

//美食推荐处理类
public class RecommendAction extends CommonAction<Food>{

	//美食推荐首页
	public String index(){
		FoodService fs = DatabaseFactory.getFoodService(ServletActionContext.getServletContext());
		CommonService cs = DatabaseFactory.getCommonService(ServletActionContext.getServletContext());
		FoodCategoryService fcs = DatabaseFactory.getFoodCategoryService(ServletActionContext.getServletContext());
//		UserCommentService ucs = DatabaseFactory.getUserCommentService(ServletActionContext.getServletContext());
//		UserFoodThumbsupService ufts = DatabaseFactory.getUserFoodThumbsupService(ServletActionContext.getServletContext());
		
		int size = 6;
		if(getPageIndex()==0){
			setPageIndex(1);
		}
		int firstResult = (getPageIndex()-1)*size;
		
		List<Object> counts = cs.executeHql("select count(*) from Food f where f.status=1");
		long count = (long) counts.get(0);
//		System.out.println(count + ":" + maxResult);
		if(count<firstResult){
			setMessage("已经是最后一页了");
			setPageIndex(getPageIndex()-1);
			firstResult = (getPageIndex()-1)*size;
		}
		
		List<SearchObject> params = new LinkedList<SearchObject>();
		params.add(SearchUtil.add(false, "status", 1));
		List<Food> foods = fs.findFoodListByParamsWithOrderAndPage(params, firstResult, size);
		for(Food f:foods){
			String hql = "select count(*) from UserComment uc where uc.foodId=?";
			List<Object> lists1 = cs.executeHql(hql, new Object[]{f.getId()});
			Long total = 0L;
			if(lists1!=null && lists1.size()>0){
				total = (Long) lists1.get(0);
			}
			f.setCommentTotal(total.intValue());
			String hql2 = "select count(*) from UserFoodThumbsup uft where uft.foodId=?";
			List<Object> lists2 = cs.executeHql(hql, new Object[]{f.getId()});
			Long total2 = 0L;
			if(lists2!=null && lists2.size()>0){
				total2 = (Long) lists2.get(0);
			}
			f.setThumbsupTotal(total2.intValue());
			String[] ids = f.getFoodType().split(",");
			StringBuffer sbname = new StringBuffer();
			for(String idd:ids){
				sbname.append(fcs.get(Integer.parseInt(idd)).getName()+",");
			}
			sbname.deleteCharAt(sbname.length()-1);
			f.setFoodType(sbname.toString());
		}
		setDataList(foods);
		
		return "index";
	}
}
